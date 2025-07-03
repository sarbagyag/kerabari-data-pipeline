-- Generated SQL script
-- Date: 2025-06-30 12:38:02


-- Check if acme_municipality_wide_oil_seeds table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wide_oil_seeds'
    ) THEN
        -- Create the table
        CREATE TABLE acme_municipality_wide_oil_seeds (
            id                   varchar(36)    not null primary key,
            oil_seed             varchar(100)   not null,
            production_in_tonnes numeric(10, 2) not null,
            sales_in_tonnes      numeric(10, 2) not null,
            revenue_in_rs        numeric(14, 2) not null,
            created_at           timestamp      default now(),
            updated_at           timestamp      default now()
        );
        
        ALTER TABLE acme_municipality_wide_oil_seeds OWNER TO postgres;
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wide_oil_seeds) THEN


    INSERT INTO acme_municipality_wide_oil_seeds 
    (id, oil_seed, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '1955920f-683c-4d1c-9c38-586f0a897b02',
        'flax',
        0.004,
        0.0012,
        480.0,
        '2025-06-30 12:38:02',
        '2025-06-30 12:38:02'
    );
    

    INSERT INTO acme_municipality_wide_oil_seeds 
    (id, oil_seed, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '12fff9d9-033e-4043-a360-673c8d7e9581',
        'mustard',
        108.1,
        32.43,
        9188500.0,
        '2025-06-30 12:38:02',
        '2025-06-30 12:38:02'
    );
    

    INSERT INTO acme_municipality_wide_oil_seeds 
    (id, oil_seed, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'f74d2b52-7fdf-4585-8f2b-033550a72bd2',
        'other',
        0.002,
        0.0006,
        200.0,
        '2025-06-30 12:38:02',
        '2025-06-30 12:38:02'
    );
    

    INSERT INTO acme_municipality_wide_oil_seeds 
    (id, oil_seed, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '2cf18070-d6b8-46be-9c18-ec4a6eeadacc',
        'sunflower',
        0.122,
        0.0366,
        11590.0,
        '2025-06-30 12:38:02',
        '2025-06-30 12:38:02'
    );
    

    END IF;
END
$$;

