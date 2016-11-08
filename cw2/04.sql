-- Query 4
-- For each type of product,find the customer who ordered the highest number of products of that type
-- (taking into account quantities). Return the product type and the ID of the customer. If two or more
-- customers are tied for a specific product type they will all be included in the output. If no products of
-- a specific type have ever been ordered, that type will not be in the output.

--SELECT s1.ptype, MAX(s1.MaxOfEachOrder)
--FROM (	SELECT P.ptype, O.ocust, MAX(D.qty) AS MaxOfEachOrder
--		FROM Products P, Orders O JOIN Details D ON O.ordid = D.ordid
--		WHERE O.ordid = D.ordid AND D.pcode = P.pcode
--		GROUP BY P.ptype, O.ocust ) s1 
--GROUP BY s1.ptype2

SELECT s3.ptype, s2.ocust
FROM (	SELECT s2.ptype, MAX(max)
		FROM (	SELECT P2.ptype, s1.ocust, SUM(s1.sum) as max 
				FROM (	SELECT P.pcode, O.ocust, SUM(D.qty) as sum 
						FROM Products P, Orders O JOIN Details D ON O.ordid = D.ordid
						WHERE D.pcode = P.pcode
						GROUP BY P.pcode, O.ocust ) s1 JOIN Products P2 ON s1.pcode = P2.pcode
				GROUP BY P2.ptype, s1.ocust ) s2
		GROUP BY s2.ptype ) s3
