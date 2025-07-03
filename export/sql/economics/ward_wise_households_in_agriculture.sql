-- Generated SQL script
-- Date: 2025-06-22 07:10:01


-- Check if ward_wise_households_in_agriculture table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'ward_wise_households_in_agriculture'
    ) THEN
        CREATE TABLE ward_wise_households_in_agriculture (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            involved_in_agriculture INTEGER NOT NULL CHECK (involved_in_agriculture >= 0),
            non_involved_in_agriculture INTEGER NOT NULL CHECK (non_involved_in_agriculture >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM ward_wise_households_in_agriculture) THEN


    INSERT INTO ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        'b58dce85-4a46-4d4c-a89e-f65469bc25c9',
        1,
        458,
        681,
        '2025-06-22 07:10:01',
        '2025-06-22 07:10:01'
    );
    

    INSERT INTO ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        'b83d4b55-8f1d-482f-8d30-d96daa85fedf',
        2,
        782,
        136,
        '2025-06-22 07:10:01',
        '2025-06-22 07:10:01'
    );
    

    INSERT INTO ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        'e11421b6-0781-4cdf-86f5-5439ca417def',
        3,
        467,
        97,
        '2025-06-22 07:10:01',
        '2025-06-22 07:10:01'
    );
    

    INSERT INTO ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        'db91db47-afd6-4c9c-a48c-a1b6e07e1fd0',
        4,
        689,
        159,
        '2025-06-22 07:10:01',
        '2025-06-22 07:10:01'
    );
    

    INSERT INTO ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        'd44eec17-18f4-4968-8a68-28e164398865',
        5,
        296,
        423,
        '2025-06-22 07:10:01',
        '2025-06-22 07:10:01'
    );
    

    INSERT INTO ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        'c3f17f81-5b81-40d8-b35d-60737828cdf6',
        6,
        619,
        245,
        '2025-06-22 07:10:01',
        '2025-06-22 07:10:01'
    );
    

    INSERT INTO ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        '334647ef-1060-4b99-afc8-9a98183509a3',
        7,
        315,
        272,
        '2025-06-22 07:10:01',
        '2025-06-22 07:10:01'
    );
    

    END IF;
END
$$;

