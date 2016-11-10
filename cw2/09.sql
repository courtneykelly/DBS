/*	Query 9
	For each customer who has placed at least two orders, calculate the longest number of days ever elapsed
	between any one order and the next. The only case in which this interval (which you can calculate as
	the difference of two dates) will be zero is for customers who placed at least two orders and all of them
	were placed in the same day. Whether an order has a detail is irrelevant. Return the customer ID and
	the corresponding interval (which will be an integer).
*/


SELECT COALESCE(RJ.ocust, LJ.custid), COALESCE(RJ.MaxDaysBetweenOrders,0)
FROM (	SELECT OCO.ocust, MAX(DaysBetweenNextOrder) AS MaxDaysBetweenOrders
		FROM (	SELECT O.ocust, O.ordid, MIN(CO.odate - O.odate) as DaysBetweenNextOrder
				FROM  Orders O , (	SELECT C.custid, O.odate
									FROM Customers C JOIN Orders O ON C.custid = O.ocust
									WHERE C.custid IN (	SELECT C.custid
														FROM Customers C JOIN Orders O ON C.custid = O.ocust
														GROUP BY C.custid
														HAVING COUNT( DISTINCT O.ordid ) >= 2 ) ) CO			
				WHERE O.ocust = CO.custid AND (CO.odate - O.odate) > 0
				GROUP BY O.ocust, O.ordid ) OCO
		GROUP BY OCO.ocust ) RJ
FULL JOIN (	SELECT C.custid
			FROM Customers C JOIN Orders O ON C.custid = O.ocust
			GROUP BY C.custid
			HAVING COUNT( DISTINCT O.ordid ) >= 2 ) LJ
ON RJ.ocust = LJ.custid

;
