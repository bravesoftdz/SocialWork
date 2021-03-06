USE [SocialWorkDB]
GO
/****** 개체:  StoredProcedure [SocialWorker].[pInOut]    스크립트 날짜: 03/23/2012 17:18:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nikki,Ji
-- Create date: 2012.03.05
-- Description:	입원환자의 해당일자 입원정보 가져오기
-- =============================================
CREATE PROCEDURE [SocialWorker].[pInOut]
	-- Add the parameters for the stored procedure here
	@HospitalID int = -1,
	@CurDate varchar(10) = '9999-99-99',
	@PPYearMonth varchar(7) = '',
	@SearchCondition int = 0,
	@SearchText varchar(20) = '',
	@WardID int = -1,
	@InOutState int = -1,
	@BohumID int = -1,
	@Order int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @STR varchar(1000)

	SET @STR =	'SELECT *' +
				--'       ,(select SEQ from Wards where WardID=W.WardID) as WardSEQ' +
				'       ,(select WardName from Wards where WardID = W.WardID) as WardName';

	SET @STR = @STR + '  FROM vInOut AS I' +
			    	  '		INNER JOIN WardHistory AS W' +
				      '				ON I.InOutID=W.InOutID' +
				      '			   AND W.WardDate = (select max(WardDate) from WardHistory where W.InOutID=InOutID and WardDate <= ''' + @CurDate + ''')' +
				      ' WHERE HospitalID=' + CONVERT(varchar(50), @HospitalID);
	IF @CurDate <> '9999-99-99'
		SET @STR = @STR + '   AND (OutDate='''' OR OutDate > ''' + @CurDate + ''')'

	IF @SearchText <> ''
		IF @SearchCondition = 0
			SET @STR = @STR + '   AND PatientName LIKE ''%' + @SearchText + '%'''
		ELSE
			SET @STR = @STR + '   AND PatientID LIKE ''%' + @SearchText + '%'''

	IF @WardID > -1
		SET @STR = @STR + '   AND WardID=' + CONVERT(varchar(50), @WardID)

	IF @InOutState = 0
		SET @STR = @STR + '   AND OutDate <= '''''
	ELSE IF @InOutState = 1
		SET	 @STR = @STR + '   AND OutDate > '''''

	IF @InOutState > -1
		SET @STR = @STR + '   AND State=' + CONVERT(varchar(1), @InOutState)

	IF @BohumID > -1
		SET @STR = @STR + '   AND BohumID=' + CONVERT(varchar(50), @BohumID)

	IF @PPYearMonth <> ''
		SET @STR = @STR + '   AND I.InOutID in (select distinct InOutID from vProgramPatients where SDate like ''' + @PPYearMonth + '%'')'

	SET @STR = @STR +
	CASE @Order WHEN 0 THEN ' ORDER BY PatientName'
                WHEN 1 THEN ' ORDER BY PatientID'
				WHEN 2 THEN ' ORDER BY WardName'
				WHEN 3 THEN	' ORDER BY InDate'
				ELSE		' ORDER BY BohumName'
	END

	EXEC (@STR)
END




