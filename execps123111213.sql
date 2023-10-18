USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetProblems 1_2_3_11_12_13]
		@ProductName = NULL,
		@Version =NULL,
		@StartDate =  '2023-02-01',
		@StatusName = N'en cours'

SELECT	'Return Value' = @return_value

GO
