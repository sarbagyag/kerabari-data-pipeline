-- Generated SQL script
-- Date: 2025-06-23 23:08:15


-- Enable pgcrypto extension for gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Check if acme_municipality_wise_facilities table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'facility_type'
    ) THEN
        CREATE TYPE facility_type AS ENUM (
            'RADIO',
            'TELEVISION',
            'COMPUTER',
            'INTERNET',
            'MOBILE_PHONE',
            'CAR_JEEP',
            'MOTORCYCLE',
            'BICYCLE',
            'REFRIGERATOR',
            'WASHING_MACHINE',
            'AIR_CONDITIONER',
            'ELECTRICAL_FAN',
            'MICROWAVE_OVEN',
            'DAILY_NATIONAL_NEWSPAPER_ACCESS',
            'NONE'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wise_facilities'
    ) THEN
        CREATE TABLE acme_municipality_wise_facilities (
            id          uuid          default gen_random_uuid() primary key,
            facility    facility_type not null,
            households  integer       not null,
            updated_at  timestamp     default now(),
            created_at  timestamp     default now()
        );
        
        ALTER TABLE acme_municipality_wise_facilities OWNER TO postgres;
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wise_facilities) THEN


    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'AIR_CONDITIONER',
        11,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'BICYCLE',
        4467,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'CAR_JEEP',
        104,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'COMPUTER',
        484,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'DAILY_NATIONAL_NEWSPAPER_ACCESS',
        4,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'ELECTRICAL_FAN',
        7073,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'INTERNET',
        3045,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'MICROWAVE_OVEN',
        17,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'MOBILE_PHONE',
        8342,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'MOTORCYCLE',
        1787,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'NONE',
        122,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'RADIO',
        834,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'REFRIGERATOR',
        1672,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'TELEVISION',
        2659,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    INSERT INTO acme_municipality_wise_facilities 
    (facility, households, updated_at, created_at)
    VALUES (
        'WASHING_MACHINE',
        57,
        '2025-06-23 23:08:15',
        '2025-06-23 23:08:15'
    );
    

    END IF;
END
$$;

