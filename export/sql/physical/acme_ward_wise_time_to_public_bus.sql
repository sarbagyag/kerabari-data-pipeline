-- Generated SQL script
-- Date: 2025-05-24 18:47:16


-- Check if acme_ward_wise_time_to_public_bus table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'time_to_public_bus_type'
    ) THEN
        CREATE TYPE time_to_public_bus_type AS ENUM (
            'UNDER_15_MIN', 
            'UNDER_30_MIN', 
            'UNDER_1_HOUR', 
            '1_HOUR_OR_MORE'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_time_to_public_bus'
    ) THEN
        CREATE TABLE acme_ward_wise_time_to_public_bus (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            time_to_public_bus time_to_public_bus_type NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_time_to_public_bus) THEN


    INSERT INTO acme_ward_wise_time_to_public_bus 
    (id, ward_number, time_to_public_bus, households, updated_at, created_at)
    VALUES (
        '138f7524-802d-49c4-af83-963caa325240',
        1,
        '1_HOUR_OR_MORE',
        910,
        '2025-05-24 18:47:16',
        '2025-05-24 18:47:16'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_bus 
    (id, ward_number, time_to_public_bus, households, updated_at, created_at)
    VALUES (
        '8271d976-8da1-4e37-9c58-da237c834039',
        2,
        '1_HOUR_OR_MORE',
        2611,
        '2025-05-24 18:47:16',
        '2025-05-24 18:47:16'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_bus 
    (id, ward_number, time_to_public_bus, households, updated_at, created_at)
    VALUES (
        '55379c02-21cb-45ff-8c19-fdf180aadcec',
        3,
        '1_HOUR_OR_MORE',
        2061,
        '2025-05-24 18:47:16',
        '2025-05-24 18:47:16'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_bus 
    (id, ward_number, time_to_public_bus, households, updated_at, created_at)
    VALUES (
        '9774e629-655f-47c7-ad57-5a714cc922e0',
        4,
        '1_HOUR_OR_MORE',
        1832,
        '2025-05-24 18:47:16',
        '2025-05-24 18:47:16'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_bus 
    (id, ward_number, time_to_public_bus, households, updated_at, created_at)
    VALUES (
        '15bcaa20-efb5-4db3-b7d6-1330fa327e3b',
        5,
        '1_HOUR_OR_MORE',
        1848,
        '2025-05-24 18:47:16',
        '2025-05-24 18:47:16'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_bus 
    (id, ward_number, time_to_public_bus, households, updated_at, created_at)
    VALUES (
        '3de5c922-f450-412a-995c-8415edddf417',
        6,
        '1_HOUR_OR_MORE',
        1971,
        '2025-05-24 18:47:16',
        '2025-05-24 18:47:16'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_bus 
    (id, ward_number, time_to_public_bus, households, updated_at, created_at)
    VALUES (
        'e1f3e1b8-2d9d-4756-922f-d5354eec51bd',
        7,
        '1_HOUR_OR_MORE',
        2407,
        '2025-05-24 18:47:16',
        '2025-05-24 18:47:16'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_bus 
    (id, ward_number, time_to_public_bus, households, updated_at, created_at)
    VALUES (
        '11046519-c9a9-4208-aa6b-f989623c7f74',
        8,
        '1_HOUR_OR_MORE',
        1890,
        '2025-05-24 18:47:16',
        '2025-05-24 18:47:16'
    );
    

    END IF;
END
$$;

