USE [master]
GO
/****** Object:  Database [Projet6]    Script Date: 16/10/2023 14:22:11 ******/
CREATE DATABASE [Projet6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projet6', FILENAME = N'C:\Users\A154NF\OneDrive - AXA\Bureau\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Projet6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projet6_log', FILENAME = N'C:\Users\A154NF\OneDrive - AXA\Bureau\MSSQL16.MSSQLSERVER01\MSSQL\DATA\Projet6_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Projet6] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projet6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projet6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projet6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projet6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projet6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projet6] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projet6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projet6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projet6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projet6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projet6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projet6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projet6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projet6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projet6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projet6] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Projet6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projet6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projet6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projet6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projet6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projet6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projet6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projet6] SET RECOVERY FULL 
GO
ALTER DATABASE [Projet6] SET  MULTI_USER 
GO
ALTER DATABASE [Projet6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projet6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projet6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projet6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projet6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Projet6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Projet6', N'ON'
GO
ALTER DATABASE [Projet6] SET QUERY_STORE = ON
GO
ALTER DATABASE [Projet6] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Projet6]
GO
/****** Object:  Table [dbo].[OperatingSystem]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatingSystem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OpSys] [nvarchar](500) NULL,
 CONSTRAINT [PK_OperatingSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](500) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVersionOpSys]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVersionOpSys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[VersionId] [int] NOT NULL,
	[OpSysId] [int] NOT NULL,
 CONSTRAINT [PK_ProductVersionOpSys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[NameTicket] [nvarchar](100) NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[StatusId] [int] NOT NULL,
	[ProductVersionOpSysId] [int] NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VersionVersion]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionVersion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Version] [nvarchar](500) NULL,
 CONSTRAINT [PK_VersionVersion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductVersionOpSys]  WITH CHECK ADD  CONSTRAINT [FK_OpSysId] FOREIGN KEY([OpSysId])
REFERENCES [dbo].[OperatingSystem] ([Id])
GO
ALTER TABLE [dbo].[ProductVersionOpSys] CHECK CONSTRAINT [FK_OpSysId]
GO
ALTER TABLE [dbo].[ProductVersionOpSys]  WITH CHECK ADD  CONSTRAINT [FK_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductVersionOpSys] CHECK CONSTRAINT [FK_ProductId]
GO
ALTER TABLE [dbo].[ProductVersionOpSys]  WITH CHECK ADD  CONSTRAINT [FK_VersionId] FOREIGN KEY([VersionId])
REFERENCES [dbo].[VersionVersion] ([Id])
GO
ALTER TABLE [dbo].[ProductVersionOpSys] CHECK CONSTRAINT [FK_VersionId]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_ProductVersionOpSysId] FOREIGN KEY([ProductVersionOpSysId])
REFERENCES [dbo].[ProductVersionOpSys] ([Id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_ProductVersionOpSysId]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Status]
GO
/****** Object:  StoredProcedure [dbo].[GetProblems 1_2_3_11_12_13]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Création de la procédure stockée
CREATE PROCEDURE [dbo].[GetProblems 1_2_3_11_12_13]
    @ProductName NVARCHAR(255) = NULL,
    @Version NVARCHAR(50) = NULL,
    @StartDate DATE = NULL,
    @StatusName NVARCHAR(255) = NULL
AS
BEGIN
    -- SET NOCOUNT ON ajouté pour éviter que des jeux de résultats supplémentaires
    -- n'interfèrent avec les instructions SELECT.
    SET NOCOUNT ON;

    -- Problèmes en cours (tous les produits)
    IF @StatusName = 'En cours' AND @ProductName IS NULL AND @Version IS NULL
    BEGIN
        SELECT *
        FROM [Ticket] T
        INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
        WHERE S.[Name] = 'En cours';
        RETURN;
    END

    -- Problèmes en cours pour un produit (toutes les versions)
    IF @StatusName = 'En cours' AND @ProductName IS NOT NULL AND @Version IS NULL
    BEGIN
        SELECT *
        FROM [Ticket] T
        INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
        INNER JOIN [Product] P ON T.[NameTicket] = P.[ProductName]
        WHERE S.[Name] = 'En cours'
            AND P.[ProductName] = @ProductName;
        RETURN;
    END

    -- Problèmes en cours pour un produit (une seule version)
    IF @StatusName = 'En cours' AND @ProductName IS NOT NULL AND @Version IS NOT NULL
    BEGIN
        SELECT *
        FROM [Ticket] T
        INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
        INNER JOIN [Product] P ON T.[NameTicket] = P.[ProductName]
        INNER JOIN [ProductVersionOpSys] PVO ON T.[ProductVersionOpSysId] = PVO.[Id]
        INNER JOIN [VersionVersion] VV ON PVO.[VersionId] = VV.[Id]
        WHERE S.[Name] = 'En cours'
            AND P.[ProductName] = @ProductName
            AND VV.[Version] = @Version;
        RETURN;
    END

    -- Problèmes résolus (tous les produits)
    IF @StatusName = 'Résolu' AND @ProductName IS NULL AND @Version IS NULL
    BEGIN
        SELECT *
        FROM [Ticket] T
        INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
        WHERE S.[Name] = 'Résolu';
        RETURN;
    END

    -- Problèmes résolus pour un produit (toutes les versions)
    IF @StatusName = 'Résolu' AND @ProductName IS NOT NULL AND @Version IS NULL
    BEGIN
        SELECT *
        FROM [Ticket] T
        INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
        INNER JOIN [Product] P ON T.[NameTicket] = P.[ProductName]
        WHERE S.[Name] = 'Résolu'
            AND P.[ProductName] = @ProductName;
        RETURN;
    END

    -- Problèmes résolus pour un produit (une seule version)
    IF @StatusName = 'Résolu' AND @ProductName IS NOT NULL AND @Version IS NOT NULL
    BEGIN
        SELECT *
        FROM [Ticket] T
        INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
        INNER JOIN [Product] P ON T.[NameTicket] = P.[ProductName]
        INNER JOIN [ProductVersionOpSys] PVO ON T.[ProductVersionOpSysId] = PVO.[Id]
        INNER JOIN [VersionVersion] VV ON PVO.[VersionId] = VV.[Id]
        WHERE S.[Name] = 'Résolu'
            AND P.[ProductName] = @ProductName
            AND VV.[Version] = @Version;
        RETURN;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProblemsByKeywordsAndDate_9]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Création de la procédure stockée
CREATE PROCEDURE [dbo].[GetProblemsByKeywordsAndDate_9]
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
/****** Object:  StoredProcedure [dbo].[GetProblemsByKeywordsAndStatus 6_18]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Création de la procédure stockée
CREATE PROCEDURE [dbo].[GetProblemsByKeywordsAndStatus 6_18]
    @Keywords NVARCHAR(MAX) = NULL,
    @ProductName NVARCHAR(255) = NULL,
    @Version NVARCHAR(50) = NULL,
    @StatusName NVARCHAR(255) = NULL
AS
BEGIN
    -- SET NOCOUNT ON ajouté pour éviter que des jeux de résultats supplémentaires
    -- n'interfèrent avec les instructions SELECT.
    SET NOCOUNT ON;

    -- Sélectionner tous les problèmes en cours ou résolus contenant une liste de mots-clés
    SELECT DISTINCT T.*
    FROM [Ticket] T
    INNER JOIN [ProductVersionOpSys] PVO ON T.[ProductVersionOpSysId] = PVO.[Id]
    INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
    WHERE
        (
            (@StatusName IS NULL OR S.[Name] = @StatusName)  -- Statut (En cours ou Résolu)
            AND (@ProductName IS NULL OR PVO.[ProductId] = @ProductName)  -- Nom du produit
            AND (@Version IS NULL OR PVO.[VersionId] = @Version)  -- Version du produit
        )
        AND (
            @Keywords IS NULL  -- Aucun mot-clé spécifié
            OR CHARINDEX(@Keywords, T.[Description]) > 0  -- Description du ticket
            OR CHARINDEX(@Keywords, T.[NameTicket]) > 0  -- Nom du ticket
        );
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProblemsInProgressAllProducts_4]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Création de la procédure stockée
CREATE PROCEDURE [dbo].[GetProblemsInProgressAllProducts_4]
    @CreatedDate DATE = NULL,
    @StatusName NVARCHAR(255) = 'En cours',
    @Keywords NVARCHAR(MAX) = NULL
AS
BEGIN
    -- SET NOCOUNT ON ajouté pour éviter que des jeux de résultats supplémentaires
    -- n'interfèrent avec les instructions SELECT.
    SET NOCOUNT ON;

    -- Sélectionner tous les problèmes en cours pour tous les produits
    SELECT DISTINCT T.*
    FROM [Ticket] T
    INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
    INNER JOIN [Product] P ON T.[NameTicket] = P.[ProductName]
    WHERE
        S.[Name] = @StatusName
        AND (
            @CreatedDate IS NULL -- Aucune période spécifiée
            OR T.[CreatedDate] >= @CreatedDate -- Période spécifiée
        )
        AND (
            @Keywords IS NULL -- Aucun mot-clé spécifié
            OR CHARINDEX(@Keywords, T.[Description]) > 0
        );
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProductDetailsWithJoinTable]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductDetailsWithJoinTable]
AS
BEGIN
    SELECT
        PVO.ProductID,
        PVO.ProductId,
        VV.Version,  -- Utilisation de la colonne Version de la table VersionVersion
        OS.OpSys,
        S.Name AS StatusName,  -- Utilisation de la colonne "Name" de la table "Status
        T.NameTicket
    FROM
        ProductVersionOpSys PVO
    JOIN
        VersionVersion VV ON PVO.VersionID = VV.Id  -- Jointure avec la table VersionVersion
    JOIN
        OperatingSystem OS ON PVO.Id = OS.OpSys
    JOIN
        Status S ON PVO.Id = S.StatusID
    JOIN
        Ticket T ON PVO.Id = T.TicketID;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetResolvedProblemsByPeriod 14_15]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Création de la procédure stockée
CREATE PROCEDURE [dbo].[GetResolvedProblemsByPeriod 14_15]
    @StartDate DATE,
    @EndDate DATE,
    @ProductName NVARCHAR(255) = NULL,
    @Version NVARCHAR(50) = NULL
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
	INNER JOIN [Product] P ON P.[ProductId] = PVO.[ProductId]
	INNER JOIN [VersionVersion] V ON V.[Id] = PVO.[VersionId]
    WHERE
        S.[Name] = 'Résolu'
        AND T.[UpdatedDate] BETWEEN @StartDate AND @EndDate
        AND (
            (@ProductName IS NULL OR P.[ProductName] = @ProductName)
            AND (@Version IS NULL OR V.[Version] = @Version)
        );
END;
 
GO
/****** Object:  StoredProcedure [dbo].[GetResolvedTicketsByKeywords19_20]    Script Date: 16/10/2023 14:22:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Auteur : VotreNom
-- Date de création : DateDeCréation
-- Description : Cette procédure stockée obtient tous les problèmes résolus
-- pour un produit donné, contenant une liste de mots-clés, sans filtrer les dates.
-- Vous pouvez spécifier une version spécifique ou obtenir tous les problèmes pour toutes les versions.
-- =============================================

CREATE PROCEDURE [dbo].[GetResolvedTicketsByKeywords19_20] 
    @Keywords NVARCHAR(MAX),
    @Version NVARCHAR(50) = NULL
AS
BEGIN
    -- SET NOCOUNT ON ajouté pour éviter que des jeux de résultats supplémentaires
    -- n'interfèrent avec les instructions SELECT.
    SET NOCOUNT ON;

    -- Sélectionner tous les problèmes résolus en fonction des mots-clés et de la version (si spécifiée)
     SELECT DISTINCT T.*
    FROM [Ticket] T
    INNER JOIN [ProductVersionOpSys] PVO ON T.[ProductVersionOpSysId] = PVO.[Id]
    INNER JOIN [VersionVersion] VV ON PVO.[VersionId] = VV.[Id]
    INNER JOIN [Status] S ON T.[StatusId] = S.[StatusId]
    WHERE S.[Name] = 'Résolu'
        AND (
            @Version IS NULL -- Si aucune version spécifiée
            OR VV.[Version] = @Version -- Si une version spécifiée
        )
        AND (
            (@Keywords IS NULL) -- Si aucun mot-clé spécifié
            OR CHARINDEX(@Keywords, T.[Description]) > 0
            OR CHARINDEX(@Keywords, T.[NameTicket]) > 0
            -- Ajoutez d'autres colonnes si nécessaire
        );
END;
GO
USE [master]
GO
ALTER DATABASE [Projet6] SET  READ_WRITE 
GO
