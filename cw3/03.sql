/*	Query 3
	Find live albums released by British artists (i.e., whose country is GBR) and having a higher rating
	than the average rating of all albums released (by any artist) in the same year
*/

SELECT B.title, B.artist
FROM Artists A 	JOIN Albums B 
				ON A.aname = B.artist 
				AND A.country = 'GBR' 
				AND B.rtype = 'LIVE', (	SELECT B.ryear, AVG(B.rating) AS AvgRating
										FROM Albums B
										GROUP BY B.ryear ) YT
WHERE B.ryear = YT.ryear AND B.rating > YT.AvgRating

;