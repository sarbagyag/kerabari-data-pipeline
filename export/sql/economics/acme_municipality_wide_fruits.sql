-- Generated SQL script
-- Date: 2025-06-30 12:38:11


-- Check if acme_municipality_wide_fruits table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wide_fruits'
    ) THEN
        -- Create the table
        CREATE TABLE acme_municipality_wide_fruits (
            id                   varchar(36)    not null primary key,
            fruit_type           varchar(100)   not null,
            production_in_tonnes numeric(10, 2) not null,
            sales_in_tonnes      numeric(10, 2) not null,
            revenue_in_rs        numeric(14, 2) not null,
            created_at           timestamp      default now(),
            updated_at           timestamp      default now()
        );
        
        ALTER TABLE acme_municipality_wide_fruits OWNER TO postgres;
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wide_fruits) THEN


    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'e6c52e9e-e6a3-45a1-a2f0-20a0ab1d426a',
        'avocado',
        0.255,
        0.0765,
        102000.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '6abbc946-f858-491c-aeeb-fe4f64ed501a',
        'banana',
        40.189,
        12.0567,
        2411340.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '8514718a-0d1b-485b-b8e5-625d1eeddd69',
        'guava',
        0.353,
        0.1059,
        28240.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'b74ed63d-33d8-411e-af88-5038b58a6829',
        'jackfruit',
        3.358,
        1.0074,
        268640.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '6b322308-8269-4c25-bc83-e49c4a2b7554',
        'japanese_persimmon',
        0.2,
        0.06,
        24000.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '8bee99b3-edc1-4c3e-b49d-c83797228929',
        'kiwi',
        0.4,
        0.12,
        200000.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'a1066d9f-2f68-4f52-af90-a2722dfa58d5',
        'lemon',
        1.678,
        0.5034,
        201360.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '941970f2-5f5f-4e71-9c7e-2f5914bc21a1',
        'litchi',
        8.168,
        2.4503999999999997,
        2450400.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '5381ae39-d367-48d8-8c53-f66518c34f04',
        'mango',
        23.408,
        7.0224,
        3511200.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'a0b692c8-4cc7-41d4-b8d2-fa055aa45975',
        'nibuwa',
        0.092,
        0.0276,
        18400.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '8fbefc68-a3f7-4bec-87cd-b1ea5ee8d9cd',
        'orange',
        0.0,
        0.0,
        0.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'eb9d531f-008f-4500-ba4e-da89bd8c5837',
        'papaya',
        0.126,
        0.0378,
        10080.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'd6846dc8-ae5c-40ae-b29a-e2c098c16cee',
        'peach',
        0.02,
        0.006,
        3600.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '035166ea-10d9-4569-bdef-a6b362bd0d10',
        'pear',
        0.5,
        0.15,
        80000.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'fd5458ed-4f80-478e-a557-70602ea8e660',
        'pineapple',
        0.796,
        0.2388,
        79600.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '74fba3de-d8ab-4705-a138-90f5a44bb6a3',
        'pomegranate',
        0.125,
        0.0375,
        31250.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '690ef4f5-29b7-45d4-9680-f36cdda605b2',
        'pomelo',
        0.595,
        0.1785,
        71400.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    INSERT INTO acme_municipality_wide_fruits 
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '59ca1e72-54e3-40cd-9dd9-678c65722793',
        'sweet_orange',
        0.0,
        0.0,
        0.0,
        '2025-06-30 12:38:11',
        '2025-06-30 12:38:11'
    );
    

    END IF;
END
$$;

