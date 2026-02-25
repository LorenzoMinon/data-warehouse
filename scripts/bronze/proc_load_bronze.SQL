USE [DataWarehouse]

  -- Truncates the bronze tables before loading the data
  -- Uses bulk insert to load from csv
  -- time variables to track perfomance
  -- No params
GO
/****** Object:  StoredProcedure [bronze].[load_bronze]    Script Date: 2/23/2026 5:59:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	ALTER   PROCEDURE [bronze].[load_bronze] AS
	BEGIN
		DECLARE @start_time DATETIME, @end_time DATETIME;

		BEGIN TRY
		
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Lorenzo\Desktop\SQL\DataWarehouse\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Crm cust info load duration: ' + CAST(DATEDIFF(millisecond, @start_time,@end_time) AS NVARCHAR) + ' milliseconds';
		TRUNCATE TABLE bronze.crm_prd_info
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Lorenzo\Desktop\SQL\DataWarehouse\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_sales_details
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Lorenzo\Desktop\SQL\DataWarehouse\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_cust_az12
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Lorenzo\Desktop\SQL\DataWarehouse\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		TRUNCATE TABLE bronze.erp_loc_a101
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Lorenzo\Desktop\SQL\DataWarehouse\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		TRUNCATE TABLE bronze.erp_px_cat_g1v2

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Lorenzo\Desktop\SQL\DataWarehouse\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
			END TRY
		BEGIN CATCH
			PRINT 'ERROR OCCURED DURING LOADING BRONZE ' + ERROR_MESSAGE()
		END CATCH
	END
