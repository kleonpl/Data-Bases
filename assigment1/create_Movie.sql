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