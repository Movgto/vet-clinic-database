/*Queries that provide answers to the questions from all projects.*/

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