/*	Query 10
	Two studio albums are consecutive if they are released in different years, say Y1 and Y2, and there is no
	studio album released strictly between Y1 and Y2. Find artists who have never released two consecutive
	studio albums more than 4 years apart. Artists who have released less than 2 studio albums in total
	do satisfy this condition and must be included in the output. Return the artist’s name.
*/


SELECT A.aname
FROM Artists A 
WHERE 4 >= COALESCE(  (	SELECT  MAX(NextDate - T.CurrDate)
						FROM    (   SELECT  B1.artist, B1.ryear AS CurrDate,
						                    (   SELECT  MIN(B2.ryear) 
						                        FROM    Albums B2 
						                        WHERE   B2.artist = B1.artist
						                        AND 	B2.rtype = 'STUDIO'
						                        AND     B2.ryear > B1.ryear
						                    ) AS NextDate
						            FROM    Albums B1 
						            WHERE B1.rtype = 'STUDIO' ) AS T
						WHERE A.aname = T.artist
						GROUP BY T.artist ), 0 )


;