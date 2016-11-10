/* 	Query 8
 	Find customers who spent less than 50 in music in the period between January and June 2016 (extremes
	included). Return the customer ID and the corresponding spend. Customers who have not bought any
	music in the given period must be returned with 0.00 spend (precisely in this form).
*/

SELECT COALESCE(LJ.ocust, RJ.custid) as CustomerID, COALESCE(LJ.TotalSpend, 0.00)
FROM (	SELECT O.ocust, CAST(SUM(COALESCE(PD.OrderCost,0)) AS Numeric(8,2)) AS TotalSpend
		FROM Orders O 	
		LEFT JOIN (	SELECT D.ordid, SUM(D.qty*P.price) AS OrderCost
					FROM Details D 	JOIN Products P 
					ON D.pcode = P.pcode AND P.ptype = 'MUSIC' 
					GROUP BY D.ordid ) PD 

		ON O.ordid = PD.ordid AND EXTRACT(year FROM O.odate) = 2016 AND EXTRACT(month FROM O.odate) <= 06
		GROUP BY O.ocust
		HAVING SUM(COALESCE(PD.OrderCost,0)) < 50 ) LJ

FULL JOIN (	SELECT C.custid
			FROM Customers C
			WHERE C.custid NOT IN (	SELECT O.ocust
									FROM Orders O 
									LEFT JOIN (	SELECT D.ordid
												FROM Details D 	JOIN Products P 
												ON D.pcode = P.pcode AND P.ptype = 'MUSIC' ) PD
									ON O.ordid = PD.ordid
									AND EXTRACT(year FROM O.odate) = 2016  
									AND EXTRACT(month FROM O.odate) <= 06 ) ) RJ
ON LJ.ocust = RJ.custid

/*	Need to do a FULL JOIN with customers who didn't buy any music in the given period
*/

;
