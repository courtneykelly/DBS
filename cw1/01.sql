-- Query 1: Invoices issued after their due date

SELECT *
FROM Invoices I
WHERE I.issued > I.due
;