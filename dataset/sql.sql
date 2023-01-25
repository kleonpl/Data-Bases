-- CREATE TABLE --

CREATE TABLE "Collection"(
    id INT NOT NULL,
    name VARCHAR(1000),
    PRIMARY KEY(id)
);

CREATE TABLE "Movie"(
   id  INT NOT NULL,
   adult VARCHAR(10),
   budget INT,
   homepage VARCHAR(230),
   original_language VARCHAR(10),
   original_title VARCHAR(110),
   title VARCHAR(110),
   tagline VARCHAR(280),
   overview VARCHAR(1000),
   popularity VARCHAR(10),
   release_date DATE,
   revenue INT,
   runtime VARCHAR(10),
   PRIMARY KEY (id)
);

CREATE TABLE "Keyword"(
    keyword_id INT NOT NULL,
    name VARCHAR(500),
	PRIMARY KEY (keyword_id)
);

CREATE TABLE "Movie_Keyword"(
    movie_id INT ,
    keyword_id INT 
);

CREATE TABLE "Genre" (
	id INT NOT NULL,
	name VARCHAR(1000)
	PRIMARY KEY (id)
);
	
CREATE TABLE "Movie_cast" (
	movie_id INT ,
	cast_id INT,
	character VARCHAR(1000),
	gender  INT,
	person_id INT,
	name VARCHAR(1000)
);
	
CREATE TABLE "Movie_collection" (
	movie_id INT ,
	collection_id INT 
); 
	
CREATE TABLE "Movie_crew" (
	movie_id INT ,
	department VARCHAR(1000),
	gender INT,
	person_id INT,
	job VARCHAR(1000),
	name VARCHAR(1000)
); 
	
CREATE TABLE "Production_company" (
	id INT NOT NULL,
	name VARCHAR(1000),
	PRIMARY KEY (id)
); 
	
CREATE TABLE "Movie_genres" (
	movie_id INT ,
	genre_id INT 
); 
	
CREATE TABLE "Movie_production_companies" (
	movie_id INT,
	pc_id INT 
); 
	
CREATE TABLE "Ratings" (
	user_id INT,
	movie_id INT,
	rating FLOAT
); 
	
-- ALTER TABLE --
