USE [Projet6]
GO

/****** Object:  StoredProcedure [dbo].[GetResolvedProblemsByPeriod 14_15]    Script Date: 20/10/2023 14:52:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Création de la procédure stockée
CREATE OR ALTER PROCEDURE [dbo].[GetResolvedProblemsByPeriod 14_15]
    @StartDate DATE,
    @EndDate DATE,
    @ProductName NVARCHAR(255) = NULL,
    @Version NVARCHAR(50) = NULL,
    @StatusName NVARCHAR(255) = 'Résolu' -- Paramètre @StatusName avec valeur par défaut
AS
BEGIN
    -- SET NOCOUNT ON ajouté pour éviter que des jeux de résultats supplémentaires
    -- n'interfèrent avec les instructions SELECT.
    SET NOCOUNT ON;

    -- Sélectionner tous les problèmes résolus au cours d'une période donnée
    SELECT DISTINCT T.*
    FROM [Ticket] T
    INNER JOIN [ProductVersionOpSys] PVO ON T.[ProductVersionOpSysId] = PVO.[Id]
    INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
    LEFT JOIN [Product] P ON PVO.[ProductId] = P.[ProductId]
    LEFT JOIN [VersionVersion] V ON V.[Id] = PVO.[VersionId]
    WHERE
        S.[Name] = @StatusName
        AND T.[UpdatedDate] BETWEEN @StartDate AND @EndDate
        AND (
            (@ProductName IS NULL OR P.[ProductName] = @ProductName)
            AND (@Version IS NULL OR V.[Version] = @Version)
        );
END;

GO
