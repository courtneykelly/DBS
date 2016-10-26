-- Query 7
-- Products that were ordered more than 10 times in total, by taking into
-- account that quantities in which they appear in order details. Return 
-- the product code and the total number of times it was ordered. 

SELECT Subquery.pcode, Subquery.tot
FROM (	SELECT SUM(D.qty) AS tot, P.pcode
		FROM Details D, Products P 
		WHERE P.pcode = D.pcode 
		GROUP BY P.pcode ) AS Subquery
WHERE Subquery.tot > 10

;