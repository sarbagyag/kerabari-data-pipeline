-- Generated SQL script
-- Date: 2025-06-30 12:14:42


-- Check if acme_ward_wise_trained_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_trained_population'
    ) THEN
        CREATE TABLE acme_ward_wise_trained_population (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL,
            trained_population INTEGER NOT NULL DEFAULT 0 CHECK (trained_population >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_trained_population) THEN


    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        '5cdcc9c5-abd6-41ba-b80b-8a3f75d026fc',
        1,
        178,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        'e308a4e6-21f8-4cd5-9ff0-bb64bf4eb5c3',
        2,
        248,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        '9e4ce236-5019-412c-8c07-5b2bcbbc7cc1',
        3,
        406,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        'cfe18730-6ed5-4d4e-a352-a313e86f4f16',
        4,
        31,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        '7e61a084-b3bb-4bc1-bb92-c6815b6997b9',
        5,
        294,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        '73eaa3f8-9739-4252-86a9-9869fb190e09',
        6,
        254,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        '22a0ac04-9374-405c-af9d-25a443ca8232',
        7,
        43,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        'd605ba9c-ecf9-4ea2-aee5-c6a9cd0f220a',
        8,
        185,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        'ec408228-659f-4f4e-b52d-743df3064a30',
        9,
        497,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    INSERT INTO acme_ward_wise_trained_population 
    (id, ward_number, trained_population, updated_at, created_at)
    VALUES (
        'e1017307-00ce-40c9-89a8-b405c9b5edb8',
        10,
        356,
        '2025-06-30 12:14:42',
        '2025-06-30 12:14:42'
    );
    

    END IF;
END
$$;

