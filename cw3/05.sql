/*	Query 5
	Find albums with missing tracks. Return the album’s title and artist and the number of missing tracks.
	Albums without missing tracks are not included in the output
*/

SELECT B.title, B.artist, B.tracks - COUNT( DISTINCT T.track_number ) AS MissingTracks
FROM Albums B 	JOIN Tracks T 
				ON T.album_artist = B.artist
				AND T.album_title = B.title
GROUP BY B.title, B.artist
HAVING COUNT( DISTINCT T.track_number ) < B.tracks

;