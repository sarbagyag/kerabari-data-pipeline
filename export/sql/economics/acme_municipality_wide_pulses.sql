-- Generated SQL script
-- Date: 2025-06-30 12:37:51


-- Check if acme_municipality_wide_pulses table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wide_pulses'
    ) THEN
        -- Create the table
        CREATE TABLE acme_municipality_wide_pulses (
            id                   varchar(36)    not null primary key,
            pulse                varchar(100)   not null,
            production_in_tonnes numeric(10, 2) not null,
            sales_in_tonnes      numeric(10, 2) not null,
            revenue_in_rs        numeric(14, 2) not null,
            created_at           timestamp      default now(),
            updated_at           timestamp      default now()
        );
        
        ALTER TABLE acme_municipality_wide_pulses OWNER TO postgres;
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wide_pulses) THEN


    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '3c68d30b-0ceb-4ee8-803f-4130aeb47525',
        'bean',
        0.238,
        0.07139999999999999,
        20230.0,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'eac7a594-1c07-4f71-a4b4-35766686f8f4',
        'black_gram',
        8.991,
        2.6973,
        854145.0,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        'a29bbb68-a046-48e8-b5e7-7f30d0bf0421',
        'chickpea',
        0.085,
        0.025500000000000002,
        7650.000000000001,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '24abd527-2bd4-49dc-bcdc-8050830105a0',
        'horse_gram',
        0.15,
        0.045,
        10500.0,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '1854cc6f-751a-495b-9987-82afaa31d40c',
        'lentil',
        0.706,
        0.2118,
        84720.0,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '16596854-9b07-4063-9193-f3d9ddf84f61',
        'other',
        3.747,
        1.1240999999999999,
        299760.0,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '477d6903-d64e-41cb-ac2b-991a86f0e006',
        'pea',
        0.06,
        0.018,
        6600.0,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '0f6b1548-5443-4b64-8498-04f3ef1241e2',
        'pigeon_pea',
        0.273,
        0.0819,
        23205.0,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '3354cf5a-cd3e-4f99-80c8-005f78287109',
        'snake_bean',
        2.835,
        0.8504999999999999,
        226800.0,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    INSERT INTO acme_municipality_wide_pulses 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '49498d6e-22fa-4dd3-94ad-54e9d3b60804',
        'soyabean',
        12.269,
        3.6807,
        920175.0,
        '2025-06-30 12:37:51',
        '2025-06-30 12:37:51'
    );
    

    END IF;
END
$$;

