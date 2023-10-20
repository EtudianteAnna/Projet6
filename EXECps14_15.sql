USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetResolvedProblemsByPeriod 14_15]
		@StartDate = '2023-01-01',
		@EndDate = '2023-10-01',
		@ProductName = NULL,
		@Version = NULL,
		@StatusName = N'Résolu'

SELECT	'Return Value' = @return_value

GO
