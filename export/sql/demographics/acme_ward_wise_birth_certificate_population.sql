-- Generated SQL script
-- Date: 2025-06-30 12:12:42


-- Enable pgcrypto extension for gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Check if acme_ward_wise_birth_certificate_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_birth_certificate_population'
    ) THEN
        CREATE TABLE public.acme_ward_wise_birth_certificate_population (
            id                       uuid PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number              int    NOT NULL CHECK (ward_number > 0),
            with_birth_certificate   int    NOT NULL CHECK (with_birth_certificate   >= 0),
            without_birth_certificate int   NOT NULL CHECK (without_birth_certificate >= 0),
            total_population_under_5 int
                GENERATED ALWAYS AS (with_birth_certificate + without_birth_certificate) STORED,
            updated_at               timestamptz NOT NULL DEFAULT now(),
            created_at               timestamptz NOT NULL DEFAULT now()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_birth_certificate_population) THEN


    INSERT INTO acme_ward_wise_birth_certificate_population 
    (ward_number, with_birth_certificate, without_birth_certificate, updated_at, created_at)
    VALUES (
        1,
        136,
        29,
        '2025-06-30 12:12:42',
        '2025-06-30 12:12:42'
    );
    

    INSERT INTO acme_ward_wise_birth_certificate_population 
    (ward_number, with_birth_certificate, without_birth_certificate, updated_at, created_at)
    VALUES (
        2,
        41,
        7,
        '2025-06-30 12:12:42',
        '2025-06-30 12:12:42'
    );
    

    INSERT INTO acme_ward_wise_birth_certificate_population 
    (ward_number, with_birth_certificate, without_birth_certificate, updated_at, created_at)
    VALUES (
        3,
        17,
        15,
        '2025-06-30 12:12:42',
        '2025-06-30 12:12:42'
    );
    

    INSERT INTO acme_ward_wise_birth_certificate_population 
    (ward_number, with_birth_certificate, without_birth_certificate, updated_at, created_at)
    VALUES (
        7,
        35,
        8,
        '2025-06-30 12:12:42',
        '2025-06-30 12:12:42'
    );
    

    INSERT INTO acme_ward_wise_birth_certificate_population 
    (ward_number, with_birth_certificate, without_birth_certificate, updated_at, created_at)
    VALUES (
        8,
        20,
        2,
        '2025-06-30 12:12:42',
        '2025-06-30 12:12:42'
    );
    

    INSERT INTO acme_ward_wise_birth_certificate_population 
    (ward_number, with_birth_certificate, without_birth_certificate, updated_at, created_at)
    VALUES (
        9,
        25,
        5,
        '2025-06-30 12:12:42',
        '2025-06-30 12:12:42'
    );
    

    END IF;
END
$$;

