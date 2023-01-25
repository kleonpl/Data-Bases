/* Το table Movie_genres δεν ειχε διπλοτυπα
στα columns  movie_id και genre_id που αποφασισαμε ως πρωτευων κλειδια 
αρα ο ορισμος τους ως primary keys εγινε απλα.
Ο κωδικας παρουσιαζεται παρακατω.
*/

ALTER TABLE "Movie_genres"
ADD PRIMARY KEY (movie_id,genre_id);