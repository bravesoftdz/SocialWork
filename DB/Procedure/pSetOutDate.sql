USE [SocialWorkDB]
GO
/****** 개체:  StoredProcedure [SocialWorker].[pSetOutDate]    스크립트 날짜: 03/23/2012 17:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [SocialWorker].[pSetOutDate]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

	UPDATE InOut SET OutDate='' WHERE OutDate IS NULL
	UPDATE InOut SET OutTime='00:00:00' WHERE OutTime IS NULL
END
