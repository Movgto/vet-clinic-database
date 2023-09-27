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