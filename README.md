# Projet6
Modélisez et créer une base de données
# Gestionnaire de Problèmes de Produits - Projet de Base de Données

Ce projet vise à concevoir et créer une base de données relationnelle personnalisée pour stocker et suivre les problèmes associés à nos produits tout au long de leur cycle de vie, ainsi que les résolutions apportées à ces problèmes. Une fois la base de données établie, notre équipe développera un front-end et une API pour interagir avec elle.

## Objectifs du Projet

- Concevoir et créer une base de données relationnelle robuste pour stocker les problèmes et les résolutions des produits.
- Permettre le suivi des problèmes pour chaque version spécifique d'un produit.
- Établir des relations entre les entités telles que les produits, les versions, les systèmes d'exploitation et les tickets.
- Fournir une base solide pour le développement d'une interface utilisateur conviviale et d'une API de gestion des problèmes.

## Configuration Requise

- Système de gestion de bases de données (SGBD) : Microsoft SQL Server
- Compétences en modélisation de bases de données relationnelles
- Compétences en écriture de requêtes SQL et en création de procédures stockées

## Structure de la Base de Données

La base de données comprendra les entités suivantes :

- **Product**: Stocke les informations sur les produits que nous développons.
- **Version**: Enregistre les différentes versions de chaque produit.
- **OperatingSystem**: Contient les systèmes d'exploitation pris en charge.
- **Status**: Représente les différents statuts possibles pour un ticket (résolu, en cours, etc.).
- **Ticket**: Contient les détails des problèmes signalés par les utilisateurs.

## Tables et Relations

- **Product** - *Version* : Relation 1 à plusieurs (Un produit peut avoir plusieurs versions)
- **Product** - *Ticket* : Relation 1 à plusieurs (Un produit peut avoir plusieurs tickets)
- **Version** - *Ticket* : Relation 1 à plusieurs (Une version peut avoir plusieurs tickets)
- **OperatingSystem** - *Ticket* : Relation 1 à plusieurs (Un système d'exploitation peut avoir plusieurs tickets)
- **Status** - *Ticket* : Relation 1 à plusieurs (Un statut peut être associé à plusieurs tickets)
- **ProductVersionOperatingSystemTicket** : Table de jointure pour représenter les relations entre Product, Version, OperatingSystem et Ticket.

## Procédures Stockées

- `GetTicketsByProductVersion` : Récupère tous les tickets liés à un produit et une version spécifiques.
- `GetOpenTickets` : Récupère tous les tickets en cours (non résolus).
- `GetResolvedTickets` : Récupère tous les tickets résolus.
- `GetTicketsByOperatingSystem` : Récupère tous les tickets liés à un système d'exploitation spécifique.
- `GetTicketsByStatus` : Récupère tous les tickets ayant un statut donné.

## Comment Contribuer

1. Clonez ce dépôt sur votre machine locale.
2. Créez une branche pour vos modifications : `git checkout -b nouvelle-fonctionnalité`
3. Effectuez vos modifications.
4. Proposez vos modifications en créant une demande d'extraction.

## Licence

Ce projet est sous licence MIT. Consultez le fichier [LICENSE](LICENSE) pour plus de détails.
