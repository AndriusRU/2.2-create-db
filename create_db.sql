DROP TABLE IF EXISTS songs.tracks;
DROP TABLE IF EXISTS songs.albums;
DROP TABLE IF EXISTS songs.singer;
DROP TABLE IF EXISTS songs.genre;

CREATE TABLE songs.genre (
	id serial4 NOT NULL,
	genre_name varchar(100) NOT NULL,
	CONSTRAINT genre_pk PRIMARY KEY (id),
	CONSTRAINT genre_un UNIQUE (genre_name)
);

-- Permissions

ALTER TABLE songs.genre OWNER TO py44;
GRANT ALL ON TABLE songs.genre TO py44;

CREATE TABLE songs.singer (
	id serial4 NOT NULL,
	singer_name varchar(100) NOT NULL,
	nickname varchar(100) NULL,
	country varchar NOT NULL,
	id_genre int4 NOT NULL,
	CONSTRAINT singer_pk PRIMARY KEY (id),
	CONSTRAINT singer_fk FOREIGN KEY (id) REFERENCES songs.genre(id)
);

-- Permissions

ALTER TABLE songs.singer OWNER TO py44;
GRANT ALL ON TABLE songs.singer TO py44;


CREATE TABLE songs.albums (
	id serial4 NOT NULL,
	album_name varchar(100) NOT NULL DEFAULT 'No name'::character varying,
	id_singer int4 NOT NULL,
	year_release int4 NOT NULL,
	CONSTRAINT albums_pk PRIMARY KEY (id),
	CONSTRAINT albums_fk FOREIGN KEY (id) REFERENCES songs.singer(id)
);

-- Permissions

ALTER TABLE songs.albums OWNER TO py44;
GRANT ALL ON TABLE songs.albums TO py44;


CREATE TABLE songs.tracks (
	id serial4 NOT NULL,
	track_name varchar(100) NOT NULL,
	duration time NOT NULL,
	album_id int4 NOT NULL,
	CONSTRAINT tracks_pk PRIMARY KEY (id),
	CONSTRAINT tracks_fk FOREIGN KEY (id) REFERENCES songs.albums(id)
);

-- Permissions

ALTER TABLE songs.tracks OWNER TO py44;
GRANT ALL ON TABLE songs.tracks TO py44;

