-- Generated SQL script
-- Date: 2025-05-26 13:42:39


-- Check if acme_ward_wise_house_map_passed table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_house_map_passed'
    ) THEN
        CREATE TABLE acme_ward_wise_house_map_passed (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            map_passed_status VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_house_map_passed) THEN


    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '5b7e40f9-49dc-4578-b7ba-6bd1481f41fb',
        1,
        'PASSED',
        725,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        'fa66c006-f709-4ba9-9126-c0784b64b671',
        1,
        'ARCHIVED',
        1,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '6b223b44-2c29-45e3-b936-eeaeed494945',
        1,
        'NEITHER_PASSED_NOR_ARCHIVED',
        7,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        'f0ce9154-310a-4aeb-ba4d-ee63b5e817ce',
        2,
        'PASSED',
        1049,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '8ccf5dd7-582f-47b2-9b6d-c6f28bf1d5ff',
        2,
        'ARCHIVED',
        3,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '033b9150-1b57-4309-8450-809debd05cbc',
        2,
        'NEITHER_PASSED_NOR_ARCHIVED',
        28,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        'a8d9b2bd-8346-4585-a303-24ab90963605',
        3,
        'PASSED',
        973,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        'df632133-2fca-417c-b063-9f696ed552d0',
        3,
        'ARCHIVED',
        8,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '8eb7ef2b-3c7b-4018-a745-5e61a48bd66d',
        3,
        'NEITHER_PASSED_NOR_ARCHIVED',
        5,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '17784f15-9e10-4c47-9820-b2be3e6a0469',
        4,
        'PASSED',
        1152,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        'f0036c3f-a0f6-47f3-9faf-e7af92770c07',
        4,
        'ARCHIVED',
        21,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '102ee285-4271-44cf-8c9c-9987e9186fdd',
        5,
        'PASSED',
        870,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '0751d4c3-2acd-4050-94b3-ae3a52098d5f',
        5,
        'ARCHIVED',
        102,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '1a421afb-8a77-4b52-8619-dd9bc3ab45a8',
        5,
        'NEITHER_PASSED_NOR_ARCHIVED',
        67,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        'de971c3b-aa5b-4805-8a72-ff712ca5c5a6',
        6,
        'PASSED',
        66,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '113acd5a-b0cc-48e3-b3f3-cfa8d27c8e8a',
        6,
        'NEITHER_PASSED_NOR_ARCHIVED',
        260,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        'a8306192-4d65-4ead-a077-897a4e987ec6',
        7,
        'PASSED',
        482,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '59d043a4-ea62-412a-af42-bbf4646159dc',
        7,
        'ARCHIVED',
        333,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '04ec31ec-72d2-4661-8c2c-d84dca8b57c7',
        7,
        'NEITHER_PASSED_NOR_ARCHIVED',
        152,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '6f5b4e70-d1da-4f2f-85b8-297c85d1d8c4',
        8,
        'PASSED',
        634,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '2b8b7df4-85a8-4f6e-b25a-a6b77ff6e100',
        8,
        'ARCHIVED',
        54,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    INSERT INTO acme_ward_wise_house_map_passed 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '0d08bcb1-3edd-436c-96ff-f9f6a5ceb4ea',
        8,
        'NEITHER_PASSED_NOR_ARCHIVED',
        149,
        '2025-05-26 13:42:39',
        '2025-05-26 13:42:39'
    );
    

    END IF;
END
$$;

