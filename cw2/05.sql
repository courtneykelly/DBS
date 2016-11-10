-- Query 5
-- For each customer, calculate the number of orders placed and the average spend, which is the average
-- total (taking into account quantities and unit prices of ordered products) across all orders placed by
-- that customer. Return the customer ID, the number of orders, and the corresponding average spend.
-- The latter must be a number with exactly two decimal places. Orders without detail must be considered
-- in the calculation of the average as having a total of 0. Customers who did not place any orders will
-- be included in the output with 0 orders (not 0.00 or anything else, just 0) and NULL average spend.

SELECT C.custid, COUNT(OPD.ocust), CAST(AVG(OPD.OrderCost) AS Numeric(8,2))
FROM Customers C 
LEFT JOIN (	SELECT O.ocust, O.ordid, COALESCE(PD.OrderCost,0) AS OrderCost
			FROM Orders O 	
			LEFT JOIN (	SELECT D.ordid, SUM(D.qty*P.price) AS OrderCost
						FROM Details D JOIN Products P 
						ON D.pcode = P.pcode
						GROUP BY D.ordid ) PD 

			ON O.ordid = PD.ordid ) OPD 

ON C.custid = OPD.ocust
GROUP BY C.custid

;