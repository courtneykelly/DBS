/*	Query 10
	Find customers who have placed at least 5 orders, all in different dates, and the interval between any
	one of their orders and the next (not on the same date) is less than 30 days on average. The interval
	between any two orders placed in the same day (which is 0) does not contribute to the average. Whether
	an order has a detail or not is irrelevant. Return the customer ID only.
*/

SELECT OCO.ocust
FROM (	SELECT O.ocust, O.ordid, MIN(CO.odate - O.odate) as DaysBetweenNextOrder
		FROM  Orders O , (	SELECT C.custid, O.odate
							FROM Customers C JOIN Orders O ON C.custid = O.ocust
							WHERE C.custid IN (	SELECT O.ocust
												FROM Orders O
												GROUP BY O.ocust
												HAVING (COUNT( DISTINCT O.odate ) >= 5)) ) CO			
		WHERE O.ocust = CO.custid AND (CO.odate - O.odate) > 0
		GROUP BY O.ocust, O.ordid ) OCO
GROUP BY OCO.ocust
HAVING AVG(DaysBetweenNextOrder) < 30
ORDER BY OCO.ocust


;