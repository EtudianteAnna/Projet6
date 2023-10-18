
USE [Projet6]
GO

-- Récréation de la procédure stockée
ALTER PROCEDURE [dbo].[GetResolvedTicketsByKeywords19_20] 
    @Keywords NVARCHAR(MAX),
    @Version NVARCHAR(50) = NULL,
    @Status NVARCHAR(255) = NULL -- Ajoutez le paramètre "Status"
AS
BEGIN
    SET NOCOUNT ON;

    -- Sélectionner les colonnes spécifiques de la table "Ticket"
    SELECT
        T.[TicketId],
        T.[NameTicket],
        T.[Description],
        T.[CreatedDate]
    FROM [Ticket] T
    INNER JOIN [ProductVersionOpSys] PVO ON T.[ProductVersionOpSysId] = PVO.[Id]
    INNER JOIN [VersionVersion] VV ON PVO.[VersionId] = VV.[Id]
    INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
    WHERE
        (@Status IS NULL OR S.[Name] = @Status) -- Utilisez le paramètre "Status" pour filtrer par statut
        AND (
            @Version IS NULL
            OR VV.[Version] = @Version
        )
        AND (
            (@Keywords IS NULL)
            OR CHARINDEX(@Keywords, T.[Description]) > 0
            OR CHARINDEX(@Keywords, T.[NameTicket]) > 0
            -- Ajoutez d'autres colonnes si nécessaire
        );
END;

