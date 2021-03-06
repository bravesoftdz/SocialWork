SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[ProgramTypes]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[ProgramTypes](
	[ProgramTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramTypeName] [nvarchar](20) NULL,
	[Used] [bit] NOT NULL DEFAULT (1),
	[Seq] [int] NULL,
	[LinkRecord] [bit] NULL,
 CONSTRAINT [PK22] PRIMARY KEY NONCLUSTERED 
(
	[ProgramTypeID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[ShortKeys]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[ShortKeys](
	[HospitalID] [int] NOT NULL,
	[Keyword] [nvarchar](20) NOT NULL,
	[Content] [nvarchar](1000) NULL,
 CONSTRAINT [PK44] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC,
	[Keyword] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[WardHistory]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[WardHistory](
	[InOutID] [int] NOT NULL,
	[WardDate] [varchar](10) NOT NULL,
	[WardID] [int] NULL,
 CONSTRAINT [PK_WardHistory] PRIMARY KEY CLUSTERED 
(
	[InOutID] ASC,
	[WardDate] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Keyword]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Keyword](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Parent] [numeric](18, 0) NULL,
	[HospitalID] [int] NULL,
	[Keyword] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[Content] [nvarchar](3000) NULL,
 CONSTRAINT [PK_Keywords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RecordNameDefault]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[RecordNameDefault](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_RecordNameDefault] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RecordName]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[RecordName](
	[HospitalID] [int] NULL,
	[ID] [int] NOT NULL,
	[CustomName] [nvarchar](50) NULL,
 CONSTRAINT [PK_RecordName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[pInOut]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Nikki,Ji
-- Create date: 2012.03.05
-- Description:	입원환자의 해당일자 입원정보 가져오기
-- =============================================
CREATE PROCEDURE [SocialWorker].[pInOut]
	-- Add the parameters for the stored procedure here
	@HospitalID int = -1,
	@CurDate varchar(10) = ''9999-99-99'',
	@PPYearMonth varchar(7) = '''',
	@SearchCondition int = 0,
	@SearchText varchar(20) = '''',
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

	SET @STR =	''SELECT *'' +
				--''       ,(select SEQ from Wards where WardID=W.WardID) as WardSEQ'' +
				''       ,(select WardName from Wards where WardID = W.WardID) as WardName'';

	SET @STR = @STR + ''  FROM vInOut AS I'' +
			    	  ''		INNER JOIN WardHistory AS W'' +
				      ''				ON I.InOutID=W.InOutID'' +
				      ''			   AND W.WardDate = (select max(WardDate) from WardHistory where W.InOutID=InOutID and WardDate <= '''''' + @CurDate + '''''')'' +
				      '' WHERE HospitalID='' + CONVERT(varchar(50), @HospitalID);
	IF @CurDate <> ''9999-99-99''
		SET @STR = @STR + ''   AND (OutDate='''''''' OR OutDate > '''''' + @CurDate + '''''')''

	IF @SearchText <> ''''
		IF @SearchCondition = 0
			SET @STR = @STR + ''   AND PatientName LIKE ''''%'' + @SearchText + ''%''''''
		ELSE
			SET @STR = @STR + ''   AND PatientID LIKE ''''%'' + @SearchText + ''%''''''

	IF @WardID > -1
		SET @STR = @STR + ''   AND WardID='' + CONVERT(varchar(50), @WardID)

	IF @InOutState = 0
		SET @STR = @STR + ''   AND OutDate <= ''''''''''
	ELSE IF @InOutState = 1
		SET	 @STR = @STR + ''   AND OutDate > ''''''''''

	IF @InOutState > -1
		SET @STR = @STR + ''   AND State='' + CONVERT(varchar(1), @InOutState)

	IF @BohumID > -1
		SET @STR = @STR + ''   AND BohumID='' + CONVERT(varchar(50), @BohumID)

	IF @PPYearMonth <> ''''
		SET @STR = @STR + ''   AND I.InOutID in (select distinct InOutID from vProgramPatients where SDate like '''''' + @PPYearMonth + ''%'''')''

	SET @STR = @STR +
	CASE @Order WHEN 0 THEN '' ORDER BY PatientName''
                WHEN 1 THEN '' ORDER BY PatientID''
				WHEN 2 THEN '' ORDER BY WardName''
				WHEN 3 THEN	'' ORDER BY InDate''
				ELSE		'' ORDER BY BohumName''
	END

	EXEC (@STR)
END




' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[LoginLog]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[LoginLog](
	[HospitalID] [int] NOT NULL,
	[UserID] [varchar](10) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LoginLog] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC,
	[UserID] ASC,
	[LoginTime] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Test2]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [SocialWorker].[Test2]
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Count int;
	
	execute @Count = test1;

	--SELECT @Count = @Count + 100;
	--SELECT @Count
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Bohum]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Bohum](
	[BohumID] [int] IDENTITY(1,1) NOT NULL,
	[BohumName] [varchar](50) NULL,
	[Seq] [int] NULL,
	[Used] [bit] NULL,
 CONSTRAINT [PK_Bohum] PRIMARY KEY CLUSTERED 
(
	[BohumID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[OverNight]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[OverNight](
	[InOutID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[FinishTime] [datetime] NULL,
	[Comment] [nvarchar](1000) NULL,
	[OvernightState] [int] NOT NULL CONSTRAINT [DF_OverNight_State]  DEFAULT (0),
 CONSTRAINT [PK_OverNight] PRIMARY KEY CLUSTERED 
(
	[InOutID] ASC,
	[StartTime] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Hospitals]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Hospitals](
	[HospitalID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [varchar](50) NULL,
	[HospitalNo] [varchar](10) NULL,
	[HospitalImage] [image] NULL,
	[Used] [bit] NOT NULL CONSTRAINT [DF__Hospitals__Used__72910220]  DEFAULT (1),
 CONSTRAINT [PK1] PRIMARY KEY NONCLUSTERED 
(
	[HospitalID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Visit]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Visit](
	[VisitID] [int] IDENTITY(1,1) NOT NULL,
	[InOutID] [int] NOT NULL,
	[Seq] [int] NOT NULL,
	[VisitDate] [varchar](10) NULL,
	[VisitTime] [varchar](8) NULL,
	[Accompany] [int] NULL,
	[AccompanyETC] [nvarchar](30) NULL,
	[Prognosis] [nvarchar](50) NULL,
	[Opinion] [nvarchar](50) NULL,
	[PName] [nvarchar](20) NULL,
	[PSex] [varchar](2) NULL,
	[PAge] [numeric](3, 0) NULL,
	[PAddress] [nvarchar](100) NULL,
	[PTel] [nvarchar](30) NULL,
	[Phimself] [int] NULL,
	[PhimselfETC] [nvarchar](30) NULL,
	[PBohum] [int] NULL,
	[PBohumETC] [nvarchar](30) NULL,
	[A1] [nvarchar](50) NULL,
	[A2] [nvarchar](50) NULL,
	[A3] [nvarchar](50) NULL,
	[A4] [nvarchar](50) NULL,
	[B1] [nvarchar](50) NULL,
	[B2] [nvarchar](50) NULL,
	[B3] [nvarchar](50) NULL,
	[B4] [nvarchar](50) NULL,
	[B5] [nvarchar](50) NULL,
	[C1] [nvarchar](50) NULL,
	[C2] [nvarchar](50) NULL,
	[C3] [nvarchar](50) NULL,
	[C4] [nvarchar](50) NULL,
	[C5] [nvarchar](50) NULL,
	[D1] [nvarchar](1000) NULL,
	[D2] [nvarchar](1000) NULL,
	[E1] [nvarchar](1000) NULL,
	[E2] [nvarchar](1000) NULL,
	[Comment] [nvarchar](1000) NULL,
	[WriteDate] [varchar](10) NULL,
	[Writer] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Programs]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Programs](
	[ProgramID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramName] [nvarchar](30) NULL,
	[Color] [int] NULL,
	[RegDate] [varchar](10) NULL,
	[ProgramTypeID] [int] NOT NULL,
	[HospitalID] [int] NOT NULL,
	[UseAll] [bit] NULL,
	[Used] [bit] NOT NULL CONSTRAINT [DF__Programs__Delete__01D345B0]  DEFAULT (1),
	[WardID] [int] NULL,
	[LinkRecordID] [int] NULL CONSTRAINT [DF_Programs_LinkRecordID]  DEFAULT ((-1)),
 CONSTRAINT [PK21] PRIMARY KEY NONCLUSTERED 
(
	[ProgramID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Schedule]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Schedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](255) NULL,
	[Message] [varchar](255) NULL,
	[StartTime] [datetime] NULL,
	[EventType] [int] NULL,
	[FinishTime] [datetime] NULL,
	[SDate] [varchar](10) NULL,
	[STime] [varchar](8) NULL,
	[FDate] [varchar](10) NULL,
	[FTime] [varchar](8) NULL,
	[Options] [int] NULL,
	[State] [int] NULL,
	[WorkerID] [nvarchar](10) NULL,
	[LocationIDs] [varchar](255) NULL,
	[ChairmanIDs] [nvarchar](255) NULL,
	[ChairmanNames] [nvarchar](255) NULL,
	[ChairmanOpinion] [nvarchar](1000) NULL,
	[WorkerOpinion] [nvarchar](1000) NULL,
	[DoctorOpinion] [nvarchar](1000) NULL,
	[HospitalID] [int] NOT NULL,
	[WardID] [int] NOT NULL,
	[DoctorID] [nvarchar](50) NULL,
	[ProgramID] [int] NOT NULL,
	[Writer] [nvarchar](10) NULL,
	[WriteDate] [varchar](10) NULL,
 CONSTRAINT [PK17] PRIMARY KEY NONCLUSTERED 
(
	[ScheduleID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[InOut]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[InOut](
	[InOutID] [int] IDENTITY(1,1) NOT NULL,
	[InDate] [varchar](10) NOT NULL,
	[InTime] [varchar](8) NULL,
	[OutDate] [varchar](10) NULL,
	[OutTime] [varchar](8) NULL,
	[State] [int] NULL,
	[DiagName] [nvarchar](100) NOT NULL,
	[DoctorID] [nvarchar](10) NULL,
	[HospitalID] [int] NOT NULL,
	[UserID] [nvarchar](10) NOT NULL,
	[InTypeID] [int] NOT NULL,
	[PatientID] [varchar](12) NOT NULL,
	[BohumID] [int] NULL,
	[Room] [nvarchar](30) NULL,
 CONSTRAINT [PK25] PRIMARY KEY NONCLUSTERED 
(
	[InOutID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Families]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Families](
	[FamilyID] [int] IDENTITY(1,1) NOT NULL,
	[FamilyName] [nvarchar](20) NULL,
	[InMate] [bit] NOT NULL DEFAULT (1),
	[Health] [nvarchar](30) NULL,
	[Pay] [bit] NULL,
	[RelationshipID] [int] NOT NULL,
	[InOutID] [int] NOT NULL,
 CONSTRAINT [PK42] PRIMARY KEY NONCLUSTERED 
(
	[FamilyID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[ProgramPatients]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[ProgramPatients](
	[ScheduleID] [int] NOT NULL,
	[InOutID] [int] NOT NULL,
	[Result] [nvarchar](1000) NULL,
	[Selected] [bit] NOT NULL CONSTRAINT [DF_ProgramPatients_Selected]  DEFAULT (0),
	[WardID] [int] NULL,
	[WardDate] [varchar](10) NULL,
 CONSTRAINT [PK_ProgramPatients] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC,
	[InOutID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[InTypes]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[InTypes](
	[InTypeID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalID] [int] NOT NULL,
	[InTypeName] [nvarchar](20) NULL,
	[Used] [bit] NOT NULL DEFAULT (1),
 CONSTRAINT [PK46] PRIMARY KEY CLUSTERED 
(
	[InTypeID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Locations]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](20) NULL,
	[HospitalID] [int] NOT NULL,
	[Used] [bit] NOT NULL DEFAULT (1),
 CONSTRAINT [PK40] PRIMARY KEY NONCLUSTERED 
(
	[LocationID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Patients]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Patients](
	[HospitalID] [int] NOT NULL,
	[PatientID] [varchar](12) NOT NULL,
	[PatientName] [nvarchar](20) NULL,
	[SEX] [varchar](2) NULL,
	[BIRTHDAY] [varchar](10) NULL,
 CONSTRAINT [PK4] PRIMARY KEY NONCLUSTERED 
(
	[HospitalID] ASC,
	[PatientID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Users]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Users](
	[HospitalID] [int] NOT NULL,
	[UserID] [nvarchar](10) NOT NULL,
	[Password] [varchar](100) NULL,
	[UserName] [nvarchar](20) NULL,
	[Worker] [bit] NULL,
	[Doctor] [bit] NULL,
	[Admin] [bit] NULL DEFAULT (0),
	[Used] [bit] NOT NULL DEFAULT (1),
 CONSTRAINT [PK2] PRIMARY KEY NONCLUSTERED 
(
	[HospitalID] ASC,
	[UserID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Wards]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Wards](
	[WardID] [int] IDENTITY(1,1) NOT NULL,
	[WardName] [nvarchar](20) NULL,
	[HospitalID] [int] NOT NULL,
	[Used] [bit] NOT NULL DEFAULT (1),
	[Seq] [int] NOT NULL CONSTRAINT [DF_Wards_Seq]  DEFAULT (0),
 CONSTRAINT [PK3] PRIMARY KEY NONCLUSTERED 
(
	[WardID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Relationships]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Relationships](
	[RelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalID] [int] NOT NULL,
	[RelationshipName] [nvarchar](20) NULL,
	[Seq] [int] NULL,
	[Used] [bit] NULL,
 CONSTRAINT [PK43] PRIMARY KEY NONCLUSTERED 
(
	[RelationshipID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Survey2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Survey2](
	[InOutID] [int] NOT NULL,
	[Q1] [int] NULL,
	[Q2] [int] NULL,
	[Q3] [int] NULL,
	[Q4] [int] NULL,
	[Q5] [int] NULL,
	[Q6] [int] NULL,
	[Q7] [int] NULL,
	[Q8] [int] NULL,
	[Q9] [int] NULL,
	[Q10] [int] NULL,
	[Q11] [int] NULL,
	[Q12] [int] NULL,
	[Q13] [int] NULL,
	[Q14] [int] NULL,
	[WorkerOpinion] [nvarchar](3000) NULL,
	[MeetingDate] [varchar](10) NULL,
	[WriteDate] [varchar](10) NULL,
	[Writer] [nvarchar](50) NULL,
 CONSTRAINT [PK14] PRIMARY KEY NONCLUSTERED 
(
	[InOutID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Training]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Training](
	[TrainingID] [int] IDENTITY(1,1) NOT NULL,
	[InOutID] [int] NOT NULL,
	[Seq] [int] NULL,
	[Request] [nvarchar](255) NULL,
	[Purpose] [nvarchar](255) NULL,
	[IntervationCourse] [nvarchar](1000) NULL,
	[WorkerOpinion] [nvarchar](3000) NULL,
	[MeetingDate] [varchar](10) NULL,
	[WriteDate] [varchar](10) NULL,
	[Writer] [nvarchar](50) NULL,
 CONSTRAINT [PK_Training] PRIMARY KEY CLUSTERED 
(
	[TrainingID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Intake]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Intake](
	[InOutID] [int] NOT NULL,
	[InfoDonor] [nvarchar](15) NULL,
	[InMotivation] [nvarchar](1000) NULL,
	[MajorProblem] [nvarchar](1000) NULL,
	[InHistory] [nvarchar](1000) NULL,
	[PersonHistory] [nvarchar](3000) NULL,
	[WorkerOpinion] [nvarchar](3000) NULL,
	[MeetingDate] [varchar](10) NULL,
	[WriteDate] [varchar](10) NULL,
	[Writer] [nvarchar](50) NULL,
 CONSTRAINT [PK12] PRIMARY KEY NONCLUSTERED 
(
	[InOutID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Counseling]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Counseling](
	[CounselingID] [int] IDENTITY(1,1) NOT NULL,
	[InOutID] [int] NOT NULL,
	[Seq] [int] NULL,
	[A1] [bit] NULL,
	[A2] [bit] NULL,
	[A3] [bit] NULL,
	[A4] [bit] NULL,
	[A5] [bit] NULL,
	[B1] [bit] NULL,
	[B2] [bit] NULL,
	[B3] [bit] NULL,
	[B4] [bit] NULL,
	[B5] [bit] NULL,
	[C1] [bit] NULL,
	[C2] [bit] NULL,
	[C3] [bit] NULL,
	[D1] [bit] NULL,
	[D2] [bit] NULL,
	[E1] [bit] NULL,
	[E2] [bit] NULL,
	[E3] [bit] NULL,
	[E4] [bit] NULL,
	[F1] [bit] NULL,
	[F2] [bit] NULL,
	[WorkerOpinion] [nvarchar](3000) NULL,
	[MeetingDate] [varchar](10) NULL,
	[WriteDate] [varchar](10) NULL,
	[Writer] [nvarchar](10) NULL,
 CONSTRAINT [PK_Counseling] PRIMARY KEY CLUSTERED 
(
	[CounselingID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[Survey1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [SocialWorker].[Survey1](
	[InOutID] [int] NOT NULL,
	[Address] [nvarchar](50) NULL,
	[TelHome] [nvarchar](20) NULL,
	[TelMobile] [nvarchar](20) NULL,
	[Religion] [int] NULL,
	[ReligionEtc] [nvarchar](20) NULL,
	[InsuType] [int] NULL,
	[InsuETC] [varchar](255) NULL,
	[HousingType] [int] NULL,
	[HousingYear] [nvarchar](20) NULL,
	[HousingMonth] [nvarchar](20) NULL,
	[EconomicType] [int] NULL,
	[EconomicEtc] [nvarchar](20) NULL,
	[Career] [int] NULL,
	[ArmyCareer] [int] NULL,
	[ArmyEtc] [nvarchar](20) NULL,
	[Property] [nvarchar](50) NULL,
	[Estate] [nvarchar](50) NULL,
	[Protector] [int] NULL,
	[ProtectorEtc] [nvarchar](20) NULL,
	[ToSolveProblem] [int] NULL,
	[Expectation] [int] NULL,
	[ExpectationETC] [nvarchar](20) NULL,
	[ResourceAfterLeaving] [nvarchar](200) NULL,
	[ETC] [nvarchar](200) NULL,
	[InfoDonor] [nvarchar](20) NULL,
	[SurveyDate] [varchar](10) NULL,
	[WriteDate] [varchar](10) NULL,
	[Writer] [nvarchar](10) NULL,
 CONSTRAINT [PK13] PRIMARY KEY NONCLUSTERED 
(
	[InOutID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[vPPSchedule]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [SocialWorker].[vPPSchedule]
AS
SELECT     SocialWorker.ProgramPatients.ScheduleID, SocialWorker.ProgramPatients.InOutID, SocialWorker.ProgramPatients.Result, 
                      SocialWorker.ProgramPatients.Selected, SocialWorker.ProgramPatients.WardID, SocialWorker.ProgramPatients.WardDate, 
                      SocialWorker.Schedule.SDate, SocialWorker.Programs.ProgramTypeID, SocialWorker.Programs.LinkRecordID, SocialWorker.Schedule.FDate, 
                      SocialWorker.Schedule.STime, SocialWorker.Programs.ProgramName, SocialWorker.ProgramTypes.LinkRecord, SocialWorker.Schedule.HospitalID, 
                      SocialWorker.Schedule.StartTime, SocialWorker.Schedule.FinishTime
FROM         SocialWorker.ProgramPatients INNER JOIN
                      SocialWorker.Schedule ON SocialWorker.ProgramPatients.ScheduleID = SocialWorker.Schedule.ScheduleID INNER JOIN
                      SocialWorker.Programs ON SocialWorker.Schedule.ProgramID = SocialWorker.Programs.ProgramID INNER JOIN
                      SocialWorker.ProgramTypes ON SocialWorker.Programs.ProgramTypeID = SocialWorker.ProgramTypes.ProgramTypeID
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'USER',N'SocialWorker', N'VIEW',N'vPPSchedule', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ProgramPatients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 159
               Right = 175
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Schedule"
            Begin Extent = 
               Top = 6
               Left = 213
               Bottom = 285
               Right = 375
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Programs"
            Begin Extent = 
               Top = 6
               Left = 413
               Bottom = 222
               Right = 569
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProgramTypes"
            Begin Extent = 
               Top = 6
               Left = 607
               Bottom = 153
               Right = 779
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vPPSchedule'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'USER',N'SocialWorker', N'VIEW',N'vPPSchedule', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vPPSchedule'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[vProgramPatients]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [SocialWorker].[vProgramPatients]
AS
SELECT     SocialWorker.vInOut.InDate, SocialWorker.vInOut.SEX, SocialWorker.vInOut.BIRTHDAY, SocialWorker.vInOut.BohumName, 
                      SocialWorker.vInOut.PatientName, SocialWorker.vInOut.PatientID, SocialWorker.Wards.WardName, SocialWorker.vInOut.HospitalID, 
                      SocialWorker.Schedule.SDate, SocialWorker.Programs.ProgramTypeID, SocialWorker.Programs.ProgramName, 
                      SocialWorker.ProgramPatients.ScheduleID, SocialWorker.ProgramPatients.InOutID, SocialWorker.ProgramPatients.Result, 
                      SocialWorker.ProgramPatients.Selected, SocialWorker.ProgramPatients.WardID, SocialWorker.ProgramPatients.WardDate, 
                      SocialWorker.vInOut.OutDate, SocialWorker.Schedule.Content, SocialWorker.Programs.LinkRecordID, SocialWorker.Schedule.STime, 
                      SocialWorker.Schedule.FDate, SocialWorker.vInOut.BohumID
FROM         SocialWorker.ProgramPatients INNER JOIN
                      SocialWorker.vInOut ON SocialWorker.ProgramPatients.InOutID = SocialWorker.vInOut.InOutID INNER JOIN
                      SocialWorker.Wards ON SocialWorker.ProgramPatients.WardID = SocialWorker.Wards.WardID INNER JOIN
                      SocialWorker.Schedule ON SocialWorker.ProgramPatients.ScheduleID = SocialWorker.Schedule.ScheduleID INNER JOIN
                      SocialWorker.Programs ON SocialWorker.Schedule.ProgramID = SocialWorker.Programs.ProgramID
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'USER',N'SocialWorker', N'VIEW',N'vProgramPatients', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ProgramPatients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 149
               Right = 175
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vInOut"
            Begin Extent = 
               Top = 0
               Left = 258
               Bottom = 277
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "Wards"
            Begin Extent = 
               Top = 3
               Left = 420
               Bottom = 118
               Right = 557
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Schedule"
            Begin Extent = 
               Top = 6
               Left = 568
               Bottom = 267
               Right = 730
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Programs"
            Begin Extent = 
               Top = 110
               Left = 85
               Bottom = 269
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = ' , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vProgramPatients'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'USER',N'SocialWorker', N'VIEW',N'vProgramPatients', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
      End
   End
End
' , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vProgramPatients'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'USER',N'SocialWorker', N'VIEW',N'vProgramPatients', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vProgramPatients'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[vInOut]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [SocialWorker].[vInOut]
AS
SELECT     Users_2.UserName AS DoctorName, CASE inout.state WHEN 0 THEN ''입원'' WHEN 1 THEN ''퇴원'' ELSE ''에러'' END AS StateName, 
                      SocialWorker.Patients.PatientName, SocialWorker.Patients.SEX, SocialWorker.Patients.BIRTHDAY, SocialWorker.Bohum.BohumName, 
                      SocialWorker.Bohum.Seq, SocialWorker.InTypes.InTypeName, SocialWorker.InOut.InOutID, SocialWorker.InOut.InDate, SocialWorker.InOut.InTime, 
                      SocialWorker.InOut.OutDate, SocialWorker.InOut.OutTime, SocialWorker.InOut.State, SocialWorker.InOut.DiagName, SocialWorker.InOut.DoctorID, 
                      SocialWorker.InOut.HospitalID, SocialWorker.InOut.UserID, SocialWorker.InOut.InTypeID, SocialWorker.InOut.PatientID, SocialWorker.InOut.BohumID, 
                      SocialWorker.InOut.Room, Users_1.UserName AS WorkerName
FROM         SocialWorker.InOut INNER JOIN
                      SocialWorker.Users AS Users_1 ON SocialWorker.InOut.HospitalID = Users_1.HospitalID AND 
                      SocialWorker.InOut.UserID = Users_1.UserID INNER JOIN
                      SocialWorker.Users AS Users_2 ON SocialWorker.InOut.HospitalID = Users_2.HospitalID AND 
                      SocialWorker.InOut.DoctorID = Users_2.UserID INNER JOIN
                      SocialWorker.Patients ON SocialWorker.InOut.HospitalID = SocialWorker.Patients.HospitalID AND 
                      SocialWorker.InOut.PatientID = SocialWorker.Patients.PatientID INNER JOIN
                      SocialWorker.Bohum ON SocialWorker.InOut.BohumID = SocialWorker.Bohum.BohumID INNER JOIN
                      SocialWorker.InTypes ON SocialWorker.InOut.InTypeID = SocialWorker.InTypes.InTypeID
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'USER',N'SocialWorker', N'VIEW',N'vInOut', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[62] 4[3] 2[34] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "InOut"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 345
               Right = 175
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Users_1"
            Begin Extent = 
               Top = 130
               Left = 832
               Bottom = 310
               Right = 969
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users_2"
            Begin Extent = 
               Top = 48
               Left = 990
               Bottom = 200
               Right = 1127
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Patients"
            Begin Extent = 
               Top = 250
               Left = 327
               Bottom = 424
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Bohum"
            Begin Extent = 
               Top = 206
               Left = 536
               Bottom = 321
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InTypes"
            Begin Extent = 
               Top = 6
               Left = 213
               Bottom = 121
               Right = 355
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 1500
         Width = 1500
       ' , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vInOut'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane2' , N'USER',N'SocialWorker', N'VIEW',N'vInOut', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vInOut'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'USER',N'SocialWorker', N'VIEW',N'vInOut', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vInOut'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[vLoginLog]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [SocialWorker].[vLoginLog]
AS
SELECT     SocialWorker.LoginLog.HospitalID, SocialWorker.LoginLog.UserID, SocialWorker.LoginLog.LoginTime, SocialWorker.Hospitals.HospitalName, 
                      SocialWorker.Users.UserName
FROM         SocialWorker.LoginLog INNER JOIN
                      SocialWorker.Hospitals ON SocialWorker.LoginLog.HospitalID = SocialWorker.Hospitals.HospitalID INNER JOIN
                      SocialWorker.Users ON SocialWorker.LoginLog.UserID = SocialWorker.Users.UserID AND 
                      SocialWorker.LoginLog.HospitalID = SocialWorker.Users.HospitalID
' 
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'USER',N'SocialWorker', N'VIEW',N'vLoginLog', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LoginLog"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 175
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Hospitals"
            Begin Extent = 
               Top = 0
               Left = 507
               Bottom = 143
               Right = 656
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 94
               Left = 350
               Bottom = 275
               Right = 487
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vLoginLog'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'USER',N'SocialWorker', N'VIEW',N'vLoginLog', NULL,NULL))
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vLoginLog'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[test1]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [SocialWorker].[test1]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @TEST int;

	SELECT @TEST = (SELECT count(*) from wards)

	RETURN @TEST

	
END

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[SaveLog]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
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

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[pSetOutDate]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
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

	UPDATE InOut SET OutDate='''' WHERE OutDate IS NULL
	UPDATE InOut SET OutTime=''00:00:00'' WHERE OutTime IS NULL
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[pGetSum]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Nikki,Ji>
-- Create date: <2012-03-23>
-- Description:	<프로그램 참가자 합계 구하기>
-- =============================================
CREATE PROCEDURE [SocialWorker].[pGetSum]
	@ExecuteType int,	-- 0: 합계 1: 날짜중복피한합계 2: 날짜중복피함MaxNum적용합계 3:날짜중복피함MaxNum, PrevDate 적용
	@HospitalID int,
	@BohumType	int,	-- 0: 보험 1: 보호
    @ProgramTypeID int,	-- 1: 일반 2: 작업
	@WardID int,
    @StartDate varchar(10),
	@FinishDate varchar(10),
	@PrevStartDate varchar(10),
	@PrevFinishDate varchar(10)
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @MaxNum int;
	DECLARE @BohumSet TABLE (BohumID int);
	DECLARE @SUM int;

	IF @ProgramTypeID = 0
		SET @MaxNum = 2;
    ELSE
		SET @MaxNum = 5;

	IF @BohumType = 0
	BEGIN 
		INSERT INTO @BohumSet (BohumID) VALUES (1);
		INSERT INTO @BohumSet (BohumID) VALUES (2);
		INSERT INTO @BohumSet (BohumID) VALUES (7);
	END
	ELSE
	BEGIN
		INSERT INTO @BohumSet (BohumID) VALUES (3);
		INSERT INTO @BohumSet (BohumID) VALUES (4);
		INSERT INTO @BohumSet (BohumID) VALUES (5);
	END

	IF @ExecuteType = 0
		SET @Sum = 	(	-- 합계
					SELECT COUNT(inoutid)	
				      FROM vProgramPatients
			 	     WHERE HospitalID = @HospitalID
				       AND bohumid IN (SELECT * FROM @BohumSet)
				       AND SDate BETWEEN @StartDate AND @FinishDate
				       AND ProgramTypeID=@ProgramTypeID
					   AND WardID=@WardID	
					)
	ELSE IF @ExecuteType = 1
		SET @SUM =	(	-- 중복피한합계
					SELECT COUNT(inoutid)	
					  FROM (
						   SELECT inoutid
						     FROM vProgramPatients
						    WHERE bohumid IN (SELECT * FROM @BohumSet)
						      AND HospitalID = @HospitalID
							  AND SDate BETWEEN @StartDate AND @FinishDate
							  AND ProgramTypeID=@ProgramTypeID
                                 AND WardID=@WardID
							GROUP BY inoutid, sdate
							) AS P
					)
	ELSE IF @ExecuteType = 2
		SET @SUM =  (	-- 중복피하고 MaxNum 적용
					SELECT SUM(cnt)		
					  FROM (
						   SELECT inoutid
                                  ,CASE WHEN COUNT(DISTINCT sdate)>@MaxNum THEN @MaxNum
                                        ELSE COUNT(DISTINCT sdate)
				                    END AS cnt
						     FROM vProgramPatients
						    WHERE bohumid IN (SELECT * FROM @BohumSet)
							  AND HospitalID = @HospitalID
							  AND SDate BETWEEN @StartDate AND @FinishDate
							  AND ProgramTypeID=@ProgramTypeID
							  AND WardID=@WardID
						    GROUP BY inoutid
							) AS P
					)
	ELSE IF @ExecuteType = 3
		SET @Sum =	(	-- 중복피하고 MaxNum적용 Preview 적용
					SELECT SUM(CurCnt)
					  FROM (
						   SELECT CASE WHEN PrevCnt > @MaxNum THEN @MaxNum
							           ELSE CASE WHEN PrevCnt + CurCnt > @MaxNum THEN @MaxNum - PrevCnt
										         ELSE CurCnt
										     END
							       END AS CurCnt
							 FROM (
								  SELECT inoutid
									     ,SUM(cnt) AS CurCnt
										 ,(
                                          SELECT COUNT(DISTINCT sdate)
										    FROM vProgramPatients
										   WHERE InOutID = P.InOutID
										     AND BohumID IN (SELECT * FROM @BohumSet)
											 AND SDate BETWEEN @PrevStartDate and @PrevFinishDate
											 AND ProgramTypeID=@ProgramTypeID
											 AND WardID=@WardID
										  ) AS PrevCnt        
									 FROM (
                                          SELECT inoutid, COUNT(DISTINCT sdate) AS cnt
								            FROM vProgramPatients
								           WHERE HospitalID = @HospitalID
											 AND bohumid IN (SELECT * FROM @BohumSet)
											 AND SDate BETWEEN @StartDate AND @FinishDate
											 AND ProgramTypeID=@ProgramTypeID
                                                AND WardID=@WardID
										   GROUP BY inoutid, sdate											 
										   ) AS P
									 GROUP BY inoutid
						             ) AS T
						   ) AS Total
					)
	ELSE
		SET @SUM = 0;
	
	SELECT @SUM
	RETURN @SUM
END

' 
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefHospitals45]') AND type = 'F')
ALTER TABLE [SocialWorker].[Programs]  WITH NOCHECK ADD  CONSTRAINT [RefHospitals45] FOREIGN KEY([HospitalID])
REFERENCES [SocialWorker].[Hospitals] ([HospitalID])
GO
ALTER TABLE [SocialWorker].[Programs] CHECK CONSTRAINT [RefHospitals45]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefProgramTypes16]') AND type = 'F')
ALTER TABLE [SocialWorker].[Programs]  WITH NOCHECK ADD  CONSTRAINT [RefProgramTypes16] FOREIGN KEY([ProgramTypeID])
REFERENCES [SocialWorker].[ProgramTypes] ([ProgramTypeID])
GO
ALTER TABLE [SocialWorker].[Programs] CHECK CONSTRAINT [RefProgramTypes16]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefWards111]') AND type = 'F')
ALTER TABLE [SocialWorker].[Programs]  WITH NOCHECK ADD  CONSTRAINT [RefWards111] FOREIGN KEY([WardID])
REFERENCES [SocialWorker].[Wards] ([WardID])
GO
ALTER TABLE [SocialWorker].[Programs] CHECK CONSTRAINT [RefWards111]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefHospitals48]') AND type = 'F')
ALTER TABLE [SocialWorker].[Schedule]  WITH NOCHECK ADD  CONSTRAINT [RefHospitals48] FOREIGN KEY([HospitalID])
REFERENCES [SocialWorker].[Hospitals] ([HospitalID])
GO
ALTER TABLE [SocialWorker].[Schedule] CHECK CONSTRAINT [RefHospitals48]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefPrograms19]') AND type = 'F')
ALTER TABLE [SocialWorker].[Schedule]  WITH NOCHECK ADD  CONSTRAINT [RefPrograms19] FOREIGN KEY([ProgramID])
REFERENCES [SocialWorker].[Programs] ([ProgramID])
GO
ALTER TABLE [SocialWorker].[Schedule] CHECK CONSTRAINT [RefPrograms19]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefWards66]') AND type = 'F')
ALTER TABLE [SocialWorker].[Schedule]  WITH NOCHECK ADD  CONSTRAINT [RefWards66] FOREIGN KEY([WardID])
REFERENCES [SocialWorker].[Wards] ([WardID])
GO
ALTER TABLE [SocialWorker].[Schedule] CHECK CONSTRAINT [RefWards66]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefInTypes117]') AND type = 'F')
ALTER TABLE [SocialWorker].[InOut]  WITH NOCHECK ADD  CONSTRAINT [RefInTypes117] FOREIGN KEY([InTypeID])
REFERENCES [SocialWorker].[InTypes] ([InTypeID])
GO
ALTER TABLE [SocialWorker].[InOut] CHECK CONSTRAINT [RefInTypes117]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefPatients21]') AND type = 'F')
ALTER TABLE [SocialWorker].[InOut]  WITH NOCHECK ADD  CONSTRAINT [RefPatients21] FOREIGN KEY([HospitalID], [PatientID])
REFERENCES [SocialWorker].[Patients] ([HospitalID], [PatientID])
GO
ALTER TABLE [SocialWorker].[InOut] CHECK CONSTRAINT [RefPatients21]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefUsers100]') AND type = 'F')
ALTER TABLE [SocialWorker].[InOut]  WITH NOCHECK ADD  CONSTRAINT [RefUsers100] FOREIGN KEY([HospitalID], [UserID])
REFERENCES [SocialWorker].[Users] ([HospitalID], [UserID])
GO
ALTER TABLE [SocialWorker].[InOut] CHECK CONSTRAINT [RefUsers100]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefInOut126]') AND type = 'F')
ALTER TABLE [SocialWorker].[Families]  WITH NOCHECK ADD  CONSTRAINT [RefInOut126] FOREIGN KEY([InOutID])
REFERENCES [SocialWorker].[InOut] ([InOutID])
GO
ALTER TABLE [SocialWorker].[Families] CHECK CONSTRAINT [RefInOut126]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefRelationships96]') AND type = 'F')
ALTER TABLE [SocialWorker].[Families]  WITH NOCHECK ADD  CONSTRAINT [RefRelationships96] FOREIGN KEY([RelationshipID])
REFERENCES [SocialWorker].[Relationships] ([RelationshipID])
GO
ALTER TABLE [SocialWorker].[Families] CHECK CONSTRAINT [RefRelationships96]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefSchedule67]') AND type = 'F')
ALTER TABLE [SocialWorker].[ProgramPatients]  WITH NOCHECK ADD  CONSTRAINT [RefSchedule67] FOREIGN KEY([ScheduleID])
REFERENCES [SocialWorker].[Schedule] ([ScheduleID])
GO
ALTER TABLE [SocialWorker].[ProgramPatients] CHECK CONSTRAINT [RefSchedule67]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefHospitals122]') AND type = 'F')
ALTER TABLE [SocialWorker].[InTypes]  WITH NOCHECK ADD  CONSTRAINT [RefHospitals122] FOREIGN KEY([HospitalID])
REFERENCES [SocialWorker].[Hospitals] ([HospitalID])
GO
ALTER TABLE [SocialWorker].[InTypes] CHECK CONSTRAINT [RefHospitals122]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefHospitals85]') AND type = 'F')
ALTER TABLE [SocialWorker].[Locations]  WITH NOCHECK ADD  CONSTRAINT [RefHospitals85] FOREIGN KEY([HospitalID])
REFERENCES [SocialWorker].[Hospitals] ([HospitalID])
GO
ALTER TABLE [SocialWorker].[Locations] CHECK CONSTRAINT [RefHospitals85]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefHospitals6]') AND type = 'F')
ALTER TABLE [SocialWorker].[Patients]  WITH NOCHECK ADD  CONSTRAINT [RefHospitals6] FOREIGN KEY([HospitalID])
REFERENCES [SocialWorker].[Hospitals] ([HospitalID])
GO
ALTER TABLE [SocialWorker].[Patients] CHECK CONSTRAINT [RefHospitals6]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefHospitals1]') AND type = 'F')
ALTER TABLE [SocialWorker].[Users]  WITH NOCHECK ADD  CONSTRAINT [RefHospitals1] FOREIGN KEY([HospitalID])
REFERENCES [SocialWorker].[Hospitals] ([HospitalID])
GO
ALTER TABLE [SocialWorker].[Users] CHECK CONSTRAINT [RefHospitals1]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefHospitals87]') AND type = 'F')
ALTER TABLE [SocialWorker].[Wards]  WITH NOCHECK ADD  CONSTRAINT [RefHospitals87] FOREIGN KEY([HospitalID])
REFERENCES [SocialWorker].[Hospitals] ([HospitalID])
GO
ALTER TABLE [SocialWorker].[Wards] CHECK CONSTRAINT [RefHospitals87]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefHospitals123]') AND type = 'F')
ALTER TABLE [SocialWorker].[Relationships]  WITH NOCHECK ADD  CONSTRAINT [RefHospitals123] FOREIGN KEY([HospitalID])
REFERENCES [SocialWorker].[Hospitals] ([HospitalID])
GO
ALTER TABLE [SocialWorker].[Relationships] CHECK CONSTRAINT [RefHospitals123]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefInOut38]') AND type = 'F')
ALTER TABLE [SocialWorker].[Survey2]  WITH NOCHECK ADD  CONSTRAINT [RefInOut38] FOREIGN KEY([InOutID])
REFERENCES [SocialWorker].[InOut] ([InOutID])
GO
ALTER TABLE [SocialWorker].[Survey2] CHECK CONSTRAINT [RefInOut38]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefInOut90]') AND type = 'F')
ALTER TABLE [SocialWorker].[Training]  WITH NOCHECK ADD  CONSTRAINT [RefInOut90] FOREIGN KEY([InOutID])
REFERENCES [SocialWorker].[InOut] ([InOutID])
GO
ALTER TABLE [SocialWorker].[Training] CHECK CONSTRAINT [RefInOut90]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefInOut36]') AND type = 'F')
ALTER TABLE [SocialWorker].[Intake]  WITH NOCHECK ADD  CONSTRAINT [RefInOut36] FOREIGN KEY([InOutID])
REFERENCES [SocialWorker].[InOut] ([InOutID])
GO
ALTER TABLE [SocialWorker].[Intake] CHECK CONSTRAINT [RefInOut36]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefInOut88]') AND type = 'F')
ALTER TABLE [SocialWorker].[Counseling]  WITH NOCHECK ADD  CONSTRAINT [RefInOut88] FOREIGN KEY([InOutID])
REFERENCES [SocialWorker].[InOut] ([InOutID])
GO
ALTER TABLE [SocialWorker].[Counseling] CHECK CONSTRAINT [RefInOut88]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[SocialWorker].[RefInOut37]') AND type = 'F')
ALTER TABLE [SocialWorker].[Survey1]  WITH NOCHECK ADD  CONSTRAINT [RefInOut37] FOREIGN KEY([InOutID])
REFERENCES [SocialWorker].[InOut] ([InOutID])
GO
ALTER TABLE [SocialWorker].[Survey1] CHECK CONSTRAINT [RefInOut37]
