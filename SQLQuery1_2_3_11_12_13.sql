USE [Projet6]
GO

/****** Object:  StoredProcedure [dbo].[GetProblems 1_2_3_11_12_13]    Script Date: 20/10/2023 10:54:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Création de la procédure stockée
CREATE OR ALTER PROCEDURE [dbo].[GetProblems 1_2_3_11_12_13]
    @ProductName NVARCHAR(255) = NULL,
    @Version NVARCHAR(50) = NULL,
    @StartDate DATE = NULL,
    @StatusName NVARCHAR(255) = NULL
AS
BEGIN
    -- SET NOCOUNT ON ajouté pour éviter que des jeux de résultats supplémentaires
    -- n'interfèrent avec les instructions SELECT.
    SET NOCOUNT ON;

    SELECT
        T.[TicketId],
        T.[NameTicket],
        T.[Description] AS TicketDescription,
        T.[CreatedDate],
        T.[StatusId] -- Ajoutez d'autres colonnes de la table "Ticket" ici
    FROM [Ticket] T
    INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
    LEFT JOIN [ProductVersionOpSys] PVO ON T.[ProductVersionOpSysId] = PVO.[Id]
    LEFT JOIN [VersionVersion] VV ON PVO.[VersionId] = VV.[Id]
    LEFT JOIN [Product] P ON PVO.[ProductId] = P.[ProductId] -- Utilisation de la colonne ProductId
    WHERE
        (
            (@StatusName IS NULL OR S.[Name] = @StatusName)
            AND (
                (@ProductName IS NULL AND @Version IS NULL)
                OR
                (P.[ProductName] = @ProductName AND @Version IS NULL)
                OR
                (P.[ProductName] = @ProductName AND VV.[Version] = @Version)
            )
        )
        AND (
            (@StartDate IS NULL)
            OR (T.[CreatedDate] >= @StartDate)
        );
END;
GO

