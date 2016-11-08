-- Query 1
-- Total number of orders placed in 2016 by customers of each country. If all customers from a specific
-- country did not place any orders in 2016, the country appears in the output with 0 total orders. Return
-- all countries and corresponding total counts.

SELECT C.country, COUNT( DISTINCT O.ordid )
FROM Customers C 
	LEFT JOIN Orders O ON C.custid = O.ocust AND EXTRACT(year FROM O.odate) = 2016
GROUP BY C.country

;


-- Need to do a LEFT JOIN on Orders. The LEFT JOIN will return null for those countries that do not have
-- any orders. The aggregate function Count() will not count NULL values and thus you'll get 0.