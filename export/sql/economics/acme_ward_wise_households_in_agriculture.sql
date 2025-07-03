-- Generated SQL script
-- Date: 2025-06-30 15:15:23


-- Check if acme_ward_wise_households_in_agriculture table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_households_in_agriculture'
    ) THEN
        CREATE TABLE acme_ward_wise_households_in_agriculture (
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_households_in_agriculture) THEN


    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        '44ace4fa-5656-4f72-812a-4288f1716a62',
        1,
        0,
        433,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        '62f29ab3-2dcb-42e5-b02c-1f49f2fcf178',
        2,
        0,
        179,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        '3af73aee-c5d2-429a-ae13-a4ac958fbf99',
        3,
        0,
        634,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        'd0da92bc-6edc-4d42-b1f1-d60ebb4b414f',
        4,
        0,
        339,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        'bba67bb6-c526-4a68-aeac-cb4afe2e0b4d',
        5,
        0,
        914,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        '8cd113e8-2a32-41d7-8cb9-0c1a7ce53a08',
        6,
        0,
        945,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        '189fee26-c144-43c8-8194-b3a33a3b6cad',
        7,
        0,
        931,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        '61e17466-1cd4-4de6-98f2-a1465fb0615e',
        8,
        0,
        496,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        'ae6353ec-e0c9-4cb7-97c9-5718ab30cdcb',
        9,
        0,
        1206,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    INSERT INTO acme_ward_wise_households_in_agriculture 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        '141f79e2-afd4-44cd-bf39-682623f0d08a',
        10,
        0,
        851,
        '2025-06-30 15:15:23',
        '2025-06-30 15:15:23'
    );
    

    END IF;
END
$$;

