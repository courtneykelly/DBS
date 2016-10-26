-- Query 9
-- Total number of orders placed in 2016 by customers of each country.
-- If all customers from a specific country did not place any orders 
-- in 2016, the country not appear in the output.

SELECT C.country, COUNT( DISTINCT O.ordid )
FROM Customers C, Orders O 
WHERE C.custid = O.ocust
AND EXTRACT(year FROM O.odate) = 2016
GROUP BY C.country

;