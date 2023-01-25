/* Το table Movie_collection δεν ειχε διπλοτυπα
στο column  movie_id που αποφασισαμε ως πρωτευων κλειδι 
αρα ο ορισμος του primary key εγινε απλα.
Ο κωδικας παρουσιαζεται παρακατω.
*/

ALTER TABLE "Movie_collection"
ADD PRIMARY KEY (movie_id);