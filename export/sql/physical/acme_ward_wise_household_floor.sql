-- Generated SQL script
-- Date: 2025-06-30 13:03:39


-- Check if acme_ward_wise_household_floor table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_household_floor'
    ) THEN
        CREATE TABLE acme_ward_wise_household_floor (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            floor_type VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_household_floor) THEN


    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        '637e4bd9-67bc-4a88-ac55-bea71dd0e3d9',
        1,
        'CONCRETE',
        489,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        '51235c5d-3971-4625-af60-9636968d4c8e',
        2,
        'CONCRETE',
        578,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        'b59935fe-8783-4e90-a511-eb2f899c0d49',
        3,
        'CONCRETE',
        836,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        'ae5cb72a-f8a6-49cb-be7f-e9a2196a84a3',
        4,
        'CONCRETE',
        427,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        '5d7ba174-8f23-4cda-8e2d-0fa84a7a159e',
        5,
        'CONCRETE',
        1015,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        'd8303b58-0377-4ffb-b2db-3bc6d72e1f37',
        6,
        'CONCRETE',
        1014,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        'ecca7375-869f-4c18-b72d-516ddbead5eb',
        7,
        'CONCRETE',
        1063,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        'ff5507e3-1a8f-4b3c-951a-1e12d7baf41b',
        8,
        'CONCRETE',
        1069,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        '901bea68-ae88-4a5e-a140-210553c3b59e',
        9,
        'CONCRETE',
        1441,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    INSERT INTO acme_ward_wise_household_floor 
    (id, ward_number, floor_type, households, created_at, updated_at)
    VALUES (
        'b603f84c-3e03-4584-a4e3-2b247df01e47',
        10,
        'CONCRETE',
        931,
        '2025-06-30 13:03:39',
        '2025-06-30 13:03:39'
    );
    

    END IF;
END
$$;

