-- Query 3
-- Find invoices that have been vatted. The amount of such invoices is the total of the order they refer to
-- plus 20%. Return the invoice ID. Keep in mind the datatype of "amount" in invoices and pay special
-- attention to rounding. Do not use PostgreSQL's round function, which is not SQL standard and would
-- likely give you a wrong result.

SELECT s.invid
FROM (	SELECT I.invid, I.amount as InvoicePrice, SUM(P.price*D.qty) as TruePrice
		FROM Invoices I, Details D, Products P 
		WHERE I.ordid = D.ordid AND D.pcode = P.pcode 
		GROUP BY I.invid ) s
WHERE CAST((s.TruePrice + (.2*s.TruePrice)) AS Numeric(8,2)) = InvoicePrice

;