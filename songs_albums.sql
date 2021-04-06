/*
 * TODO: Create a table called 'songs' that has the following fields:
 * - id - integer, primary key
 * - name - string
 * - album_id - foreign key
 * 
 * Note that album - song is a one-to-many relationship, so no bridge table is needed.
 */

CREATE TABLE Albums (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(70) NOT NULL,
    artist VARCHAR(70) NOT NULL,
    year_published INTEGER NOT NULL
);

CREATE TABLE Songs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(70) NOT NULL,
    album_id  INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums(id)
);

/* 
 * TODO: Insert at least 4 rows of data into the songs table. You can change up the albums as well. :)
 */

INSERT INTO Albums
    (name, artist, year_published)
VALUES
    ('The Dark Side of the Moon', 'Pink Floyd', 1973),
    ('Abbey Road', 'The Beatles', 1969),
    ('Hotel California', 'Eagles', 1976),
    ('Born in the U.S.A.', 'Bruce Springsteen', 1984),
    ('California', 'Blink-182', 2016)
;

INSERT INTO Songs
    (name, album_id)
VALUES
    ('On The Run', 1),
    ('Come Together', 2),
    ('Hotel California',3),
    ('Born in the U.S.A.', 4),
    ('California', 5)
;

/* Queries */

-- SELECT * FROM Songs;

SELECT * FROM Albums;
SELECT * FROM Songs;

/* 
 * TODO: Write a table join query to construct a table of Song Name : Album Name
 */
 SELECT Songs.name, Albums.name
 From Songs
 JOIN Albums
    ON Songs.album_id = Albums.id;
/*
 * TODO: Find all albums published between 1970 and 1980.
 */

SELECT * FROM Albums
WHERE year_published >= 1970 and year_published <= 1980;

/*
 * TODO: Find all songs on albums published between 1970 and 1980. 
 *(Hint: Use a table join.)
 */

SELECT Songs.name, Albums.name, Albums.year_published
FROM SONGS
JOIN Albums
    ON Songs.album_id = Albums.id
WHERE year_published >= 1970 and year_published <= 1980;
 
/*
 * TODO: Find all songs on albums with names containing 'California'.
 */

SELECT Songs.name, Albums.name
FROM SONGS
JOIN Albums
    ON Songs.album_id = Albums.id
WHERE Songs.name Like '%California%';