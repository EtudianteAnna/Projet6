USE Projet6;

-- Utilisez la commande sp_rename pour renommer la colonne
EXEC sp_rename 'Product.ID', 'ProductId', 'COLUMN';
