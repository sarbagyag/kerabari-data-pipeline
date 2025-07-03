-- Generated SQL script
-- Date: 2025-06-30 12:38:25


-- Check if acme_municipality_wide_spices table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wide_spices'
    ) THEN
        -- Create the table
        CREATE TABLE acme_municipality_wide_spices (
            id                   varchar(36)    not null primary key,
            spice_type           varchar(100)   not null,
            production_in_tonnes numeric(10, 2) not null,
            sales_in_tonnes      numeric(10, 2) not null,
            revenue_in_rs        numeric(14, 2) not null,
            created_at           timestamp      default now(),
            updated_at           timestamp      default now()
        );
        
        ALTER TABLE acme_municipality_wide_spices OWNER TO postgres;
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wide_spices) THEN


    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'c16c3d38-86e7-4b76-ab82-497af075a858',
        'black_pepper',
        0.0,
        0.0,
        0.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'e005df47-b81c-458c-9af3-be2fa175c4e8',
        'chili_pepper',
        3.166,
        0.9498,
        110810.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '47fe51f2-df40-4597-8861-2d3398b795ba',
        'cinnamomum_tamala',
        0.0,
        0.0,
        0.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'f2f68e3d-fbfe-4f57-8e96-25be87d10577',
        'coriander',
        0.715,
        0.2145,
        12870.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'e772b644-1d9d-4db8-954e-692f32f91de6',
        'fenugreek',
        0.013,
        0.0039,
        286.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '1fa28b52-b027-49ab-89cb-a7b7ae742e0b',
        'garlic',
        10.925,
        3.2775000000000003,
        163875.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '467e0bfc-a800-4207-b9c1-b197a621498e',
        'ginger',
        6.555,
        1.9665,
        131100.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '9f3c5289-3191-4c4b-b855-de010b6c3fec',
        'other',
        0.0,
        0.0,
        0.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '3e13ceb9-71d6-4494-9d77-345d909ef426',
        'sichuan_pepper',
        0.0,
        0.0,
        0.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    INSERT INTO acme_municipality_wide_spices 
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '409d87f3-6824-4886-9116-41d6b0e4ca62',
        'turmeric',
        0.525,
        0.1575,
        13125.0,
        '2025-06-30 12:38:25',
        '2025-06-30 12:38:25'
    );
    

    END IF;
END
$$;

