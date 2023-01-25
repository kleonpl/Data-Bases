/*Ερωτημα 1ο
Βρες ολες τις γυναικες ηθοποιους των 
οποιων το ονομα ειναι 'Maria' ή αρχιζει 
με το πρωτο συνθετικο 'Maria' και καντα 
"γκρουπαρισμα" με βαση το ονομα.
Output: 81 rows
*/

SELECT p.name
FROM "Person" p
JOIN "Actor" a ON p.person_id = a.person_id
WHERE p.gender = '1' AND p.name LIKE 'Maria%'
GROUP BY p.name ;

/*Ερωτημα 2ο
Βρες μου τον αριθμο των υπαλληλων
που δουλευουν ως Director και τον αριθμο 
των υπαλληλων που δουλευουν  ως Producer
και καντα "γκρουπαρισμα" με βαση το την δουλεια τους.
Output: 2 rows
*/ 

SELECT COUNT(mc.job) AS Number_of_employees, mc.job
FROM "Person" p
JOIN "CrewMember" c ON p.person_id = c.person_id 
JOIN "Movie_crew" mc ON c.person_id = mc.person_id
GROUP BY mc.job
HAVING mc.job = 'Director' OR mc.job = 'Producer';

/*Ερωτημα 3ο
Βρες μου τον αριθμο των υπαλληλων
που δουλευουν στα τμηματα Sound ή Editing
και εχουν δηλωσει ως φυλο οτι ειναι γυναικες ή αντρες.
Output: 4 rows
*/

SELECT COUNT(cr.department) AS Number_of_employees, cr.department,p.gender
FROM "Person" p 
JOIN "Movie_crew" cr ON p.person_id = cr.person_id
WHERE cr.department = 'Sound' OR cr.department = 'Editing'
GROUP BY cr.department, p.gender
HAVING p.gender = '1' OR p.gender = '2'
ORDER BY cr.department DESC