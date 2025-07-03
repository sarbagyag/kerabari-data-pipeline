-- Generated SQL script
-- Date: 2025-06-30 12:55:28


-- Check if acme_ward_age_wise_first_child_birth_age table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'first_child_birth_age_group'
    ) THEN
        CREATE TYPE first_child_birth_age_group AS ENUM (
            'AGE_15_19',
            'AGE_20_24',
            'AGE_25_29',
            'AGE_30_34',
            'AGE_35_39',
            'AGE_40_44',
            'AGE_45_49'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_age_wise_first_child_birth_age'
    ) THEN
        CREATE TABLE acme_ward_age_wise_first_child_birth_age (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            first_child_birth_age_group first_child_birth_age_group NOT NULL,
            population INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW(),
            UNIQUE(ward_number, first_child_birth_age_group)
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_age_wise_first_child_birth_age) THEN


    END IF;
END
$$;

