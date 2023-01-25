/* Το table Movie_production_companies δεν ειχε διπλοτυπα
στα columns  movie_id και pc_id που αποφασισαμε ως πρωτευων κλειδια 
αρα ο ορισμος τους ως primary keys εγινε απλα.
Ο κωδικας παρουσιαζεται παρακατω.
*/

ALTER TABLE "Movie_production_companies"
ADD PRIMARY KEY (movie_id,pc_id);