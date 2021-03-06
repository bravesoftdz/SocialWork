USE [SocialWorkDB]
GO
/****** 개체:  StoredProcedure [SocialWorker].[SaveLog]    스크립트 날짜: 03/23/2012 17:19:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [SocialWorker].[SaveLog] 
	-- Add the parameters for the stored procedure here
	@HospitalID int,
	@UserID varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO LoginLog (HospitalID, UserID, LoginTime)
    VALUES (@HospitalID, @UserID, GetDate())
END

