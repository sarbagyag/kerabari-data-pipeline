-- Generated SQL script
-- Date: 2025-06-30 12:16:05


-- Check if acme_ward_wise_households_on_loan table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_households_on_loan'
    ) THEN
        CREATE TABLE acme_ward_wise_households_on_loan (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL,
            households INTEGER NOT NULL DEFAULT 0 CHECK (households >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_households_on_loan) THEN


    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '33e04cd6-15d7-4488-8981-f17bdfd1b9ac',
        1,
        234,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '6495c924-f925-4971-8e66-36895aa19ba5',
        2,
        106,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        'f8655a6c-6fb7-4910-89a6-2c1727b491c4',
        3,
        221,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '7162c273-db32-4743-8e74-d5280efd59ea',
        4,
        191,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '4a8926ab-2b8b-41df-a721-0f46558baedc',
        5,
        506,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '8c8387a8-ff79-4969-8c3f-9fb05de6bc04',
        6,
        446,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        'b9522bac-3fd6-4707-95cb-cf4cf24c3b48',
        7,
        482,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '2d5df60b-f634-4256-8870-cde670d86190',
        8,
        209,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        'df500eef-6778-4dfd-a59a-be4b0740aa4a',
        9,
        730,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    INSERT INTO acme_ward_wise_households_on_loan 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        'a43e8a7c-0853-4e37-a344-7bd9eedb7a9a',
        10,
        356,
        '2025-06-30 12:16:05',
        '2025-06-30 12:16:05'
    );
    

    END IF;
END
$$;

