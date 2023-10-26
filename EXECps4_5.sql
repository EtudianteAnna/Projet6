USE [Projet6]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[GetProblemsInProgressAllProducts_4_5]
		@CreatedDate = '2023-05-18',
		@StatusName = N'En cours',
		@Keywords = N'utilisateurs',
		@EndDate = '2023-05-22'

SELECT	'Return Value' = @return_value

GO
