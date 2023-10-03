/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOL NOT NULL,
    weight_kg DECIMAL NOT NULL,
    species_id INT,
    owner_id INT,
    CONSTRAINT fk_species
        FOREIGN KEY(species_id)
        REFERENCES species(id),
    CONSTRAINT fk_owner
        FOREIGN KEY(owner_id)
        REFERENCES owners(id)
);

CREATE TABLE owners (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50)
);

CREATE TABLE vets (
    id BIGSERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL
);

/*MANY-TO-MANY TABLES*/

CREATE TABLE specializations (
    vet_id INT NOT NULL,
    species_id INT NOT NULL,
    CONSTRAINT fk_vet
        FOREIGN KEY(vet_id)
        REFERENCES vets(id),
    CONSTRAINT fk_species
        FOREIGN KEY(species_id)
        REFERENCES species(id)
);

CREATE TABLE visits (
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    CONSTRAINT fk_animal
        FOREIGN KEY(animal_id)
        REFERENCES animals(id),
    CONSTRAINT fk_vet
        FOREIGN KEY(vet_id)
        REFERENCES vets(id)
);