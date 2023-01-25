/* ΒΗΜΑ 1ο
Δημιουργω εναν βοηθητικο πινακα Movie_Keywords_temp
στον οποιο εκχωρω τα δεδομενα απο τον πινακα 
Movie_Keywords και αφαιρω τα διπλοτυπα απο το column
movie_id ετσι ωστε να μπορω να το ορισω ως primary key.
Ο κωδικας παρουσιαζεται παρακατω.
*/

create table "Movie_Keywords_temp" (LIKE "Movie_Keywords");

insert into "Movie_Keywords_temp"(movie_id,keyword_id)
select 
    distinct on (movie_id) movie_id,keyword_id
from "Movie_Keywords";

alter table "Movie_Keywords"
rename to "Movie_Keywords_first"

/*ΒΗΜΑ 2ο
Μετονομαζω  τον βοηθητικο πινακα Movie_Keywords_temp
σε Movie_Keywords.
Ο κωδικας παρουσιαζεται παρακατω.
*/

alter table "Movie_Keywords_temp"
rename to "Movie_Keywords"

/*ΒΗΜΑ 3ο
Οριζω primary key στον πινακα Movie_Keywords.
Ο κωδικας παρουσιαζεται παρακατω.
*/

alter table "Movie_Keywords"
add primary key (movie_id)

/*ΤΑ ΒΗΜΑΤΑ ΠΡΕΠΕΙ ΝΑ ΓΙΝΟΥΜ ΜΕ ΤΗΝ ΣΕΙΡΑ
ΓΙΑ ΝΑ ΜΗΝ ΠΕΤΑΞΕΙ ERROR.ΔΗΛΑΔΗ: 
ΒΗΜΑ 1, ΤΡΕΧΩ ΤΟΝ ΚΩΔΙΚΑ
ΒΗΜΑ 2, ΤΡΕΧΩ ΤΟΝ ΚΩΔΙΚΑ
ΒΗΜΑ 3, ΤΡΕΧΩ ΤΟΝ ΚΩΔΙΚΑ
*/