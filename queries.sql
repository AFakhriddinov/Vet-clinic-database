select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-12-31';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where  name <> 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;

begin transaction;
update animals set species = 'unspecified';
select * from animals;
rollback;
select * from animals;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where species is null;
select * from animals;
commit;
select * from animals;

begin transaction;
delete from animals;
select * from animals;
rollback;
select * from animals;

begin transaction;
delete from animals where date_of_birth > '2022-01-01';
SAVEPOINT del_savepoint;
update animals set weight_kg = weight_kg * -1;
rollback to SAVEPOINT del_savepoint;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, max(escape_attempts) from animals  group by neutered;
select species, min(weight_kg), max(weight_kg) from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;

select animals.name as animal, owners.full_name as owner_name from animals join owners on animals.owner_id = owners.id where owners.full_name  = 'Melody Pond';
select a.name from animals a join species s on a.species_id = s.id where s.name = 'Pokemon';
select o.full_name, a.name from owners o left join animals a on o.id = a.owner_id;
select s.name, count(*) as animal_count from animals a join species s on a.species_id = s.id group by s.name;
select a.name from animals a join owners o on a.owner_id = o.id join species s on a.species_id = s.id where o.full_name = 'Jennifer Orwell' and s.name = 'Digimon';
select a.name from animals a join owners o on a.owner_id = o.id where o.full_name = 'Dean Winchester' and a.escape_attempts = 0;
select o.full_name, count(*) as animal_count from owners o join animals a on o.id = a.owner_id group by o.full_name order by animal_count desc limit 1;
