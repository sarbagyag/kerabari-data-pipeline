-- Generated SQL script
-- Date: 2025-06-29 12:17:26


-- Check if acme_ward_wise_child_bearers table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_child_bearers'
    ) THEN
        CREATE TABLE acme_ward_wise_child_bearers (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL UNIQUE,
            age_15_to_49_child_bearers INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_child_bearers) THEN


    INSERT INTO acme_ward_wise_child_bearers 
    (id, ward_number, age_15_to_49_child_bearers, updated_at, created_at)
    VALUES (
        '1f98ce2f-4a8f-41a7-81b8-8d115891e246',
        1,
        1626,
        '2025-06-29 12:17:26',
        '2025-06-29 12:17:26'
    );
    

    INSERT INTO acme_ward_wise_child_bearers 
    (id, ward_number, age_15_to_49_child_bearers, updated_at, created_at)
    VALUES (
        '679d04b2-0d46-4803-9325-c571a4256282',
        2,
        1466,
        '2025-06-29 12:17:26',
        '2025-06-29 12:17:26'
    );
    

    INSERT INTO acme_ward_wise_child_bearers 
    (id, ward_number, age_15_to_49_child_bearers, updated_at, created_at)
    VALUES (
        '62d11e4f-4097-42d2-bf9c-231b2a148949',
        3,
        1856,
        '2025-06-29 12:17:26',
        '2025-06-29 12:17:26'
    );
    

    INSERT INTO acme_ward_wise_child_bearers 
    (id, ward_number, age_15_to_49_child_bearers, updated_at, created_at)
    VALUES (
        'ddc8edc4-ee54-44cb-8654-2603b2acd7d9',
        4,
        2055,
        '2025-06-29 12:17:26',
        '2025-06-29 12:17:26'
    );
    

    INSERT INTO acme_ward_wise_child_bearers 
    (id, ward_number, age_15_to_49_child_bearers, updated_at, created_at)
    VALUES (
        '856567c4-d393-49aa-8f12-29c009989715',
        5,
        763,
        '2025-06-29 12:17:26',
        '2025-06-29 12:17:26'
    );
    

    INSERT INTO acme_ward_wise_child_bearers 
    (id, ward_number, age_15_to_49_child_bearers, updated_at, created_at)
    VALUES (
        '913ac2b0-857b-4e0b-af53-aff41f8ca763',
        6,
        581,
        '2025-06-29 12:17:26',
        '2025-06-29 12:17:26'
    );
    

    INSERT INTO acme_ward_wise_child_bearers 
    (id, ward_number, age_15_to_49_child_bearers, updated_at, created_at)
    VALUES (
        'bb08006e-c866-4e74-ad96-e2268d5e519d',
        7,
        405,
        '2025-06-29 12:17:26',
        '2025-06-29 12:17:26'
    );
    

    END IF;
END
$$;

