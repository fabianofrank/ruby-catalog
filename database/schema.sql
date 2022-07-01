CREATE TABLE game (
    id serial NOT NULL,
    published_date DATE,
    last_played_at DATE,
    is_multiplayer BOOLEAN,
    label varhar(50),
    author_id INTEGER,
);

CREATE TABLE author (
    id serial NOT NULL,
    first_name varhar(50),
    last_name varhar(50),
);