USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetProblems 1_2_3_11_12_13]
		@ProductName = N'Trader en herbe',
		@Version = '1.1',
		@StartDate ='2023-03-15',
		@StatusName = N'En cours'

SELECT	'Return Value' = @return_value

GO
