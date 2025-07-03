-- Generated SQL script
-- Date: 2025-06-17 08:26:32


-- Check if acme_caste_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_caste_population'
    ) THEN
        CREATE TABLE acme_caste_population (
            id VARCHAR(36) PRIMARY KEY,
            caste_type VARCHAR(100) NOT NULL,
            population INTEGER,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_caste_population) THEN


    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '4240f91e-55c9-4c65-944e-4dfa04b0e758',
        'कामी',
        3679,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '434ca3d8-485a-481c-9f77-2fa1c9b64357',
        'क्षेत्री',
        12640,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '361ab38b-e52d-43ae-9e2b-69220d34f299',
        'गुरुङ',
        196,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '79c9ae88-7975-4708-9f29-057edb278954',
        'थकाली',
        6,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '82141491-31ff-4bac-9a60-023361f2ed2a',
        'दमाई/ढोली',
        600,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '02ee79e8-8c26-43ca-aee8-e9ba719267d1',
        'नेवार',
        5,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '251ed3a6-cee1-478c-a277-e462ac0c816d',
        'ब्राह्मण पहाड',
        170,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'd1fe8bd8-d1b8-4b1e-98b2-4def46122d27',
        'मगर',
        9819,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '070732c7-0552-4975-ac53-629ebee53bb5',
        'माझी',
        61,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '6e696ed2-0d4a-4591-af62-f6fdab452119',
        'सार्की',
        160,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    INSERT INTO acme_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '7028f445-6724-49dd-9809-c9d03f20b70c',
        'सुनुवार',
        159,
        '2025-06-17 08:26:32',
        '2025-06-17 08:26:32'
    );
    

    END IF;
END
$$;

