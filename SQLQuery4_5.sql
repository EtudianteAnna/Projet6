USE [Projet6]
GO

/****** Object:  StoredProcedure [dbo].[GetProblemsInProgressAllProducts_4_5]    Script Date: 30/10/2023 12:04:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- Récréation de la procédure stockée
CREATE OR ALTER     PROCEDURE [dbo].[GetProblemsInProgressAllProducts_4_5]
    @CreatedDate DATE = NULL,
    @StatusName NVARCHAR(255) = N'En cours',
    @Keywords NVARCHAR(MAX) = NULL,
    @EndDate DATE = NULL
AS
BEGIN
    -- SET NOCOUNT ON ajouté pour éviter que des jeux de résultats supplémentaires
    -- n'interfèrent avec les instructions SELECT.
    SET NOCOUNT ON;

    -- Sélectionner tous les problèmes en cours pour tous les produits
    SELECT T.[TicketId], T.[NameTicket], T.[Description], T.[UpdatedDate]
    FROM [Ticket] T
    INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
	LEFT JOIN [Product] P ON T.[NameTicket] = P.[ProductName]

    WHERE
        S.[Name] = @StatusName  -- Utilisation de la variable @StatusName
        AND (
            @EndDate IS NULL  -- Si @EndDate n'est pas spécifié, utilisez UpdatedDate
            OR T.[UpdatedDate] >= @EndDate  -- Utilisation de @EndDate
        )
        AND (
            @Keywords IS NULL  -- Aucun mot-clé spécifié
            OR CHARINDEX(@Keywords, T.[Description]) > 0
        );
END;



GO


