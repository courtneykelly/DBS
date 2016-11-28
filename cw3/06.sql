/* 	Query 6
	Find the average total running time of all albums released in the ’90s with at least 10 tracks and where
	no tracks are missing. Round the average to the nearest integer and return two integer columns: one
	for the number of minutes and one for the number of seconds
*/

SELECT FLOOR(AVG(BT.AlbumLength)/60) AS Minutes, ROUND(AVG(BT.AlbumLength) % 60) AS Seconds 
FROM (	SELECT B.title, B.artist, SUM(T.track_length) AS AlbumLength
		FROM Albums B 	JOIN Tracks T 
						ON T.album_artist = B.artist
						AND T.album_title = B.title
		WHERE B.ryear > 1989 AND B.ryear < 2000
		GROUP BY B.title, B.artist
		HAVING COUNT( DISTINCT T.track_number ) = B.tracks AND COUNT( DISTINCT T.track_number ) >= 10 ) BT

;