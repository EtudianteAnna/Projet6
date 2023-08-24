SELECT Product.ProductName, VersionVersion.Version, Ticket.NameTicket, Ticket.Description
FROM Product
JOIN Ticket ON Product.Id = Ticket.ProductVersionOpSysId
JOIN VersionVersion ON Product.Id = VersionVersion.Version
WHERE Ticket.CreatedDate BETWEEN 'DATE_DEBUT' AND 'DATE_FIN'
AND Ticket.StatusId = 1; -- Utilisez la valeur numérique correspondant à 'En cours'
