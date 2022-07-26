DECLARE @Run_status INT  
DECLARE @date1 datetime
BEGIN TRY
	SET @date1 = getdate();
	-- Qeury >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..
	SELECT * FROM [msdb].[dbo].[sysjobhistory]
	 ----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
     SET @Run_status = 1;
	 IF EXISTS (SELECT 1 FROM [msdb].[dbo].[sysjobhistory2] WHERE run_date = convert(varchar, getdate(), 112))
		BEGIN
			UPDATE [msdb].[dbo].[sysjobhistory2]
			SET run_status = @Run_status , run_duration = Datediff(MINUTE, CONVERT(varchar,@date1,8), CONVERT(varchar,GETDATE(),8))
			WHERE run_date = convert(varchar, getdate(), 112) ;
		END
	 ELSE
	 BEGIN
		INSERT INTO [msdb].[dbo].[sysjobhistory2]  (step_name, run_status, run_date,run_time, run_duration)
		VALUES ('10.82.1.4', @Run_status, CONVERT(varchar, getdate(), 112) , CONVERT(varchar,@date1,108), Datediff(MINUTE, CONVERT(varchar,@date1,8), CONVERT(varchar,GETDATE(),8) ));
	 END
END TRY  
BEGIN CATCH
    SET @Run_status = 0;
	IF EXISTS (SELECT 1 FROM [msdb].[dbo].[sysjobhistory2] WHERE run_date = convert(varchar, getdate(), 112))
		BEGIN
			UPDATE [msdb].[dbo].[sysjobhistory2]
			SET run_status = @Run_status, run_duration = Datediff(MINUTE, CONVERT(varchar,@date1,8), CONVERT(varchar,GETDATE(),8))
			WHERE run_date = convert(varchar, getdate(), 112) and step_name = '10.82.1.4' ;
		END
	 ELSE
	 BEGIN
		INSERT INTO [msdb].[dbo].[sysjobhistory2]  (step_name, run_status, run_date,run_time, run_duration)
		VALUES ('10.82.1.4', @Run_status, convert(varchar, getdate(), 112) , CONVERT(varchar,getdate(),108),Datediff(MINUTE, CONVERT(varchar,@date1,8), CONVERT(varchar,GETDATE(),8)) );
	 END
END CATCH

ALTER TABLE [msdb].[dbo].[sysjobhistory2]  ALTER COLUMN run_duration varchar(10)
SELECT * FROM [msdb].[dbo].[sysjobhistory2] 


