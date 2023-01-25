/*ΕΡΩΤΗΜΑ 3
Δημιουργω εναν βοηθητικο πινακα τον οποιο τον ονομαζω
Movie_cast2 και δημιουργω 3 colums σε αυτον με ονοματα
person_id,name,gender. Ο κωδικας παρουσιαζεται παρακατω.
*/

CREATE TABLE "Movie_cast2" (
	person_id int,
	name varchar(1000),
	gender int);
	
/* Κανω εισαγωγη των δεδομενω απο τον πινακα Movie_cast
στον νεο βοηθητικο πινακα Movie_cast2 στα colums: person_id,
name, gender. Ο κωδικας παρουσιαζεται παρακατω.
*/

INSERT INTO "Movie_cast2"(person_id,name,gender)
SELECT person_id,name,gender FROM "Movie_cast";

/* Εφαρμοζω JOIN των δυο πινακων με την προυποθεση τα person_id
των δυο πινακων να ειναι ιδια. Αμεσως μετα κανω GROUP BY στα πεδια
mc.person_id,mc2.name,mc2.gender,mc.name,mc.gender τα οποια ειναι 
πεδια και απο τους δυο πινακες αφου ηταν προυποθεση για να μην πεταει 
error στο HAVING αφου τα χρησιμοποιω εκει. Στο HAVING πραγματοποιω 
συνθηκες οι οποιες λενε το name στον Movie_cast να ειναι διαφορετικο 
απο το name στο Movie_cast2 ή το gender στον Movie_cast να ειναι διαφορετικο 
απο το gender στο Movie_cast2. 
Αν αυτο επιστρεφει κενο σημαινει οτι δεν υπαρχουν
δυο ιδια person_id τα οποια να εχουν διαφορετικο name ή gender. 
Ο κωδικας παρουσιαζεται παρακατω. 
*/

SELECT DISTINCT(mc.person_id) AS person_id, mc2.name, mc2.gender
FROM "Movie_cast" mc
JOIN "Movie_cast2" mc2 ON mc.person_id = mc2.person_id
WHERE (mc.name != mc2.name) OR (mc.gender != mc2.gender);

/* Η εφαρμογη του παραπανω κωδικα παρουσιασε 2 εγγραφες οι οποιες ειχαν 
ιδιο person_id, ιδιο name αλλα στην μια εγγραφη υπηρχε gender=0 και στην 
αλλη υπηρχε gender=2. Χειροκινητα αλλαξαμε τις γραμμες οι οποιες ειχαν gender=2
και τις καναμε να εχουν gender=0 και απο τους δυο πινακες.
Μετα την εφαρμογη του παρακατω κωδικα αν ξανα τρεξουμε 
τον παραπανω κωδικα επιστρεφει κενο αρα ισχύει
η ιδιότητά που ψάχνουμε.Ο κωδικας παρουσιαζεται παρακατω. 
*/

UPDATE "Μovie_cast"
SET gender =0
WHERE person_id =47395 OR person_id =1785844;

UPDATE "Μovie_cast2"
SET gender =0
WHERE person_id =47395 OR person_id =1785844;


-----------------------------------------------------------------------

/*ΕΡΩΤΗΜΑ 4
Σε αυτο το ερωτημα εφαρμοζω ακριβως τα ιδια βηματα με το
ερωτημα 3 δηλαδη:
1)Δημιουργια βοηθητικου πινακα με ονομα Movie_crew2 και 
colums person_id,name,gender.
2)Μεταφορα δεδομενων απο τον πινακα Movie_crew στον Movie_crew2.
Ο κωδικας παρουσιαζεται παρακατω.
*/

CREATE TABLE "Movie_crew2" (
	person_id int,
	name varchar(1000),
	gender int);

INSERT INTO "Movie_crew2"(person_id,name,gender)
SELECT person_id,name,gender FROM "Movie_crew";

/* Με την εφαρμογη παρομοιου κωδικα οπως του ερωτηματος 3
θα φτασω στο συμπερασμα αν ισχυει η ιδιοτητα που μας ζητητε.
Δεν επιστρεφεται κενο αλλα επιστρεφει δυο εγγραφες με ιδιο person_id
και ιδιο gender αλλα στο name υπαρχει κατι διαφορετικο. Εμφανιζεται το 
ιδιο ονομα απλα με διαφορετικη σειρα. Δηλαδη στην πρωτη εγγραφη παρουσιαζεται 
το ονομα 'Cheung Ka-Fai' ενω στην δευτερη εγγραφη το ονομα 'Ka-Fai Cheung'.
Ο κωδικας παρουσιαζεται παρακατω.
*/

SELECT DISTINCT(mc.person_id) AS person_id, mc2.name, mc2.gender
FROM "Movie_crew" mc
JOIN "Movie_crew2" mc2 ON mc.person_id = mc2.person_id
WHERE (mc.name != mc2.name) AND (mc.gender != mc2.gender);

/* Με προσωπικη μας κριση θεωρησαμε πως πρεπει 
να αλλαξουμε το ονομα σε μια  
απο τις δυο εγγραφες (και απο τους δυο 
πινακες) ετσι ωστε να εμφανιζει κενο στην εκτελεση του παραπανω
κωδικα οπως μας ζητηθηκε απο την εκφωνηση της ασκησης.
Μετα την εφαρμογη των παρακατω εντολων ο παραπανω κωδικας εμφανιζει κενο.
Ο κωδικας παρουσιαζεται παρακατω.
*/

UPDATE "Movie_crew"
SET name ='Cheung Ka-Fai'
WHERE person_id =63574;

UPDATE "Movie_crew2"
SET name ='Cheung Ka-Fai'
WHERE person_id =63574;






























