SELECT ProductName
FROM Product
INNER JOIN ProductVersion ON Product.ID = ProductVersion.ProductID
WHERE ProductVersion.VersionID = 3; -- S�lectionne les produits associ�s � la version avec ID 3
SELECT ProductName
FROM Product
INNER JOIN ProductVersion ON Product.ID = ProductVersion.ProductID
WHERE ProductVersion.VersionID = 3; -- S�lectionne les produits associ�s � la version avec ID 3
SELECT Version.Version
FROM Version
INNER JOIN ProductVersion ON Version.ID = ProductVersion.VersionID
WHERE ProductVersion.ProductID = 1; -- S�lectionne les versions associ�es au produit avec ID 1
