/*	Query 7
	Find artists whose combined number of live and compilation albums exceeds the number of studio
	ones. Return the artist’s name
*/


SELECT LC.artist
FROM (	SELECT B.artist, COUNT(B.rtype)AS LCAlbums
		FROM Albums B 
		WHERE B.rtype in ('LIVE', 'COMPILATION')
		GROUP BY B.artist ) LC 
	FULL JOIN (	SELECT B.artist, COUNT(B.rtype) AS SAlbums
			FROM Albums B 
			WHERE B.rtype in ('STUDIO')
			GROUP BY B.artist ) S
	ON LC.artist = S.artist 
WHERE COALESCE(LC.LCAlbums,0) > COALESCE(S.SAlbums,0)

;