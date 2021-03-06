USE [SocialWorkDB]
GO
/****** 개체:  View [SocialWorker].[vInOut]    스크립트 날짜: 03/23/2012 17:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [SocialWorker].[vInOut]
AS
SELECT     Users_1.UserName, Users_2.UserName AS DoctorName, CASE inout.state WHEN 0 THEN '입원' WHEN 1 THEN '퇴원' ELSE '에러' END AS StateName,
                       SocialWorker.Patients.PatientName, SocialWorker.Patients.SEX, SocialWorker.Patients.BIRTHDAY, SocialWorker.Bohum.BohumName, 
                      SocialWorker.Bohum.Seq, SocialWorker.InTypes.InTypeName, SocialWorker.InOut.InOutID, SocialWorker.InOut.InDate, SocialWorker.InOut.InTime, 
                      SocialWorker.InOut.OutDate, SocialWorker.InOut.OutTime, SocialWorker.InOut.State, SocialWorker.InOut.DiagName, SocialWorker.InOut.DoctorID, 
                      SocialWorker.InOut.HospitalID, SocialWorker.InOut.UserID, SocialWorker.InOut.InTypeID, SocialWorker.InOut.PatientID, SocialWorker.InOut.BohumID, 
                      SocialWorker.InOut.Room
FROM         SocialWorker.InOut INNER JOIN
                      SocialWorker.Users AS Users_1 ON SocialWorker.InOut.HospitalID = Users_1.HospitalID AND 
                      SocialWorker.InOut.UserID = Users_1.UserID INNER JOIN
                      SocialWorker.Users AS Users_2 ON SocialWorker.InOut.HospitalID = Users_2.HospitalID AND 
                      SocialWorker.InOut.DoctorID = Users_2.UserID INNER JOIN
                      SocialWorker.Patients ON SocialWorker.InOut.HospitalID = SocialWorker.Patients.HospitalID AND 
                      SocialWorker.InOut.PatientID = SocialWorker.Patients.PatientID INNER JOIN
                      SocialWorker.Bohum ON SocialWorker.InOut.BohumID = SocialWorker.Bohum.BohumID INNER JOIN
                      SocialWorker.InTypes ON SocialWorker.InOut.InTypeID = SocialWorker.InTypes.InTypeID

GO
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[22] 2[38] 3) )"
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
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   Width = 1500
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
EXEC dbo.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'USER',@level0name=N'SocialWorker', @level1type=N'VIEW',@level1name=N'vInOut'