-- 	Query 2
-- 	Find albums with a higher rating than every previous album by the same band. Return the album’s
--	title and artist.


SELECT B1.title, B1.artist
FROM Artists A 	JOIN Albums B1
				ON A.aname = B1.artist 
				AND A.atype = 'BAND'
WHERE B1.rating > (	SELECT COALESCE(MAX(B2.rating),0)
					FROM Albums B2 
					WHERE B2.artist = B1.artist
					AND B2.ryear < B1.ryear )



;