-- Generated SQL script
-- Date: 2025-06-30 13:01:18


-- Check if acme_ward_wise_electricity_source table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'electricity_source_type'
    ) THEN
        CREATE TYPE electricity_source_type AS ENUM (
            'ELECTRICITY',
            'SOLAR',
            'KEROSENE',
            'BIOGAS',
            'OTHER'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_electricity_source'
    ) THEN
        CREATE TABLE acme_ward_wise_electricity_source (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            electricity_source electricity_source_type NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_electricity_source) THEN


    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'bc59da69-bc5a-4cdc-8973-02f22e9f0246',
        1,
        'ELECTRICITY',
        482,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '5d9a8e54-b6fb-4a46-8dab-449b593b174e',
        1,
        'KEROSENE',
        2,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '9a804bbc-c13f-4fd2-8229-742afcee9315',
        1,
        'OTHER',
        4,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'bb3607b9-499d-449d-bf3e-2c08b4dd62dd',
        1,
        'SOLAR',
        1,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '162b9d33-ebb0-4d48-a2e6-e56cfb41d390',
        2,
        'ELECTRICITY',
        578,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '7712e416-b52e-41ad-ab88-4d123ef7332f',
        3,
        'ELECTRICITY',
        817,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'fb9d9817-bf44-451e-8c29-a14c43f3641c',
        3,
        'KEROSENE',
        3,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'e1ceea47-eee9-4422-a53d-561558fc7df5',
        3,
        'OTHER',
        10,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '236fb5e3-41d3-4862-aff8-6e955955a4f4',
        3,
        'SOLAR',
        6,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '0320872f-236a-4a70-908e-3e462ef358bb',
        4,
        'ELECTRICITY',
        410,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'b803999a-c146-49ef-90d8-afbd3ff6cffa',
        4,
        'KEROSENE',
        7,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '3cec5cf0-6edb-4e66-afc1-9bc7c456773d',
        4,
        'SOLAR',
        10,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'd764e328-c71d-426e-808c-1aff61bf9edc',
        5,
        'ELECTRICITY',
        1025,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'c4a6e9ab-eb66-4ab5-8e46-1842a7f1e97a',
        5,
        'SOLAR',
        3,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'd219ebe9-5eac-4459-b5c2-20d01431e349',
        6,
        'ELECTRICITY',
        994,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '1362e2d8-4340-4a97-8766-6a34b5a4fe94',
        6,
        'KEROSENE',
        1,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '9ee3e97a-c0f9-4bc6-a2a7-2f6e24cd2ead',
        6,
        'SOLAR',
        5,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '7bed6aa8-3b09-4e0f-828b-de40c5f194bc',
        7,
        'ELECTRICITY',
        979,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '0980bcb8-a467-4c3c-90b0-98e301465f0c',
        7,
        'OTHER',
        3,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '1eeb881a-ea20-4184-b9e5-d2d85d3435ff',
        7,
        'SOLAR',
        4,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '223b1e4e-d5c2-43b7-b32f-f7528e445090',
        8,
        'ELECTRICITY',
        1098,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '42ebba5e-47d6-4a1e-aa19-b01dc7a6b4f0',
        8,
        'SOLAR',
        10,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '36a1fab4-528d-43b4-ac32-29aec0747984',
        9,
        'ELECTRICITY',
        1466,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'dabbde87-8e36-46a9-99d2-105d0ef3e085',
        9,
        'KEROSENE',
        6,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '6b414a6d-6748-47d6-8066-d9e1f39f6fca',
        9,
        'OTHER',
        5,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'a674841d-4169-4e70-ab69-0b56932a7f5d',
        9,
        'SOLAR',
        3,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        'c14d9f24-b638-4b9c-9674-20522bfa3761',
        10,
        'ELECTRICITY',
        921,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '3bb8f680-3823-4095-b1c1-37d371d1fca4',
        10,
        'KEROSENE',
        2,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '3d27114f-ccec-409f-8b2d-3e4dfc796d77',
        10,
        'OTHER',
        2,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    INSERT INTO acme_ward_wise_electricity_source 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '3901ff3e-76a2-443d-9a7b-27c552fd26a3',
        10,
        'SOLAR',
        7,
        '2025-06-30 13:01:18',
        '2025-06-30 13:01:18'
    );
    

    END IF;
END
$$;

