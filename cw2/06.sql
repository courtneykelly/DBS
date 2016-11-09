-- Query 6
-- For each product type, calculate the number of orders consisting only of products of that type. Return
-- the product type and the number of orders.

SELECT OPD.type, COUNT(OPD.ordid)
FROM (	SELECT O.ordid, (array_agg(PD.ptype))[1] AS type
		FROM Orders O 	
		JOIN (	SELECT D.ordid, P.ptype
				FROM Details D 	
				JOIN Products P 
				ON D.pcode = P.pcode ) PD 

		ON O.ordid = PD.ordid 
		GROUP BY O.ordid
		HAVING ( COUNT( DISTINCT PD.ptype ) = 1 ) ) OPD

GROUP BY OPD.type

;
