USE [Projet6]
GO

/****** Object:  StoredProcedure [dbo].[GetProblemsByKeywordsAndDate_9]    Script Date: 20/10/2023 16:50:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Création de la procédure stockée
CREATE OR ALTER PROCEDURE [dbo].[GetProblemsByKeywordsAndDate_9]
    @StartDate DATE,
    @EndDate DATE,
    @Keywords NVARCHAR(MAX) = NULL, -- Paramètre pour les mots-clés
    @ProductName NVARCHAR(255) = NULL,
    @Version NVARCHAR(50) = NULL
AS
BEGIN
    -- SET NOCOUNT ON ajouté pour éviter que des jeux de résultats supplémentaires
    -- n'interfèrent avec les instructions SELECT.
    SET NOCOUNT ON;

    -- Sélectionner tous les problèmes en fonction des paramètres
    SELECT DISTINCT T.*
   FROM [Ticket] T
    INNER JOIN [ProductVersionOpSys] PVO ON T.[ProductVersionOpSysId] = PVO.[Id]
    WHERE
        [CreatedDate] >= @StartDate
        AND [CreatedDate] <= @EndDate
        AND (
            (@Keywords IS NULL OR
            CHARINDEX(@Keywords, T.[Description]) > 0 OR
            CHARINDEX(@Keywords, T.[NameTicket]) > 0)
            AND
            (@ProductName IS NULL OR PVO.[ProductId] = @ProductName)
			AND (@Version IS NULL OR CAST(PVO.[VersionId] AS NVARCHAR(50)) = @Version)

          
        );
END;
GO

