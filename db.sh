docker exec -it hello_place bash
CREATE TABLE todos (
    id serial NOT NULL PRIMARY KEY,
    completed bool,
    todo text
);