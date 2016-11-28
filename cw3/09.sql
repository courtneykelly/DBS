/*	Query 9
	For each artist, find the percentage p of their albums rated less than 3. Artists who have not released
	any album are not included in the output. Artists who have only released albums rated 3 or more are
	included in the output with p = 0.00. Return the artist’s name and the corresponding percentage p as
	a number between 0 and 100 with 2 decimal digits
*/

SELECT COALESCE(LJ.artist, RJ.artist), CAST((COALESCE(RJ.BadRating,0)/(COALESCE(RJ.BadRating,0)+COALESCE(LJ.GoodRating,0)))*100 AS Numeric(8,2)) AS PercentBadRating
FROM (	SELECT B.artist, CAST(COUNT(B.rating) AS Numeric(8,2)) AS GoodRating
		FROM Albums B 
		WHERE B.rating >= 3
		GROUP BY B.artist ) LJ
FULL JOIN (	SELECT B.artist, CAST(COUNT(B.rating) AS Numeric(8,2)) AS BadRating
		FROM Albums B
		WHERE B.rating < 3
		GROUP BY B.artist ) RJ
ON LJ.artist = RJ.artist

;