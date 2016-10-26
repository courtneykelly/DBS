-- Query 10
-- For each order without an invoice, list its ID, the date it was placed
-- and the total price of the products in its detail, taking into account
-- the quanitity of each ordered product and its unit price. Orders 
-- without detail must not be included in the answers

SELECT s.ordid, s.odate, SUM(s.tot)
FROM (	SELECT O.ordid, O.odate, SUM(D.qty)*P.price as tot 
		FROM Orders O, Details D, Products P 
		WHERE 	O.ordid = D.ordid AND D.pcode = P.pcode
		GROUP BY O.ordid, P.price ) s
WHERE NOT EXISTS (	SELECT *
					FROM Invoices I
					WHERE s.ordid = I.ordid )
GROUP BY s.ordid, s.odate

;