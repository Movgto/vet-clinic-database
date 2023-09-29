/*Queries that provide answers to the questions from all projects.*/

/*Day one queries*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals
WHERE date_of_birth >= '2016-01-01'
AND date_of_birth < '2020-01-01';
SELECT * FROM animals
WHERE neutered = TRUE
AND escape_attempts < 3;
SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name NOT IN ('Gabumon');
SELECT * FROM animals
WHERE weight_kg >= 10.4
AND weight_kg <= 17.3;

/*Day two*/
/*Transactions*/

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species is NULL;
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT del_after_2022;
SELECT * FROM animals;
UPDATE animals
SET weight_kg = animals.weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO del_after_2022;
SELECT * FROM animals;
UPDATE animals
SET weight_kg = animals.weight_kg * -1
WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

/*Queries*/

SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals
WHERE escape_attempts > 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(escape_attempts) FROM animals
WHERE escape_attempts > 0
GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals
GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth > '1990-01-01'
AND date_of_birth < '2000-01-01'
GROUP BY species;

/*QUERY MULTIPLE TABLES*/

/*ANIMALS TABLE*/

/*SET SPECIES IDS*/
UPDATE animals
SET species_id = (
  SELECT id FROM species
  WHERE name = 'Digimon'
)
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = (
  SELECT id FROM species
  WHERE name = 'Pokemon'
)
WHERE species_id IS NULL;

/*SET OWNER IDS*/

UPDATE animals
SET owner_id = (
  SELECT id FROM owners
  WHERE full_name = 'Sam Smith'
)
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (
  SELECT id FROM owners
  WHERE full_name = 'Jennifer Orwell'
)
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (
  SELECT id FROM owners
  WHERE full_name = 'Bob'
)
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (
  SELECT id FROM owners
  WHERE full_name = 'Melody Pond'
)
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (
  SELECT id FROM owners
  WHERE full_name = 'Dean Winchester'
)
WHERE name IN ('Angemon', 'Boarmon');

/*QUERIES*/

SELECT
A.name,
O.full_name AS owner
FROM animals A
JOIN owners O
ON A.owner_id = O.id
WHERE O.full_name = 'Melody Pond';

SELECT
A.name,
S.name AS species
FROM animals A
JOIN species S
ON S.id = A.species_id
WHERE S.name = 'Pokemon';

SELECT
O.full_name,
A.name AS animal
FROM owners O
LEFT JOIN animals A
ON A.owner_id = O.id;

SELECT S.name, COUNT(*)
FROM animals A
JOIN species S
ON S.id = A.species_id
GROUP BY S.name;

SELECT
O.full_name,
A.name
FROM animals A
JOIN species S
ON S.id = A.species_id
JOIN owners O
ON O.id = A.owner_id
WHERE O.full_name = 'Jennifer Orwell'
AND S.name = 'Digimon';

SELECT
A.name,
O.full_name
FROM animals A
JOIN owners O
ON A.owner_id = O.id
WHERE A.escape_attempts <= 0
AND O.full_name = 'Dean Winchester';

SELECT O.full_name AS owner, COUNT(A.name) AS animal
FROM animals A
JOIN owners O
ON A.owner_id = O.id
GROUP BY O.full_name
ORDER BY animal DESC;

/*MANY-TO-MANY QUERIES*/

SELECT
A.name AS animal_name,
vets.name AS vet_name,
visits.date_of_visit
FROM visits
JOIN animals A
ON A.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC;

SELECT DISTINCT
vets.name,
COUNT(A.name) AS animals_attended
FROM visits
JOIN animals A
ON A.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
GROUP BY vets.name;

SELECT
vets.name AS vet_name,
species.name AS specialization
FROM specializations S
JOIN species
ON species.id = S.species_id
RIGHT JOIN vets
ON vets.id = S.vet_id;

SELECT
A.name AS animal_name,
vets.name AS vet_name,
visits.date_of_visit
FROM visits
JOIN animals A
ON A.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
WHERE visits.date_of_visit >= '2020-04-01'
AND visits.date_of_visit <= '2020-08-30'
AND vets.name = 'Stephanie Mendez';

SELECT
A.name,
COUNT(A.name) AS visits
FROM visits
JOIN animals A
ON A.id = visits.animal_id
GROUP BY A.name
ORDER BY visits DESC;

SELECT
A.name AS animal_name,
vets.name AS vet_name,
visits.date_of_visit
FROM visits
JOIN animals A
ON A.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC;

SELECT
A.name AS animal_name,
A.date_of_birth,
A.escape_attempts,
A.neutered,
A.weight_kg,
animals_species.name AS species_name,
vets.name AS vet_name,
species.name AS specialization,
visits.date_of_visit
FROM visits
JOIN animals A
ON A.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
JOIN specializations
ON specializations.vet_id = vets.id
JOIN species
ON species.id = specializations.species_id
JOIN species AS animals_species
ON species.id = A.species_id
ORDER BY visits.date_of_visit DESC;

SELECT
vets.name,
COUNT(*) AS visits_different_specialization
FROM visits
JOIN animals A
ON A.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
JOIN specializations
ON specializations.vet_id = vets.id
JOIN species vet_species
ON vet_species.id = specializations.species_id
JOIN species animals_species
ON animals_species.id = A.species_id
WHERE vet_species.name != animals_species.name
GROUP BY vets.name;

SELECT
species.name AS species_name,
COUNT(A.name) AS species_count 
FROM visits
JOIN animals A
ON A.id = visits.animal_id
JOIN vets
ON vets.id = visits.vet_id
JOIN species
ON species.id = A.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;