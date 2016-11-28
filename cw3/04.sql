/* 	Query 4
	Find tracks shorter than 2 minutes and 34 seconds from albums rated 4 or 5 stars and released after
	1995. Return the album’s title and artist and the track’s number
*/


SELECT B.title, B.artist, T.track_number
FROM Tracks T 	JOIN Albums B
				ON T.album_artist = B.artist
				AND T.album_title = B.title
WHERE B.rating IN ('4','5')
AND T.track_length < 154
AND B.ryear > 1995

;