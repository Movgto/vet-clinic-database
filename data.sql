/* Populate database with sample data. */

/*ANIMALS TABLE*/

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Agumon',
  date '2020-02-03',
  0,
  TRUE,
  10.23
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Gabumon',
  date '2018-11-15',
  2,
  TRUE,
  8
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Pikachu',
  date '2021-01-07',
  1,
  FALSE,
  15.04
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Devimon',
  date '2017-05-12',
  5,
  TRUE,
  11
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Charmander',
  '2020-02-08',
  0,
  FALSE,
  11
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Plantmon',
  '2021-11-15',
  2,
  TRUE,
  5.7
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Squirtle',
  '1993-04-02',
  3,
  FALSE,
  12.13
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Angemon',
  '2005-06-12',
  1,
  TRUE,
  45
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Boarmon',
  '2005-06-07',
  7,
  TRUE,
  20.4
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Blossom',
  '1998-10-13',
  3,
  TRUE,
  17
);
INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES (
  'Ditto',
  '2022-05-14',
  4,
  TRUE,
  22
);

/*OWNERS TABLE*/

INSERT INTO owners(
  full_name,
  age
)
VALUES (
  'Sam Smith',
  34
),
(
  'Jennifer Orwell',
  19
),
(
  'Bob',
  45
),
(
  'Melody Pond',
  77
),
(
  'Dean Winchester',
  14
),
(
  'Jodie Whittaker',
  38
);

/*SPECIES TABLE*/

INSERT INTO species (
  name
)
VALUES (
  'Pokemon'
),
(
  'Digimon'
);

/*VETS TABLE*/

INSERT INTO vets (
  name,
  age,
  date_of_graduation
)
VALUES (
  'William Tatcher',
  45,
  '2000-04-23'
),
(
  'Maisy Smith',
  26,
  '2019-01-17'
),
(
  'Stephanie Mendez',
  64,
  '1981-05-04'
),
(
  'Jack Harkness',
  38,
  '2008-06-08'
);

INSERT INTO specializations (
  vet_id,
  species_id
)
VALUES (
  1,
  1
),
(
  3,
  2
),
(
  3,
  1
),
(
  4,
  2
);

INSERT INTO visits (
  animal_id,
  vet_id,
  date_of_visit
)
VALUES (
  1,
  1,
  '2020-05-24'
),
(
  1,
  3,
  '2020-07-22'
),
(
  2,
  4,
  '2021-02-02'
),
(
  3,
  2,
  '2020-01-05'
),
(
  3,
  2,
  '2020-03-08'
),
(
  3,
  2,
  '2020-05-14'
),
(
  4,
  3,
  '2021-05-04'
),
(
  5,
  4,
  '2021-02-24'
),
(
  6,
  2,
  '2019-12-21'
),
(
  6,
  1,
  '2020-08-10'
),
(
  6,
  2,
  '2021-04-07'
),
(
  7,
  3,
  '2019-09-29'
),
(
  8,
  4,
  '2020-10-03'
),
(
  8,
  4,
  '2020-11-04'
),
(
  9,
  2,
  '2019-01-24'
),
(
  9,
  2,
  '2019-05-15'
),
(
  9,
  2,
  '2020-02-27'
),
(
  9,
  2,
  '2020-08-03'
),
(
  10,
  3,
  '2020-05-24'
),
(
  10,
  1,
  '2021-01-11'
);