-- 	Query 1
--	Find artists who have only released studio albums. Artists who have not released any albums are not
--	included in the output. Return the artist’s name.

SELECT B.artist 
FROM Albums B 
GROUP BY B.artist
HAVING COUNT( DISTINCT B.rtype ) = 1 AND (array_agg(B.rtype))[1] = 'STUDIO'
;