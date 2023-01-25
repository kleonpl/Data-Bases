/*Query 01
Βρες μου όλες τις ταινίες που πρωταγωνιστεί ο Harison Ford στις οποίες
το budget ειναι μεγαλύτερο από 10.000.000. Εμφανιίζω με φθίνουσα σειρά τις στήλες
που περιέχουν τον τίτλο της ταινίας, το budget τον χαρακτήρα που υποδύοταν. 

Output : 24
*/

SELECT m.title,m.budget, mc.character
FROM "Movie" m
INNER JOIN "Movie_cast" mc ON m.id = mc.movie_id
WHERE mc.name = 'Harrison Ford'
	AND m.budget > 10000000
ORDER BY m.budget DESC;

/*Query 02
Βρες μου τον τίτλο και τις εισπράξεις των 10 πιο εμπορικά πετυχημένων ταινιών δράσης.

Output : 10
*/

SELECT m.title, m.revenue
FROM "Genre" g
INNER JOIN "Movie_genres" mg ON g.id = mg.genre_id
INNER JOIN "Movie" m ON mg.movie_id = m.id
WHERE g.name = 'Action'
ORDER BY revenue DESC
LIMIT 10;

/*Query 03
Βρες μου τις πιο δημοφηλείς ταινίες που βγήκαν μέσα στο έτος 2000 που έχουν ως keyword την λέξη friends.

Output : 307
*/

SELECT m.title, m.popularity
FROM "Keyword" k
INNER JOIN "Movie_Keywords" mk ON k.keyword_id = mk.keyword_id
INNER JOIN "Movie" m  ON m.id = mk.movie_id
WHERE k.name = 'friends'
	AND m.release_date  BETWEEN '2000-01-01' AND '2000-12-31'
ORDER BY m.popularity DESC;

/*Query 04
Bρες μου τον μέσο όρο της βαθμολογίας κάθε ταινίας.

Output : 1499
*/

SELECT m.title,AVG(r.rating) AS rating
FROM "Ratings" r
INNER JOIN "Movie" m ON r.movie_id = m.id
GROUP BY m.title;

/*Query 05
Βρες μου για κάθε studio που παράγει ταινίες, την ταινία που του έχει αποφέρει το μεγαλύτερο κέρδος. 

Output : 8054
*/

SELECT pc.name,m.title,MAX(m.revenue) as revenue
FROM "Movie" m 
INNER JOIN "Movie_production_companies" mpc ON m.id = mpc.movie_id
INNER JOIN "Production_company" pc ON mpc.pc_id = pc.id
WHERE m.revenue > 0
GROUP BY pc.name,m.title;

/*Query 06
Βρες μου όλους του μοναδικούς παραγωγούς που υπάρχουν.

Output : 5634
*/

SELECT DISTINCT name
FROM "Movie_crew"
WHERE department = 'Production'
	AND job = 'Producer'
ORDER BY name;

/*Query 07
Βρες μου το πλήθος του crew για κάθε ταινία που περιέχει την λέξη star στον τίτλο της.

Output : 30
*/

SELECT DISTINCT m.title, COUNT(mc.name) as number_of_crew_members
FROM "Movie" m
FULL OUTER JOIN "Movie_cast" mc ON m.id = mc.movie_id
WHERE m.title LIKE 'Star%'
GROUP BY m.title;

/*Query 08
Βρες μου όλες τις ταινίες στις οποίες έχει συνεισφέρει ο Quentin Tarantino

Output : 12
*/

SELECT DISTINCT m.title, m.revenue
FROM "Movie" m
LEFT OUTER JOIN "Movie_crew" mc ON m.id = mc.movie_id
WHERE mc.name = 'Quentin Tarantino' AND m.revenue > 0
ORDER BY m.revenue DESC;

/*Query 09
Βρες μου και ταξινόμησε με φθίνουσα σειρά όλες τις ταινίες που έχουν παράξει τα Walt Disney Studios.

Output : 119)
*/
SELECT DISTINCT m.title,m.popularity
FROM "Movie_production_companies" mpc
INNER JOIN "Production_company" pc ON mpc.pc_id = pc.id 
INNER JOIN "Movie" m on mpc.movie_id = m.id
WHERE pc.name = 'Walt Disney Pictures'
ORDER BY m.popularity DESC;

/*Query 10
Βρες μου και ταξινόμησε με φθίνουσα σειρά τις ταινίες που έχουν λάβει τις περισσότερες κριτικές από τους users.

Output : 1499
*/

SELECT m.title,COUNT(r.user_id) AS number_of_users
FROM "Movie" m
INNER JOIN "Ratings" r on m.id = r.movie_id
GROUP BY m.title
ORDER BY number_of_users DESC;

/*Query 11
Βρες μου για κάθε ταινία, πόσα άτομα συμμετείχαν στην συγγράφη της και παρουσίασε και την ιστοσελίδα της.

Output : 606
*/

SELECT DISTINCT m.title,m.homepage, COUNT(mc.job) AS number_of_writers
FROM "Movie" m
INNER JOIN "Movie_crew" mc ON m.id = mc.movie_id
WHERE homepage IS NOT NULL
    AND mc.department = 'Writing'
GROUP BY m.title,m.homepage
ORDER BY number_of_writers;


/*Query 12
Βρες μου όλες τις δραματικές ταινίες που έχουν λάβει βαθμολογία μεταξύ μεγαλύτερη απο 5

Output: 423
*/

SELECT DISTINCT m.title,m.popularity
FROM "Movie" m
INNER JOIN "Movie_genres" mg ON m.id = mg.movie_id
INNER JOIN "Genre" g ON g.id = mg.genre_id
INNER JOIN "Ratings" r ON m.id = r.movie_id
WHERE g.name = 'Drama'
	AND r.rating BETWEEN 5 AND 10
ORDER BY m.popularity DESC;