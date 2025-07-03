-- Generated SQL script
-- Date: 2025-06-30 12:38:35


-- Check if acme_municipality_wide_vegetables table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wide_vegetables'
    ) THEN
        -- Create the table
        CREATE TABLE acme_municipality_wide_vegetables (
            id                   varchar(36)    not null primary key,
            vegetable_type       varchar(100)   not null,
            production_in_tonnes numeric(10, 2) not null,
            sales_in_tonnes      numeric(10, 2) not null,
            revenue_in_rs        numeric(14, 2) not null,
            created_at           timestamp      default now(),
            updated_at           timestamp      default now()
        );
        
        ALTER TABLE acme_municipality_wide_vegetables OWNER TO postgres;
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wide_vegetables) THEN


    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'a406ab03-1567-4044-8b44-3f448a268aa5',
        'balsam_apple',
        0.4,
        0.12,
        12000.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'ad42c621-b914-447e-8637-1b6689bb02ac',
        'bitter_gourd',
        2.62,
        0.786,
        91700.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'c906cb74-a04d-41d0-88ee-3d6f6806f528',
        'brinjal',
        6.219,
        1.8657,
        186570.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '5999a417-fd2f-4279-8f63-753ec5a825e2',
        'cabbage',
        1.03,
        0.309,
        20600.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '0631703a-c73a-47a1-bfc6-6403e4eb1928',
        'calabash',
        0.02,
        0.006,
        300.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '81b7da5d-1a1d-45d0-9720-3f820eb2c117',
        'capsicum',
        0.37,
        0.111,
        14800.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '13e8b43d-137f-446b-8870-11b663771d10',
        'carrot',
        0.05,
        0.015,
        1250.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'e9ba91fa-3c3b-40ef-8d2b-00d2a2eed3e1',
        'cauliflower',
        2.131,
        0.6392999999999999,
        74584.99999999999,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '5855678b-25c1-4eed-b452-04c8d21edb42',
        'colocasia',
        0.005,
        0.0015,
        125.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '6e18627c-d8f1-4792-9700-6d2b7c1fbc21',
        'cucumber',
        1.155,
        0.3465,
        28875.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'd903cc04-3040-44cb-b9b9-629559a0852a',
        'garden_cress',
        0.005,
        0.0015,
        125.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'bee3f17b-d4de-4df1-b308-9bf18a83ff89',
        'luffa',
        0.035,
        0.0105,
        700.0000000000001,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '87a5ca85-8631-454e-95c1-0359baff4b95',
        'mushroom',
        5.0,
        1.5,
        400000.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'ae7fa6d9-7254-4fc7-86dc-4d917382bae2',
        'mustard_greens',
        1.575,
        0.4725,
        31500.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '5010c2b6-a059-4f70-ab64-28e650fc463d',
        'okra',
        0.026,
        0.0078,
        910.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'e79b692a-5ed8-4be2-91d7-ad1bc2ae91af',
        'onion',
        2.31,
        0.693,
        46200.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '03d6bde6-d676-4ecf-b62e-cc96e94074ee',
        'other',
        16.535,
        4.9605,
        413375.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'a1d446ca-ba25-49aa-bb03-4c31d625fe9d',
        'potato',
        57.073,
        17.1219,
        1426825.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'c9f7b5ec-6dce-4b35-ae0b-e8af823e8e77',
        'pumpkin',
        0.365,
        0.1095,
        6570.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '96f53105-ce79-4e45-8a79-61e56fd51f3d',
        'radish',
        1.689,
        0.5067,
        25335.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '2a4fb7f3-36c0-4194-8484-b3b2dfe31f57',
        'red_kidney_bean',
        0.21,
        0.063,
        10500.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'fbb4a3c2-2088-4c41-9c06-9351fa72d6b4',
        'snake_gourd',
        0.2,
        0.06,
        5000.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'e3791c20-182c-4191-b7de-a6330c0d5021',
        'spinach',
        0.021,
        0.0063,
        630.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '6b9efaa3-d137-469c-a2f3-79cf70491430',
        'squice',
        61.4,
        18.419999999999998,
        2149000.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '79de1962-2d22-4b6a-9a1e-f8418df452e1',
        'string_bean',
        0.676,
        0.2028,
        30420.000000000004,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '4023d125-e187-44de-a87f-14eae8ea7797',
        'tomato',
        34.619,
        10.3857,
        1038570.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '4ba61daa-2479-43f4-bea1-f7ab4132460f',
        'turnip',
        0.0,
        0.0,
        0.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    INSERT INTO acme_municipality_wide_vegetables 
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'd2d95c41-e3cf-4146-841c-436a3c9154a1',
        'yam',
        0.025,
        0.0075,
        750.0,
        '2025-06-30 12:38:35',
        '2025-06-30 12:38:35'
    );
    

    END IF;
END
$$;

