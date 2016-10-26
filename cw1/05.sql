-- Query 5
-- ID and name of customers and the date of their last order. For 
-- customers who did not place any orders, no rows must be returned.
-- For each customer who placed more than one order on the date of
-- their most recent order, only one row must be returned.

SELECT C.custid, C.cname, MAX(O.odate)
FROM Customers C, Orders O
WHERE C.custid = O.ocust
GROUP BY C.custid 

;