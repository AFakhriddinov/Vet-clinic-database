create table animals(id int, name varchar(50), date_of_birth date, escape_attempts int, neutered boolean, weight_kg decimal, primary key(id));

alter table animals add species varchar(50);
