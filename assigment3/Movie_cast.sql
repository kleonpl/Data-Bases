/* ΒΗΜΑ 1ο
Δημιουργω εναν βοηθητικο πινακα Movie_cast_temp
στον οποιο εκχωρω τα δεδομενα απο τον πινακα 
Movie_cast και αφαιρω τα διπλοτυπα απο το column
person_id ετσι ωστε να μπορω να το ορισω ως primary key.
Ο κωδικας παρουσιαζεται παρακατω.
*/

create table "Movie_cast_temp" (LIKE "Movie_cast");

insert into "Movie_cast_temp"(movie_id,cast_id,character,gender,person_id,name)
select 
    distinct on (person_id) movie_id,cast_id,character,gender,person_id,name
from "Movie_cast";

alter table "Movie_cast"
rename to "Movie_cast_first"

/*ΒΗΜΑ 2ο
Μετονομαζω  τον βοηθητικο πινακα Movie_cast_temp
σε Movie_cast.
Ο κωδικας παρουσιαζεται παρακατω.
*/

alter table "Movie_cast_temp"
rename to "Movie_cast"

/*ΒΗΜΑ 3ο
Οριζω 2 primary keys στον πινακα Movie_cast.
Ο κωδικας παρουσιαζεται παρακατω.
*/

alter table "Movie_cast"
add primary key (movie_id,person_id)

/*ΤΑ ΒΗΜΑΤΑ ΠΡΕΠΕΙ ΝΑ ΓΙΝΟΥΜ ΜΕ ΤΗΝ ΣΕΙΡΑ
ΓΙΑ ΝΑ ΜΗΝ ΠΕΤΑΞΕΙ ERROR.ΔΗΛΑΔΗ: 
ΒΗΜΑ 1, ΤΡΕΧΩ ΤΟΝ ΚΩΔΙΚΑ
ΒΗΜΑ 2, ΤΡΕΧΩ ΤΟΝ ΚΩΔΙΚΑ
ΒΗΜΑ 3, ΤΡΕΧΩ ΤΟΝ ΚΩΔΙΚΑ
*/