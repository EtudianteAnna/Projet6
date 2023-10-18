USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetResolvedProblemsByPeriod 14_15]
		@StartDate = '2023-05-20',
		@EndDate = '2023-09-30',
		@ProductName = N'trader en herbe',
		@Version = N'1.0'

SELECT	'Return Value' = @return_value

GO
