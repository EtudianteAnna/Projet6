USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetProblemsByKeywordsAndDate_9]
		@StartDate = '2023-01-01',
		@EndDate = '2023-10-22',
		@Keywords = N'notifications',
		@ProductName = NULL,
		@Version = NULL

SELECT	'Return Value' = @return_value

GO
