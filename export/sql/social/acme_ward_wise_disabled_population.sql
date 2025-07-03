-- Generated SQL script
-- Date: 2025-06-30 13:06:12


-- Check if acme_ward_wise_disabled_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_disabled_population'
    ) THEN
        CREATE TABLE acme_ward_wise_disabled_population (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            disabled_population INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_disabled_population) THEN


    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        '0794e14c-4b05-4738-b695-1247a6ab4f4e',
        1,
        39,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        'd0c11c20-b5b2-4617-bb38-961c2d70736d',
        2,
        64,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        '0e182f06-ed4c-445d-b88f-b2660be5bd6d',
        3,
        92,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        '34fbb71f-e633-4891-90bf-fafce0bc7350',
        4,
        50,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        '5e5c7544-8e30-4afa-9bf7-a0b620637b22',
        5,
        83,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        'a645fed9-6ffc-4016-b074-f7a2b8341556',
        6,
        62,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        '19879ca8-c3d3-43d8-97af-529f04e0f1dc',
        7,
        24,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        'b7f78402-489f-44e6-98d9-8609e34346f7',
        8,
        87,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        'c0428e10-12a0-4f9b-ab59-ba0944a7ca73',
        9,
        106,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    INSERT INTO acme_ward_wise_disabled_population 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        'd96f7d00-5e2b-4fe7-8a5a-db8311c3ebf3',
        10,
        75,
        '2025-06-30 13:06:12',
        '2025-06-30 13:06:12'
    );
    

    END IF;
END
$$;

