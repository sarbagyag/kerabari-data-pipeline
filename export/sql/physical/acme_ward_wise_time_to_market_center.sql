-- Generated SQL script
-- Date: 2025-06-30 15:08:08


-- Check if acme_ward_wise_time_to_market_center table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'time_to_market_center_type'
    ) THEN
        CREATE TYPE time_to_market_center_type AS ENUM (
            'UNDER_15_MIN', 
            'UNDER_30_MIN', 
            'UNDER_1_HOUR', 
            '1_HOUR_OR_MORE'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_time_to_market_center'
    ) THEN
        CREATE TABLE acme_ward_wise_time_to_market_center (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            time_to_market_center time_to_market_center_type NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_time_to_market_center) THEN


    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '1f26ec60-88e3-412c-bf17-3ff97642e112',
        1,
        '1_HOUR_OR_MORE',
        321,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '4c65b711-8567-40c8-a892-4a6728381180',
        1,
        'UNDER_15_MIN',
        38,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'de7fd004-74a4-411d-8f50-284d3bf7ed3c',
        1,
        'UNDER_1_HOUR',
        50,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '3ded98f8-ba06-455d-839a-443d0a89ee16',
        1,
        'UNDER_30_MIN',
        29,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'e197e628-6086-4aa9-be04-a97872cdc0f7',
        2,
        '1_HOUR_OR_MORE',
        194,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '7b45cefa-fe8d-41ba-bcba-ba97fec871f3',
        2,
        'UNDER_15_MIN',
        2,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '65dda123-1355-4e43-b083-92888381a766',
        2,
        'UNDER_1_HOUR',
        1,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '5b2e9d57-2f48-41e9-8594-834583a76dd3',
        2,
        'UNDER_30_MIN',
        2,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'f1229939-258e-4026-9b6a-09d86b0d842e',
        3,
        '1_HOUR_OR_MORE',
        166,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '1116f662-34e5-4c17-bad1-f4f328843075',
        3,
        'UNDER_15_MIN',
        140,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'b7235d31-03ab-4ad2-8664-271a6777ca1c',
        3,
        'UNDER_1_HOUR',
        42,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '46ee7582-74c0-46d7-8c09-feca47a4fe92',
        3,
        'UNDER_30_MIN',
        309,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '0b0595a0-5391-4a31-a2bd-71948a9fcf3f',
        4,
        '1_HOUR_OR_MORE',
        352,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'c7ca14ca-9faf-47f7-bb81-52aa61c841db',
        4,
        'UNDER_15_MIN',
        2,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '216cdccf-0b40-4dec-84aa-f8a4251e4879',
        4,
        'UNDER_1_HOUR',
        1,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'c51834dc-c562-4d10-a7e8-092224335e45',
        5,
        '1_HOUR_OR_MORE',
        115,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'fb1aa8aa-2a3f-4105-8b6d-3a82086b52c4',
        5,
        'UNDER_15_MIN',
        90,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '9ea17a7b-51d7-4409-bd7f-207c63d08622',
        5,
        'UNDER_1_HOUR',
        366,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'b22a4303-7d13-4f1c-bcea-700e1b832d83',
        5,
        'UNDER_30_MIN',
        337,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '92665bcf-1375-404b-b42f-b33b6712a312',
        6,
        '1_HOUR_OR_MORE',
        11,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '308de118-42eb-4820-99e6-94f8a6c104ff',
        6,
        'UNDER_15_MIN',
        232,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '94bfccfe-68fa-448a-8711-16b1b238ccc0',
        6,
        'UNDER_1_HOUR',
        375,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '47e2b642-2cc3-4501-b10b-c0153803d189',
        6,
        'UNDER_30_MIN',
        396,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '624ab244-6877-45ff-a613-21fac041434a',
        7,
        '1_HOUR_OR_MORE',
        198,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '7086083b-4ab4-4c70-884b-97e7d4280507',
        7,
        'UNDER_15_MIN',
        87,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '8112110c-9c50-47d1-a6f3-b2a836fc0152',
        7,
        'UNDER_1_HOUR',
        125,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '52322bfb-085c-4f89-a258-ded154251037',
        7,
        'UNDER_30_MIN',
        444,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '334d278c-3714-42ae-91c0-0da687e30344',
        8,
        '1_HOUR_OR_MORE',
        1,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '0fb64c0c-a23d-4432-aad9-dd43f596643c',
        8,
        'UNDER_15_MIN',
        167,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '7aef31da-a60b-40bf-acb0-ca008926a411',
        8,
        'UNDER_1_HOUR',
        213,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '89a11bd9-e661-4a3f-adc8-1f48dd71a889',
        8,
        'UNDER_30_MIN',
        95,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'e1bfec57-dd42-4049-9978-d1d7ec792031',
        9,
        '1_HOUR_OR_MORE',
        230,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'f418d917-924c-40d0-a9ee-dc029868867e',
        9,
        'UNDER_15_MIN',
        456,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '49fbb390-3cad-4def-8cfa-bbeec6484598',
        9,
        'UNDER_1_HOUR',
        141,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '9229fe8a-c52a-463c-8e37-d37647b844d9',
        9,
        'UNDER_30_MIN',
        477,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        'bcc863a5-f328-4b6b-bc84-c7369eaf8d82',
        10,
        '1_HOUR_OR_MORE',
        7,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '559ed09c-474b-4ef4-acdb-2d8db15b9dfe',
        10,
        'UNDER_15_MIN',
        724,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '55b056ea-d8a7-4df2-ac18-8fbbea622f4d',
        10,
        'UNDER_1_HOUR',
        94,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    INSERT INTO acme_ward_wise_time_to_market_center 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '12df3ca4-fd7d-4e67-b3ee-332c52035576',
        10,
        'UNDER_30_MIN',
        83,
        '2025-06-30 15:08:08',
        '2025-06-30 15:08:08'
    );
    

    END IF;
END
$$;

