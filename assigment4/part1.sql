/* Ερωτημα 4,6
Δημιουργω τον πινακα Person και  κανω μεταφορα δεδομενων
απο τους πινακες Movie_cast & Movie_crew στα αντιστοιχα πεδια.
Δημιουργω τους πινακες Actor & CrewMember και τους 
οριζω primary key. Στην συνεχεια κανω μεταφορα δεδομενων
απο τους πινακες Movie_cast & Movie_crew αντιστοιχα.
Τελος οριζω foreign keys για τους πινακες Actor & CrewMember
τα οποια δειχνουν στον πινακα Person.
*/


CREATE TABLE "Person" (
	person_id int NOT NULL,
	name varchar(1000),
	gender int,
	PRIMARY KEY (person_id)
	);
		
INSERT INTO "Person"(person_id,name,gender)
SELECT person_id,name,gender FROM "Movie_cast"
UNION 
SELECT person_id,name,gender FROM "Movie_crew";

CREATE TABLE "Actor"(
	person_id int NOT NULL,
	PRIMARY KEY (person_id)
);

INSERT INTO "Actor" (person_id)
SELECT person_id FROM "Movie_cast";

CREATE TABLE "CrewMember"(
	person_id int NOT NULL,
	PRIMARY KEY (person_id)
);

INSERT INTO "CrewMember" (person_id)
SELECT person_id FROM "Movie_crew";

ALTER TABLE "Actor"
ADD FOREIGN KEY (person_id) REFERENCES "Person"(person_id);

ALTER TABLE "CrewMember"
ADD FOREIGN KEY (person_id) REFERENCES "Person"(person_id);
---------------------------------------

/*Ερωτημα 7
Δημιουργω κλονους των πινακων
Movie_cast & Movie_crew για τον ελεγχο 
της εργασιας.
Αφαιρω τα πεδια name & gender και απο 
τους δυο πινακες Movie_cast & Movie_crew.
Οριζω foreign keys για τους πινακες Μovie_cast & Movie_crew
τα οποια δειχνουν στους πινακες Actor & CrewMember αντιστοιχα.
*/

CREATE TABLE "Movie_cast_temp" (
	movie_id int,
	cast_id int,
	character varchar(1000),
	gender int,
	person_id int,
	name varchar(1000));
	
CREATE TABLE "Movie_crew_temp" (
	movie_id int,
	department varchar(1000),
	gender int,
	person_id int,
	job varchar(1000),
	name varchar(1000));
	
INSERT INTO "Movie_cast_temp"(movie_id,cast_id,character,gender,person_id,name)
SELECT movie_id,cast_id,character,gender,person_id,name FROM "Movie_cast";

INSERT INTO "Movie_crew_temp"(movie_id,department,gender,person_id,job,name)
SELECT movie_id,department,gender,person_id,job,name FROM "Movie_crew";


ALTER TABLE "Movie_cast"
DROP COLUMN name;

ALTER TABLE "Movie_cast"
DROP COLUMN gender;

ALTER TABLE "Movie_crew"
DROP COLUMN name;

ALTER TABLE "Movie_crew"
DROP COLUMN gender;

ALTER TABLE "Movie_cast"
ADD FOREIGN KEY (person_id) REFERENCES "Actor"(person_id);

ALTER TABLE "Movie_crew"
ADD FOREIGN KEY (person_id) REFERENCES "CrewMember"(person_id);

----------------------------------------------------
/*Ερωτημα 5.
Ελεγχω αν τηρουνται οι συναρτησιακες
εξαρτησεις  person_id → name & person_id → gender 
με join των πινακων Movie_cast & Movie_crew που 
ουσιαστικα ειναι ο πινακας Person.Βεβαια μετα 
την ολοκληρωση της εργασιας αυτος ο κωδικας δεν 
θα λειτουργει γιατι οπως θα δουμε θα διαγραφουν 
τα culomns name & gender απο αυτους τους πινακες.
Αρα θα πρεπει να χρεισημοποιηθουν οι βοηθητικοι
πινακες για τον ελεγχο. Ο ελεγχος επιστρεφει κενο
αρα δεν υπαρχουν εγγραφες που παραβιαζουν τις συναρτησιακες εξαστησεις.
*/

SELECT ca.person_id,ca.name, ca.gender
FROM "Movie_cast" ca
JOIN "Movie_crew" cr ON ca.person_id = cr.person_id
WHERE (ca.name != cr.name) AND (ca.gender != cr.gender);

---------------------------------------------------

























