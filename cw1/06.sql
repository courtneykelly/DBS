-- Query 6
-- Invoices that have been overpaid. Observe that there may be more than
-- one payment referring to the same invoice. Return the invoice number
-- and the amount that should be reimbursed

SELECT I.invid, Subquery.TotalAmount - I.amount
FROM Invoices I, (	SELECT SUM(P.amount) AS TotalAmount, P.invid AS TotalID
					FROM Payments P, Invoices I2
					WHERE I2.invid = P.invid 
					GROUP BY p.invid ) AS Subquery
WHERE Subquery.TotalAmount > I.amount
AND I.invid = Subquery.TotalID
;