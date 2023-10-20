USE [Projet6]
GO

/****** Object:  StoredProcedure [dbo].[GetResolvedTicketsByKeywords19_20]    Script Date: 20/10/2023 15:05:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- R�cr�ation de la proc�dure stock�e
CREATE OR ALTER PROCEDURE [dbo].[GetResolvedTicketsByKeywords19_20] 
    @Keywords NVARCHAR(MAX),
    @Version NVARCHAR(50) = NULL,
    @Status NVARCHAR(255) = NULL -- Ajoutez le param�tre "Status"
AS
BEGIN
    SET NOCOUNT ON;

    -- S�lectionner les colonnes sp�cifiques de la table "Ticket"
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
        (@Status IS NULL OR S.[Name] = @Status) -- Utilisez le param�tre "Status" pour filtrer par statut
        AND (
            @Version IS NULL
            OR VV.[Version] = @Version
        )
        AND (
            (@Keywords IS NULL)
            OR CHARINDEX(@Keywords, T.[Description]) > 0
            OR CHARINDEX(@Keywords, T.[NameTicket]) > 0
            -- Ajoutez d'autres colonnes si n�cessaire
        );
END;

GO


