-- Query 2
-- For each product type calculate the average number of times products of that type have been included
-- in an order (taking into account quantities). Orders that do not include any product of a certain type
-- do not contribute to the average for that type (rather than contributing 0). Return the product type
-- and the corresponding average; the latter must be a number with exactly two decimal places. Types of
-- products that have never been ordered are not included in the output.

SELECT s1.ptype, ROUND(AVG(s1.sum),2)
FROM (	SELECT D.ordid, P.ptype, SUM(D.qty) AS sum
		FROM Products P JOIN Details D ON P.pcode = D.pcode
		GROUP BY D.ordid, P.ptype ) s1
GROUP BY s1.ptype

;