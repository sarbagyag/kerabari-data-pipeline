-- Generated SQL script
-- Date: 2025-06-30 12:45:25


-- Check if acme_ward_wise_literacy_status table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_literacy_status'
    ) THEN
        CREATE TABLE acme_ward_wise_literacy_status (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            literacy_type VARCHAR(100) NOT NULL,
            population INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_literacy_status) THEN


    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '87e5dfad-c26f-4baf-8e65-88486c3290fe',
        1,
        'BOTH_READING_AND_WRITING',
        1587,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '7341f603-7ee8-4149-aaa0-6ec43c4ab780',
        1,
        'ILLITERATE',
        549,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'e16ac2ec-04f0-498d-9477-07e04f8eb890',
        2,
        'BOTH_READING_AND_WRITING',
        1835,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'f2384dca-4251-4f55-be02-fbe317671cf3',
        2,
        'ILLITERATE',
        395,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'ee516781-a9a1-4353-9135-8996ac26aef8',
        2,
        'READING_ONLY',
        23,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '6f89de30-1341-424f-a942-76f41eda2c7c',
        3,
        'BOTH_READING_AND_WRITING',
        2628,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '74cb7217-e05a-4bf8-87e6-c9668016350e',
        3,
        'ILLITERATE',
        843,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '74f526f5-93cf-4133-8325-7c1f1be2d452',
        3,
        'READING_ONLY',
        18,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '4ece8ad4-f5af-425b-9bdf-61814e6a5568',
        4,
        'BOTH_READING_AND_WRITING',
        1189,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'd8a49345-b423-4936-817b-7786eab2672c',
        4,
        'ILLITERATE',
        527,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'ae518c96-7c9f-45c1-8b3b-3696f1cf283d',
        4,
        'READING_ONLY',
        13,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '724b8dd8-e492-4b32-bddf-505b8bbb7663',
        5,
        'BOTH_READING_AND_WRITING',
        3461,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '9bb2df57-945f-4978-a01d-82cc95b8fc3b',
        5,
        'ILLITERATE',
        730,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '18881d7a-28b4-4ca5-93d5-7c2b57e4a2a1',
        5,
        'READING_ONLY',
        2,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'b0a6e591-b9c2-4f2c-99e1-49c8d4e78d79',
        6,
        'BOTH_READING_AND_WRITING',
        2807,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '24af2976-7cad-4d48-8be8-df01abfb48b1',
        6,
        'ILLITERATE',
        1174,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '8aec1992-f265-44cf-a8c7-db7534761310',
        6,
        'READING_ONLY',
        157,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '400f81c7-71fb-4aff-98cb-490a61c969c4',
        7,
        'BOTH_READING_AND_WRITING',
        3374,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'c74b2554-ab82-46d7-ac67-8c9cbdcc8781',
        7,
        'ILLITERATE',
        878,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '2df43d8e-4b20-467f-b223-6f94ef2c5a67',
        7,
        'READING_ONLY',
        33,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '200af8fb-3106-48ea-95b7-c77b47895ada',
        8,
        'BOTH_READING_AND_WRITING',
        3328,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '026f29c1-57bf-428e-a576-ecaa2da20b36',
        8,
        'ILLITERATE',
        866,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'ae3dbeae-97f7-47d5-8044-09b869425ae5',
        8,
        'READING_ONLY',
        8,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '6ccc8133-4861-46a1-8e07-d83fca60bb44',
        9,
        'BOTH_READING_AND_WRITING',
        4800,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'bd0db75e-f442-4673-92c8-ec50b3ea8d90',
        9,
        'ILLITERATE',
        1106,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '713681ff-2e14-43fe-9d64-7a3add084e76',
        9,
        'READING_ONLY',
        17,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'c03b5827-a33c-4d12-8258-261d58a10171',
        10,
        'BOTH_READING_AND_WRITING',
        3181,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '93718293-1007-4092-94ee-e012502e8153',
        10,
        'ILLITERATE',
        650,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    INSERT INTO acme_ward_wise_literacy_status 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        'ada3d6d6-3171-4e23-9b91-3860ea653ff2',
        10,
        'READING_ONLY',
        3,
        '2025-06-30 12:45:25',
        '2025-06-30 12:45:25'
    );
    

    END IF;
END
$$;

