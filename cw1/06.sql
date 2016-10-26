-- Query 6
-- Invoices that have been overpaid. Observe that there may be more than
-- one payment referring to the same invoice. Return the invoice number
-- and the amount that should be reimbursed

SELECT Subquery.invid, Subquery.TotalAmount - Subquery.amount
FROM (	SELECT SUM(P.amount) AS TotalAmount, I.invid, I.amount 
		FROM Payments P, Invoices I
		WHERE I.invid = P.invid 
		GROUP BY I.invid) AS Subquery
WHERE Subquery.TotalAmount > Subquery.amount

;