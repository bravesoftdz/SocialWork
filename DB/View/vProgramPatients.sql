USE [SocialWorkDB]
GO
/****** 개체:  View [SocialWorker].[vProgramPatients]    스크립트 날짜: 03/23/2012 17:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [SocialWorker].[vProgramPatients]
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

GO
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
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
      End
   End
End
' , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vProgramPatients'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vProgramPatients'