-- Query 4
-- Customers who have not placed any orders in 2016. Return all attributes

SELECT *
FROM Customers C
WHERE NOT EXISTS (	SELECT *
					FROM Orders O
					WHERE C.custid = O.ocust
					AND EXTRACT(year FROM O.odate) = 2016 )

;