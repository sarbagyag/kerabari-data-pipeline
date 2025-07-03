-- Generated SQL script
-- Date: 2025-06-30 11:44:21


-- Check if acme_municipality_wise_religion_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wise_religion_population'
    ) THEN
        CREATE TABLE acme_municipality_wise_religion_population (
            id VARCHAR(36) PRIMARY KEY,
            religion_type VARCHAR(100) NOT NULL,
            population INTEGER NOT NULL DEFAULT 0,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wise_religion_population) THEN


    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '2afdf4c2-d8a3-4d5a-b78b-e8296f2b762e',
        'BAHAI',
        8,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '7b045380-b5c5-4e97-ae4a-bc78f04fc378',
        'BON',
        12,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        'e6ed39ee-7b4e-499f-8d64-5b4b0d340d44',
        'BUDDHIST',
        3390,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        'dda35cc7-dc14-4b1d-9958-408fbcd442da',
        'CHRISTIAN',
        2805,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '4fe5c706-6d9e-4c5b-9602-97c0b7d9dabd',
        'HINDU',
        22572,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '02ee1ca6-1fff-4385-af45-6a6e593277d8',
        'ISLAM',
        26,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        'b3138afe-60b1-4cb2-bc16-a58a437d6fa7',
        'KIRANT',
        6984,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '70adf24e-699f-445e-be2d-2dffde1fdd10',
        'NATURE',
        138,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '5a6afcb8-becb-4f0b-9eb9-025771eb4d2f',
        'OTHER',
        192,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    INSERT INTO acme_municipality_wise_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '6c34f027-4580-45c9-8057-d7c9d9f3a880',
        'SIKH',
        55,
        '2025-06-30 11:44:21',
        '2025-06-30 11:44:21'
    );
    

    END IF;
END
$$;

