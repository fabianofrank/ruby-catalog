CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name varhar(50) NOT NULL,
    items text[] NOT NULL
);

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name varhar(50) NOT NULL,
    last_name varhar(50) NOT NULL,
    items text[] NOT NULL
);

CREATE TABLE source (
    id SERIAL PRIMARY KEY,
    name varhar(50) NOT NULL,
    items text[]
);

CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title varhar(50) NOT NULL,
    color varhar(50) NOT NULL,
    items text[] NOT NULL
);

CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id varchar(50) NOT NULL,
    author_id varchar(50) NOT NULL,
    source_id varchar(50) NOT NULL,
    label_id varchar(50) NOT NULL,
    
    genre_id int REFERENCES genre(id)
    author_id int REFERENCES author(id)
    source_id int REFERENCES source(id)
    label_id int REFERENCES label(id)
)

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    publish_date DATE NOT NULL,
    last_played_at DATE NOT NULL,
    is_multiplayer BOOLEAN NOT NULL,
    label varchar(50) NOT NULL,
    author_id INTEGER NOT NULL,

    author_id int REFERENCES item(id)
);

CREATE TABLE movie (
    id SERIAL PRIMARY KEY,
    publish_date DATE NOT NULL,
    label varhar(50) NOT NULL,
    silent BOOLEAN NOT NULL,
    source_id INTEGER NOT NULL,

    source_id int REFERENCES item(id)
);

CREATE TABLE music (
    id SERIAL PRIMARY KEY,
    publish_date DATE NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    genre_id INTEGER NOT NULL,

    genre_id int REFERENCES item(id)
);

CREATE TABLE book (
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    cover_state varhar(50) NOT NULL,
    publisher BOOLEAN NOT NULL,
    label_id INTEGER NOT NULL,

    label_id int REFERENCES item(id)
);
