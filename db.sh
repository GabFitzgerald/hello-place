docker exec -it cool-swartz bash
CREATE TABLE todos (
    id serial NOT NULL PRIMARY KEY,
    completed bool,
    todo text
);