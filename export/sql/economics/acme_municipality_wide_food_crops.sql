-- Generated SQL script
-- Date: 2025-06-30 12:37:40


-- Check if acme_municipality_wide_food_crops table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wide_food_crops'
    ) THEN
        -- First create the enum type if it doesn't exist
        IF NOT EXISTS (
            SELECT 1 FROM pg_type WHERE typname = 'food_crop_enum'
        ) THEN
            CREATE TYPE food_crop_enum AS ENUM (
                'chaite_paddy', 'barse_paddy', 'corn', 'wheat', 'millet', 
                'barley', 'phapar', 'junelo', 'kaguno', 'other', 'none'
            );
        END IF;

        -- Create the table
        CREATE TABLE acme_municipality_wide_food_crops (
            id                   varchar(36)    not null primary key,
            food_crop            food_crop_enum not null,
            production_in_tonnes numeric(10, 2) not null,
            sales_in_tonnes      numeric(10, 2) not null,
            revenue_in_rs        numeric(14, 2) not null,
            created_at           timestamp      default now(),
            updated_at           timestamp      default now()
        );
        
        ALTER TABLE acme_municipality_wide_food_crops OWNER TO postgres;
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wide_food_crops) THEN


    INSERT INTO acme_municipality_wide_food_crops 
    (id, food_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '8976aa9c-16a9-4c4a-84bd-c75557e1ea59',
        'barley',
        0.0,
        0.0,
        0.0,
        '2025-06-30 12:37:40',
        '2025-06-30 12:37:40'
    );
    

    INSERT INTO acme_municipality_wide_food_crops 
    (id, food_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '14a3acca-5205-4bd5-9a7d-c57f256d8c74',
        'barse_paddy',
        1711.24,
        513.372,
        71872080.0,
        '2025-06-30 12:37:40',
        '2025-06-30 12:37:40'
    );
    

    INSERT INTO acme_municipality_wide_food_crops 
    (id, food_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'b5d28a74-dcea-4c0e-b3d1-1be98d5d8a1a',
        'chaite_paddy',
        72.58,
        21.773999999999997,
        3266100.0,
        '2025-06-30 12:37:40',
        '2025-06-30 12:37:40'
    );
    

    INSERT INTO acme_municipality_wide_food_crops 
    (id, food_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '25f52bcf-c43a-41db-a811-507efea2112f',
        'corn',
        468.759,
        140.6277,
        17812842.0,
        '2025-06-30 12:37:40',
        '2025-06-30 12:37:40'
    );
    

    INSERT INTO acme_municipality_wide_food_crops 
    (id, food_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '52d135a4-72e6-41d7-8203-79d8de0feada',
        'junelo',
        0.04,
        0.012,
        2320.0,
        '2025-06-30 12:37:40',
        '2025-06-30 12:37:40'
    );
    

    INSERT INTO acme_municipality_wide_food_crops 
    (id, food_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'bb08fee7-36c7-4bcc-883f-d0ef8b937f25',
        'millet',
        21.083,
        6.3248999999999995,
        1370395.0,
        '2025-06-30 12:37:40',
        '2025-06-30 12:37:40'
    );
    

    INSERT INTO acme_municipality_wide_food_crops 
    (id, food_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'a0c077ca-f138-440b-b9c1-a0835484b246',
        'other',
        0.443,
        0.1329,
        19935.0,
        '2025-06-30 12:37:40',
        '2025-06-30 12:37:40'
    );
    

    INSERT INTO acme_municipality_wide_food_crops 
    (id, food_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '21101683-6582-4f11-a084-c7b578f40e2d',
        'phapar',
        0.245,
        0.0735,
        13475.0,
        '2025-06-30 12:37:40',
        '2025-06-30 12:37:40'
    );
    

    INSERT INTO acme_municipality_wide_food_crops 
    (id, food_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '8ebd28c9-e0e5-49a5-8a37-f3c064d531ab',
        'wheat',
        13.12,
        3.9359999999999995,
        682240.0,
        '2025-06-30 12:37:40',
        '2025-06-30 12:37:40'
    );
    

    END IF;
END
$$;

