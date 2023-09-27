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