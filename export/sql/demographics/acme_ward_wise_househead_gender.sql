-- Generated SQL script
-- Date: 2025-06-23 17:47:25


-- Set UTF-8 encoding for this script
SET client_encoding = 'UTF8';

-- Create gender enum type if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'gender') THEN
        CREATE TYPE gender AS ENUM ('MALE', 'FEMALE', 'OTHER');
    END IF;
END
$$;

-- Create acme_ward_wise_househead_gender table if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_househead_gender') THEN
        CREATE TABLE acme_ward_wise_househead_gender (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            ward_name VARCHAR(100),
            gender gender NOT NULL,
            population INTEGER NOT NULL DEFAULT 0,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
        
        -- Create index for faster lookups by ward number and gender
        CREATE INDEX idx_ward_househead_gender ON acme_ward_wise_househead_gender(ward_number, gender);
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_househead_gender) THEN


    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '2ca16b42-0c4a-4053-bb09-2dad23b40c10',
        1,
        NULL,
        'MALE',
        389,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '9b434509-d8d1-4127-9658-1555e74d3c45',
        1,
        NULL,
        'FEMALE',
        703,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        'ab30f2df-cdb9-4252-ab94-505cf3bf7a4a',
        2,
        NULL,
        'OTHER',
        4,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '5e4bd4eb-d590-4bc2-8336-c6dc2584941a',
        2,
        NULL,
        'MALE',
        381,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '8ce0ea1d-e535-4a76-8f76-8b39a182f9ea',
        2,
        NULL,
        'FEMALE',
        465,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '77224678-41ac-4d9c-bc83-b4dd09f20424',
        3,
        NULL,
        'MALE',
        393,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        'ed29632b-61fc-40cc-8a1f-1779dbb01a20',
        3,
        NULL,
        'FEMALE',
        633,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '277f59c7-2f86-4c3a-bd93-ae5c007b39e3',
        4,
        NULL,
        'OTHER',
        56,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '1360f870-4f75-4e34-aac2-dccf00eed2ba',
        4,
        NULL,
        'MALE',
        395,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '0d08b256-6cda-4a21-a76c-2c68b4bb59a7',
        4,
        NULL,
        'FEMALE',
        423,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '22644f0a-ef2a-4017-92ec-c8ace057a599',
        5,
        NULL,
        'OTHER',
        388,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '9a9adb10-ccfb-4290-8a16-2fdac5723a06',
        5,
        NULL,
        'MALE',
        470,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '96551f89-aac3-4339-a8b2-9a7aeae7774d',
        5,
        NULL,
        'FEMALE',
        524,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        'ad01e877-8630-41e1-a51c-77184a148bfd',
        6,
        NULL,
        'OTHER',
        126,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '4c43a64d-ace3-43d9-aa79-9f07e77b5f2b',
        6,
        NULL,
        'MALE',
        806,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '93491d8a-dbc0-4df3-9128-494a168ff476',
        6,
        NULL,
        'FEMALE',
        562,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        'a859ed63-37cf-4d4e-806f-c7ecedd8c0c1',
        7,
        NULL,
        'OTHER',
        124,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '156fe52a-71a5-4484-9e8c-bf69fde9ef15',
        7,
        NULL,
        'MALE',
        637,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        'c59d4b21-0336-4846-af8d-436c6b12a47e',
        7,
        NULL,
        'FEMALE',
        301,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        '386927ca-4e98-4e74-a4e3-2bc7607c7cbb',
        8,
        NULL,
        'MALE',
        31,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    INSERT INTO acme_ward_wise_househead_gender 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        'dd392f0d-5786-4e51-bdad-93cb2fe61e15',
        8,
        NULL,
        'FEMALE',
        54,
        '2025-06-23 17:47:25',
        '2025-06-23 17:47:25'
    );
    

    END IF;
END
$$;

