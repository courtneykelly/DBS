-- Query 4
-- For each type of product,find the customer who ordered the highest number of products of that type
-- (taking into account quantities). Return the product type and the ID of the customer. If two or more
-- customers are tied for a specific product type they will all be included in the output. If no products of
-- a specific type have ever been ordered, that type will not be in the output.

SELECT OJ.ptype, OJ.ocust
FROM (	SELECT O.ocust, PD.ptype, SUM(PD.NumProductsInOrder) AS NumProductsPerCustomer
		FROM Orders O 	
		JOIN (	SELECT D.ordid, P.ptype, SUM(D.qty) AS NumProductsInOrder
				FROM Details D 	
				JOIN Products P 
				ON D.pcode = P.pcode 
				GROUP BY D.ordid, P.ptype) PD 

		ON O.ordid = PD.ordid
		GROUP BY O.ocust, PD.ptype ) OJ

INNER JOIN (	SELECT  OPD.ptype, MAX(OPD.NumProductsPerCustomer) AS MaxProductsByType
				FROM (	SELECT O.ocust, PD.ptype, SUM(PD.NumProductsInOrder) AS NumProductsPerCustomer
						FROM Orders O 	
						JOIN (	SELECT D.ordid, P.ptype, SUM(D.qty) AS NumProductsInOrder
								FROM Details D 	
								JOIN Products P 
								ON D.pcode = P.pcode 
								GROUP BY D.ordid, P.ptype) PD 

						ON O.ordid = PD.ordid
						GROUP BY O.ocust, PD.ptype ) OPD
				
				GROUP BY OPD.ptype ) IJ

ON OJ.ptype = IJ.ptype AND OJ.NumProductsPerCustomer = IJ.MaxProductsByType


;









