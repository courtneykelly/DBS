-- Query 7
/* Find "poor readers": customers who have not purchased any books in 2016. Return the customer ID
*/

SELECT COALESCE(LJ.ocust, RJ.custid) as CustomerID
FROM (	SELECT O.ocust
		FROM Orders O 	
		WHERE EXTRACT(year FROM O.odate) = 2016
		GROUP BY O.ocust
		HAVING 'BOOK' NOT IN (	SELECT OPD2.ptype
								FROM (	SELECT O.ocust, PD2.ptype
										FROM Orders O 	
										JOIN (	SELECT D.ordid, P.ptype
												FROM Details D JOIN Products P 
												ON D.pcode = P.pcode ) PD2

										ON O.ordid = PD2.ordid AND EXTRACT(year FROM O.odate) = 2016 ) OPD2
								WHERE O.ocust = OPD2.ocust ) )LJ
FULL JOIN (	SELECT C.custid
			FROM Customers C
			WHERE C.custid NOT IN (	SELECT O.ocust
									FROM Orders O 
									WHERE EXTRACT(year FROM O.odate) = 2016 ) ) RJ
ON LJ.ocust = RJ.custid

/* Have to FULL JOIN with customers that did not place any orders in 2016
*/

;