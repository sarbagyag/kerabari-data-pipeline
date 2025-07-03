-- Generated SQL script
-- Date: 2025-06-30 13:04:12


-- Create enum type if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'time_to_financial_organization_type_enum') THEN
        CREATE TYPE time_to_financial_organization_type_enum AS ENUM (
            'UNDER_15_MIN',
            'UNDER_30_MIN', 
            'UNDER_1_HOUR',
            '1_HOUR_OR_MORE'
        );
    END IF;
END
$$;

-- Check if ward_wise_time_to_financial_organization table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'ward_wise_time_to_financial_organization'
    ) THEN
        CREATE TABLE ward_wise_time_to_financial_organization (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            time_to_financial_organization_type time_to_financial_organization_type_enum NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM ward_wise_time_to_financial_organization) THEN


    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        'f11a3281-0341-48ab-804a-15b4558be20c',
        1,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        489,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        '57665782-655b-4afb-9c05-a8ef32feb177',
        2,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        578,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        '242a4a49-e2c8-4b8a-be83-a483e414ccb8',
        3,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        836,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        '49c9f77f-8d8e-4600-b2bc-6c52ff0a39d5',
        4,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        427,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        'b174e2d8-d8f9-45b3-9466-96ae42d865b8',
        5,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        1015,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        '9d334c87-b90d-47aa-bd1a-9139fb6cef38',
        6,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        1014,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        '5d797d24-393c-4686-bb14-ec789b6a3beb',
        7,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        1063,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        '564c13cc-ecd7-4bd6-a657-474128cd3227',
        8,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        1069,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        '7924d43b-a48c-409b-8527-b03414ca7ff4',
        9,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        1441,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    INSERT INTO ward_wise_time_to_financial_organization 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        '742afa2b-68e5-4b21-a405-2f2716317f1b',
        10,
        'UNDER_30_MIN'::time_to_financial_organization_type_enum,
        931,
        '2025-06-30 13:04:12',
        '2025-06-30 13:04:12'
    );
    

    END IF;
END
$$;

