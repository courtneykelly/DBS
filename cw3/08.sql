/*	Query 8
	Find the number of US (i.e., country is USA) bands whose debut album (or at least one of them, if
	there are multiple ones) is rated 5 stars.
*/

SELECT COUNT( DISTINCT LJ.artist) AS NumArtists
FROM (	SELECT B.artist, B.rating, B.ryear
		FROM Artists A 	JOIN Albums B 
						ON A.aname = B.artist 
						AND A.country = 'USA'
						AND A.atype = 'BAND' ) LJ
JOIN (	SELECT B.artist, MIN(B.ryear) AS DebutAlbumYear
		FROM Artists A 	JOIN Albums B 
						ON A.aname = B.artist 
						AND A.country = 'USA'
						AND A.atype = 'BAND'
		GROUP BY B.artist ) RJ
ON LJ.artist = RJ.artist AND LJ.ryear = RJ.DebutAlbumYear
WHERE LJ.rating = 5

;