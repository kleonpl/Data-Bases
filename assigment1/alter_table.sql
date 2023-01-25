ALTER TABLE "Movie_Keywords"
ADD FOREIGN KEY (keyword_id) REFERENCES "Keyword",
ADD FOREIGN KEY (movie_id) REFERENCES "Movie" ;

ALTER TABLE "Movie_cast"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id);

ALTER TABLE "Movie_collection"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id),
ADD FOREIGN KEY (collection_id ) REFERENCES "Collection"(id);

ALTER TABLE "Movie_crew"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id);

ALTER TABLE "Movie_genres"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id),
ADD FOREIGN KEY (genre_id) REFERENCES "Genre"(id);

ALTER TABLE "Movie_production_companies"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id),
ADD FOREIGN KEY (pc_id) REFERENCES "Production_company"(id);

ALTER TABLE "Ratings"
ADD FOREIGN KEY (movie_id) REFERENCES "Movie"(id);


