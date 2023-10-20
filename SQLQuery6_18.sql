USE [Projet6]
GO

/****** Object:  StoredProcedure [dbo].[GetProblemsByKeywordsAndStatus 6_18]    Script Date: 20/10/2023 15:08:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Cr�ation de la proc�dure stock�e
CREATE OR ALTER PROCEDURE [dbo].[GetProblemsByKeywordsAndStatus 6_18]
    @Keywords NVARCHAR(MAX) = NULL,
    @ProductName NVARCHAR(255) = NULL,
    @Version NVARCHAR(50) = NULL,
    @StatusName NVARCHAR(255) = NULL,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    -- SET NOCOUNT ON ajout� pour �viter que des jeux de r�sultats suppl�mentaires
    -- n'interf�rent avec les instructions SELECT.
    SET NOCOUNT ON;

    -- S�lectionner tous les probl�mes en cours ou r�solus contenant une liste de mots-cl�s
    SELECT
        T.[NameTicket] AS Nameticket,
        T.[Description] AS Description,
        T.[CreatedDate] AS StartDate,
        PVOP.[ProductName] AS ProductName,
        S.[Name] AS StatusName

    FROM [Ticket] T
    INNER JOIN [ProductVersionOpSys] PVO ON T.[ProductVersionOpSysId] = PVO.[Id]
    INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
    -- Jointure avec la table "ProductVersionOpSys"
    INNER JOIN [Product] PVOP ON PVO.[ProductId] = PVOP.[ProductId]
    -- Jointure avec la table "Versions" si n�cessaire
    INNER JOIN [VersionVersion] V ON PVO.[VersionId] = V.[Id]
    WHERE
        (
            (@StatusName IS NULL OR S.[Name] = @StatusName)  -- Statut (En cours ou R�solu)
            AND (@ProductName IS NULL OR PVOP.[ProductName] = @ProductName)  -- Nom du produit
            AND (@Version IS NULL OR V.[Version] = @Version)  -- Version du produit
        )
        AND (
            @Keywords IS NULL  -- Aucun mot-cl� sp�cifi�
            OR CHARINDEX(@Keywords, T.[Description]) > 0  -- Description du ticket
            OR CHARINDEX(@Keywords, T.[NameTicket]) > 0  -- Nom du ticket
        )
        AND (
            (@StartDate IS NULL OR T.[CreatedDate] >= @StartDate) -- Filtrer par date de d�but si renseign�e
            AND (@EndDate IS NULL OR T.[CreatedDate] <= @EndDate) -- Filtrer par date de fin si renseign�e
        );
END;
GO


