-- Generated SQL script
-- Date: 2025-06-30 12:16:50


-- Check if acme_ward_wise_household_land_possessions table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_household_land_possessions'
    ) THEN
        CREATE TABLE acme_ward_wise_household_land_possessions (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL,
            households INTEGER NOT NULL DEFAULT 0 CHECK (households >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_household_land_possessions) THEN


    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '4721c8b4-732d-4a10-bec2-5babc5a29a64',
        1,
        486,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '903811c2-47f8-4cc9-b9c4-f8963303aca8',
        2,
        572,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '5b5c6252-100c-448c-bab9-88c506293083',
        3,
        759,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '9ad8d0cd-0b27-46c4-b608-033a5023fb20',
        4,
        377,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '3c82e356-225b-47b3-849a-15ee38961408',
        5,
        878,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '0a8fb54c-5984-40cc-ad9d-1f407eaac752',
        6,
        722,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '329d81d2-b38a-400c-a854-1756666822ab',
        7,
        774,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '50cda648-c765-4bb4-9a5c-3be8b0791dbd',
        8,
        885,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        'fcd1e617-0036-48e3-8930-d8e68f8c3c91',
        9,
        877,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    INSERT INTO acme_ward_wise_household_land_possessions 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        'a1ce829a-3bde-4b20-b1af-11ae9a912e69',
        10,
        830,
        '2025-06-30 12:16:50',
        '2025-06-30 12:16:50'
    );
    

    END IF;
END
$$;

