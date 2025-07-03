-- Generated SQL script
-- Date: 2025-05-24 13:12:55


-- Check if acme_ward_wise_recent_delivery_locations table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'recent_delivery_location_type'
    ) THEN
        CREATE TYPE recent_delivery_location_type AS ENUM (
            'HOUSE',
            'GOVERNMENTAL_HEALTH_INSTITUTION',
            'PRIVATE_HEALTH_INSTITUTION',
            'OTHER'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_recent_delivery_locations'
    ) THEN
        CREATE TABLE acme_ward_wise_recent_delivery_locations (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            recent_delivery_location recent_delivery_location_type NOT NULL,
            population INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_recent_delivery_locations) THEN


    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        'eae5f4d1-08b6-4cff-88ca-595106d72dba',
        1,
        'GOVERNMENTAL_HEALTH_INSTITUTION',
        16,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '1c59770b-11cf-44c3-98bb-cea0dde417ea',
        1,
        'HOUSE',
        1,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '960df4ef-bcf5-4017-a667-0a099c161525',
        1,
        'PRIVATE_HEALTH_INSTITUTION',
        10,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '464a0f0f-dc4e-4caa-97f6-033974c69a29',
        2,
        'GOVERNMENTAL_HEALTH_INSTITUTION',
        197,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '51393abb-635e-4389-bba0-f9a8693803b8',
        2,
        'HOUSE',
        39,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '4a012519-55df-4e92-88b8-ebfeb9b3176e',
        2,
        'OTHER',
        1,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '0283101c-91f2-4a14-b89a-157b95875b47',
        2,
        'PRIVATE_HEALTH_INSTITUTION',
        11,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        'ee148610-c004-4786-a297-6f30feef1c90',
        3,
        'GOVERNMENTAL_HEALTH_INSTITUTION',
        30,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '857083b9-f9a5-4a94-b866-9b5885a7b80c',
        3,
        'HOUSE',
        1,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '1354e128-b86a-4995-b440-225174ac88db',
        3,
        'OTHER',
        1,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '4579b3b9-cf7b-40a7-b42d-0dc25663786e',
        3,
        'PRIVATE_HEALTH_INSTITUTION',
        23,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        'c07d475b-198d-4493-b75b-a3ea49cc698f',
        4,
        'GOVERNMENTAL_HEALTH_INSTITUTION',
        22,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        'f70b3814-9fa5-4d61-8196-afa2b51a2820',
        4,
        'HOUSE',
        1,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '624ce4b8-42ad-4bf2-9405-3a247bfeda1f',
        4,
        'PRIVATE_HEALTH_INSTITUTION',
        11,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        'c4e0f4ff-5bc6-469e-80ac-cb61b71a6199',
        5,
        'GOVERNMENTAL_HEALTH_INSTITUTION',
        48,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        'ef9ba29b-69d3-4a8f-b40d-4bd7c966114a',
        5,
        'PRIVATE_HEALTH_INSTITUTION',
        9,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '0f1d32c4-5aee-4500-b802-8cec73a8fc12',
        6,
        'GOVERNMENTAL_HEALTH_INSTITUTION',
        34,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '39d5ddfd-2d3d-4173-9764-06522f23ff75',
        6,
        'HOUSE',
        13,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '091261ae-f784-4642-8e09-0e5e9d93b314',
        6,
        'OTHER',
        9,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '718febf5-1a77-4091-befc-2083324f2f94',
        6,
        'PRIVATE_HEALTH_INSTITUTION',
        77,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '8bfe877a-6cb6-4f3f-9ecd-ea9446bd6e17',
        7,
        'GOVERNMENTAL_HEALTH_INSTITUTION',
        124,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '9951a5ac-1cbb-4727-85b0-31bfd975a42e',
        7,
        'HOUSE',
        7,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '01e5f20e-5499-4c70-bdd2-bf1e280c3d8d',
        7,
        'PRIVATE_HEALTH_INSTITUTION',
        4,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '73dbe7d1-678a-4ae6-8272-d4b59565a3ee',
        8,
        'GOVERNMENTAL_HEALTH_INSTITUTION',
        15,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        '6eae05c2-28c9-4283-b692-abd099b2599a',
        8,
        'HOUSE',
        3,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    INSERT INTO acme_ward_wise_recent_delivery_locations 
    (id, ward_number, recent_delivery_location, population, updated_at, created_at)
    VALUES (
        'f8e20189-d2f9-4ba2-b27e-93b527fdc367',
        8,
        'PRIVATE_HEALTH_INSTITUTION',
        2,
        '2025-05-24 13:12:55',
        '2025-05-24 13:12:55'
    );
    

    END IF;
END
$$;

