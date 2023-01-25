/*Δημιουργω εναν βοηθητικο πινακα Movie_crew_temp
στον οποιο εκχωρω τα δεδομενα απο τον πινακα 
Movie_crew και αφαιρω τα διπλοτυπα απο το column
movie_id και το person_id ετσι ωστε να μπορω να τα ορισω ως primary keys.
Ο κωδικας παρουσιαζεται παρακατω.
*/

create table "Movie_crew_temp" (LIKE "Movie_crew");

insert into "Movie_crew_temp"(movie_id,department,gender,person_id,job,name)
select 
    distinct on (movie_id,person_id) movie_id,department,gender,person_id,job,name
from "Movie_crew";

alter table "Movie_crew"
rename to "Movie_crew_first"

/*ΒΗΜΑ 2ο
Μετονομαζω  τον βοηθητικο πινακα Movie_crew_temp
σε Movie_crew.
Ο κωδικας παρουσιαζεται παρακατω.
*/

alter table "Movie_crew_temp"
rename to "Movie_crew"

/*ΒΗΜΑ 3ο
Οριζω primary keys στον πινακα Movie_crew.
Ο κωδικας παρουσιαζεται παρακατω.
*/

alter table "Movie_crew"
add primary key (movie_id,person_id)

/*ΤΑ ΒΗΜΑΤΑ ΠΡΕΠΕΙ ΝΑ ΓΙΝΟΥΜ ΜΕ ΤΗΝ ΣΕΙΡΑ
ΓΙΑ ΝΑ ΜΗΝ ΠΕΤΑΞΕΙ ERROR.ΔΗΛΑΔΗ: 
ΒΗΜΑ 1, ΤΡΕΧΩ ΤΟΝ ΚΩΔΙΚΑ
ΒΗΜΑ 2, ΤΡΕΧΩ ΤΟΝ ΚΩΔΙΚΑ
ΒΗΜΑ 3, ΤΡΕΧΩ ΤΟΝ ΚΩΔΙΚΑ
*/