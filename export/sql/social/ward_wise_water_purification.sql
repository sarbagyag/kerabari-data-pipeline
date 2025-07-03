-- Generated SQL script
-- Date: 2025-06-22 12:11:09


-- Create enum type if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'water_purification_method_type') THEN
        CREATE TYPE water_purification_method_type AS ENUM (
            'BOILING',
            'FILTERING',
            'CHEMICAL_PIYUSH',
            'NO_ANY_FILTERING',
            'OTHER'
        );
    END IF;
END
$$;

-- Check if ward_wise_water_purification table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'ward_wise_water_purification'
    ) THEN
        CREATE TABLE ward_wise_water_purification (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            water_purification_method water_purification_method_type NOT NULL,
            households INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM ward_wise_water_purification) THEN


    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'a3f430aa-b39e-4a93-ab42-3e4955475f90',
        1,
        'BOILING'::water_purification_method_type,
        281,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '838c248b-c9fc-4af5-8e30-5a56ed2cf1bb',
        1,
        'CHEMICAL_PIYUSH'::water_purification_method_type,
        1,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'a2af8466-ec17-4c59-aa6a-48589f263f27',
        1,
        'FILTERING'::water_purification_method_type,
        12,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'b5710826-0f07-42a8-875d-0b48d24fd570',
        1,
        'NO_ANY_FILTERING'::water_purification_method_type,
        381,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '760dd236-0fbb-4d29-a8ff-2c74beca4169',
        2,
        'BOILING'::water_purification_method_type,
        52,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '0c01f707-44eb-4f2d-8add-ce8f4bb7af3c',
        2,
        'FILTERING'::water_purification_method_type,
        3,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '1a851886-de96-4c0e-9243-2389bdffb9b6',
        2,
        'NO_ANY_FILTERING'::water_purification_method_type,
        794,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '7e64cf82-2b9a-4b34-a8ef-ed1464b54d75',
        2,
        'OTHER'::water_purification_method_type,
        1,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '7fe08de1-deea-4af4-8c48-abe86ba77d1d',
        3,
        'BOILING'::water_purification_method_type,
        90,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'c5a54e7d-2928-4da0-8515-3a6e4d59c32b',
        3,
        'CHEMICAL_PIYUSH'::water_purification_method_type,
        1,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '572ec165-3114-49b3-a914-31ca1cc46237',
        3,
        'FILTERING'::water_purification_method_type,
        13,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'c2d80680-7460-4d4c-b279-c7ab3647543a',
        3,
        'NO_ANY_FILTERING'::water_purification_method_type,
        428,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '94a102a2-757f-4b20-958a-82318625e029',
        4,
        'BOILING'::water_purification_method_type,
        236,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'ebf167d7-2761-44ea-98f4-5bfd6f0571ed',
        4,
        'CHEMICAL_PIYUSH'::water_purification_method_type,
        3,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'b2a6042a-c0f9-4b54-a318-8fedecea4d6f',
        4,
        'FILTERING'::water_purification_method_type,
        9,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '01ee6a48-ea91-4349-bc6e-e010916a3cfb',
        4,
        'NO_ANY_FILTERING'::water_purification_method_type,
        491,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'a4beabd0-1ab8-40d4-a924-6a695b7abc8b',
        4,
        'OTHER'::water_purification_method_type,
        2,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'cceb40c2-7d03-449e-a582-efa8954d74f2',
        5,
        'BOILING'::water_purification_method_type,
        63,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'd7628e8a-e747-47f1-aa74-723fa47ad176',
        5,
        'CHEMICAL_PIYUSH'::water_purification_method_type,
        1,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '95613e65-867b-4d00-a1de-669ba538b860',
        5,
        'FILTERING'::water_purification_method_type,
        4,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '7ce5fc97-3d7a-4e91-9d17-e78d165a1973',
        5,
        'NO_ANY_FILTERING'::water_purification_method_type,
        290,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '66e23362-6db7-4183-b8db-b99fc6a6cbb7',
        6,
        'BOILING'::water_purification_method_type,
        322,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'e6a4c948-40e5-4e8d-b250-13bb8e277a4e',
        6,
        'CHEMICAL_PIYUSH'::water_purification_method_type,
        1,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '5c71a6ac-c18d-4179-9fcd-0b95cabdb0a2',
        6,
        'FILTERING'::water_purification_method_type,
        59,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'a1482fa8-eb5e-4baa-95b1-0d27f72da8b8',
        6,
        'NO_ANY_FILTERING'::water_purification_method_type,
        574,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '131ce4b3-2d1a-4d0f-a70a-f0b1214d9a85',
        7,
        'BOILING'::water_purification_method_type,
        30,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '192e9081-e705-43e2-95f5-36eb964acea6',
        7,
        'FILTERING'::water_purification_method_type,
        3,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    INSERT INTO ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'ef9d4a57-b327-41d3-96a9-3336bfe0f72a',
        7,
        'NO_ANY_FILTERING'::water_purification_method_type,
        298,
        '2025-06-22 12:11:09',
        '2025-06-22 12:11:09'
    );
    

    END IF;
END
$$;

