-- Query 2
-- Invoices that were issued before the date in which the order they refer
-- to was placed. Return the ID of the invoice, the date it was issued, 
-- the ID of the order associated with it and the date it was placed.

SELECT I.invid, I.issued, I.ordid, O.odate
FROM Invoices I, Orders O 
WHERE I.ordid = O.ordid AND I.issued < O.odate

;