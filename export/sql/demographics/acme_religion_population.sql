-- Generated SQL script
-- Date: 2025-06-23 22:24:05


-- Check if acme_religion_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_religion_population'
    ) THEN
        CREATE TABLE acme_religion_population (
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
    IF NOT EXISTS (SELECT 1 FROM acme_religion_population) THEN


    INSERT INTO acme_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '083f9295-de29-4122-9cef-60dfab9bd275',
        'BON',
        24,
        '2025-06-23 22:24:05',
        '2025-06-23 22:24:05'
    );
    

    INSERT INTO acme_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '297808c4-a73e-457e-97ab-6e64175fa6ca',
        'BUDDHIST',
        64,
        '2025-06-23 22:24:05',
        '2025-06-23 22:24:05'
    );
    

    INSERT INTO acme_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '49141883-5992-4c65-a69f-35f0d171c7cf',
        'CHRISTIAN',
        1653,
        '2025-06-23 22:24:05',
        '2025-06-23 22:24:05'
    );
    

    INSERT INTO acme_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        'f39dfc90-fa11-4c17-80ce-bb1f5e873f2c',
        'HINDU',
        44931,
        '2025-06-23 22:24:05',
        '2025-06-23 22:24:05'
    );
    

    INSERT INTO acme_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '2966ff64-b4b5-45bb-94c4-efa0245c8325',
        'ISLAM',
        1159,
        '2025-06-23 22:24:05',
        '2025-06-23 22:24:05'
    );
    

    INSERT INTO acme_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        'd3c2f7da-abd8-4a78-a186-497baf9cf820',
        'JAIN',
        9,
        '2025-06-23 22:24:05',
        '2025-06-23 22:24:05'
    );
    

    INSERT INTO acme_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        'df2b1f5b-0dd7-45b5-9463-052d0f4d4c30',
        'KIRANT',
        3,
        '2025-06-23 22:24:05',
        '2025-06-23 22:24:05'
    );
    

    INSERT INTO acme_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        'ec15ee34-cc70-4b6c-a39e-af4ab796fff7',
        'NATURE',
        45,
        '2025-06-23 22:24:05',
        '2025-06-23 22:24:05'
    );
    

    INSERT INTO acme_religion_population 
    (id, religion_type, population, updated_at, created_at)
    VALUES (
        '16882e62-379b-4877-a791-c8b2d23f5fd2',
        'SIKH',
        41,
        '2025-06-23 22:24:05',
        '2025-06-23 22:24:05'
    );
    

    END IF;
END
$$;

