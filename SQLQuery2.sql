SELECT ProductName
FROM Product
INNER JOIN ProductVersion ON Product.ID = ProductVersion.ProductID
WHERE ProductVersion.VersionID = 3; -- Sélectionne les produits associés à la version avec ID 3
SELECT ProductName
FROM Product
INNER JOIN ProductVersion ON Product.ID = ProductVersion.ProductID
WHERE ProductVersion.VersionID = 3; -- Sélectionne les produits associés à la version avec ID 3
SELECT Version.Version
FROM Version
INNER JOIN ProductVersion ON Version.ID = ProductVersion.VersionID
WHERE ProductVersion.ProductID = 1; -- Sélectionne les versions associées au produit avec ID 1
