USE [SocialWorkDB]
GO
/****** 개체:  StoredProcedure [SocialWorker].[pGetSum]    스크립트 날짜: 03/23/2012 17:17:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
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

