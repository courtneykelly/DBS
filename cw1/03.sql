-- Query 3
-- Orders that do not have a detail and were placed before 6 September
-- 2016. Return all attributes

SELECT *
FROM Orders O
WHERE NOT EXISTS (	SELECT *
					FROM Details D
					WHERE D.ordid = O.ordid) 
AND O.odate::date < '2016-09-06'

;