USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetProblemsByKeywordsAndStatus 6_18]
		@Keywords = N'utilisateurs',
		@ProductName = NULL,
		@Version = NULL,
		@StatusName = N'En cours',
		@StartDate = '2023-01-01',
		@EndDate = NULL

SELECT	'Return Value' = @return_value

GO
