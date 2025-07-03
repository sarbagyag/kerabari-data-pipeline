-- Generated SQL script
-- Date: 2025-06-30 15:17:51


-- Check if acme_ward_wise_health_insured_households table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_health_insured_households'
    ) THEN
        CREATE TABLE acme_ward_wise_health_insured_households (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL UNIQUE,
            insured_households INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_health_insured_households) THEN


    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        '670bffb9-99f2-486f-8e5c-107d1fb3afee',
        1,
        58,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        'aa8457f0-2e3e-40ec-b586-f2d937f669a8',
        2,
        172,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        '8deaafca-662e-4af2-a234-88711c979454',
        3,
        129,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        'e3e3ff37-23f0-4d8e-85df-212ccd649616',
        4,
        38,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        '6c3aa10a-cf84-4d57-a5f3-930fe098eb2b',
        5,
        200,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        '2597d382-1276-455a-ae11-b85d1f0e8362',
        6,
        156,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        '98aae6bb-360b-441f-8461-33cbee64d860',
        7,
        372,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        '48d16c02-3c21-436b-9ae2-f4e3b11a33df',
        8,
        301,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        'e8615971-7ee9-43ee-aa09-f0585af09344',
        9,
        385,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    INSERT INTO acme_ward_wise_health_insured_households 
    (id, ward_number, insured_households, updated_at, created_at)
    VALUES (
        'd4d4e340-2a96-498c-8b41-305261d0c412',
        10,
        165,
        '2025-06-30 15:17:51',
        '2025-06-30 15:17:51'
    );
    

    END IF;
END
$$;

