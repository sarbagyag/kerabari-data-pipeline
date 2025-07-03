-- Generated SQL script
-- Date: 2025-06-30 13:00:35


-- Check if acme_ward_wise_cooking_fuel table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'cooking_fuel_type'
    ) THEN
        CREATE TYPE cooking_fuel_type AS ENUM (
            'WOOD',
            'LP_GAS',
            'KEROSENE',
            'ELECTRICITY',
            'BIOGAS',
            'DUNGCAKE',
            'OTHER'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_cooking_fuel'
    ) THEN
        CREATE TABLE acme_ward_wise_cooking_fuel (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            cooking_fuel cooking_fuel_type NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_cooking_fuel) THEN


    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'd406697f-8274-4383-b16b-3029a2e41a11',
        1,
        'LP_GAS',
        11,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '5bae4747-6fd8-427e-a6a6-d64adf873387',
        1,
        'OTHER',
        9,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '84c055e0-d2a2-4a7a-aeed-cfe7fb153ec6',
        1,
        'WOOD',
        368,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'd2bcf88b-a658-4f19-baed-5a2885852bf1',
        2,
        'LP_GAS',
        11,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'fa2c1c9a-ba2b-4678-a89d-a339f2a55ae8',
        2,
        'OTHER',
        121,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '36f5cc01-4a51-40b5-b882-41f87357c262',
        2,
        'WOOD',
        409,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'ed06be3f-0e66-466b-a007-f80136075749',
        3,
        'LP_GAS',
        21,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '4ed2f360-382c-4b6d-b95c-96c3186a683a',
        3,
        'OTHER',
        151,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '536b096d-1d97-4fd9-a402-195b6b8ce607',
        3,
        'WOOD',
        150,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '96e3a55c-1256-4706-aa5d-b7013b8c80f1',
        4,
        'LP_GAS',
        6,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '28b850de-31c1-428b-ab9c-333d588b4f53',
        4,
        'OTHER',
        26,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '2686a801-7160-45f2-a8f7-1cc6be89a27d',
        4,
        'WOOD',
        300,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '8aa125c5-bae3-4bc6-8040-cc885c469350',
        5,
        'BIOGAS',
        5,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '598b7ae0-7c37-401a-9f0e-837056286e21',
        5,
        'LP_GAS',
        32,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '923d3324-d48b-423a-af06-ec94f472cfcd',
        5,
        'OTHER',
        79,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '8589381e-fff5-414e-99d1-59ec78ef1933',
        5,
        'WOOD',
        120,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '9b9bb93e-36f9-463d-9ece-f1183bdad815',
        6,
        'KEROSENE',
        2,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'e12b7a67-a990-4ad2-98a5-c314371ad71c',
        6,
        'LP_GAS',
        98,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '9d59122f-c118-4049-bf0b-71982c9b5108',
        6,
        'OTHER',
        45,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'b0104f85-1ebd-4f01-9b35-7f38b73fbcf9',
        6,
        'WOOD',
        219,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '84310d5c-8625-4b03-8257-3cc22eba7f70',
        7,
        'LP_GAS',
        63,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '3cbce901-8d2c-4340-8b89-a59a3914063f',
        7,
        'OTHER',
        165,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '32ca7b12-ac45-446f-a4d6-17af156a16c1',
        7,
        'WOOD',
        69,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'c1624266-690a-4548-b12d-c73a61872028',
        8,
        'BIOGAS',
        3,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '8059f34e-78f1-4a07-9770-fd38eb8a2865',
        8,
        'LP_GAS',
        184,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'b1eacdb5-3606-4137-b0d7-83247cee03e7',
        8,
        'OTHER',
        399,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '3610f005-06fb-4e3d-a311-2b024a37416c',
        8,
        'WOOD',
        111,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '695787a4-6744-43bf-a731-3d8fbd03c8ca',
        9,
        'LP_GAS',
        62,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'f39ecc2c-12c0-4262-9fd2-c2dbc3d9666c',
        9,
        'OTHER',
        168,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'f3cf84bc-e8e3-450f-b1ba-11e520a7dc78',
        9,
        'WOOD',
        271,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        'dd9ec150-0783-46ed-bfab-fa20180cc2b0',
        10,
        'LP_GAS',
        213,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '7335f57e-3468-465e-b210-bbb01e2fa103',
        10,
        'OTHER',
        60,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    INSERT INTO acme_ward_wise_cooking_fuel 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '957cd7c4-6716-4c66-99dc-57b7f15b8eb0',
        10,
        'WOOD',
        46,
        '2025-06-30 13:00:35',
        '2025-06-30 13:00:35'
    );
    

    END IF;
END
$$;

