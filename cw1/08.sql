-- Query 8
-- Products that are usually listed in bulk: whenever one of these 
-- products is ordered, it is ordered in a quantity that on average
-- is equal to order greater than 8. For each such product, return
-- product code and price.

SELECT Subquery.pcode, Subquery.price
FROM  (	SELECT P.pcode, P.price, AVG(D.qty) AS avg
		FROM Details D, Products P
		WHERE D.pcode = P.pcode 
		GROUP BY P.pcode ) AS Subquery
WHERE Subquery.avg >= 8

;