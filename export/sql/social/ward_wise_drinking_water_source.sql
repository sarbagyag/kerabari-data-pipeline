-- Generated SQL script
-- Date: 2025-06-22 11:44:36


-- Create enum type if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'drinking_water_source_type') THEN
        CREATE TYPE drinking_water_source_type AS ENUM (
            'TAP_INSIDE_HOUSE',
            'TAP_OUTSIDE_HOUSE',
            'TUBEWELL',
            'COVERED_WELL',
            'OPEN_WELL',
            'AQUIFIER_MOOL',
            'RIVER',
            'JAR',
            'OTHER'
        );
    END IF;
END
$$;

-- Check if ward_wise_drinking_water_source table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'ward_wise_drinking_water_source'
    ) THEN
        CREATE TABLE ward_wise_drinking_water_source (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            drinking_water_source drinking_water_source_type NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM ward_wise_drinking_water_source) THEN


    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '3d809374-f499-4bd1-8aa4-45650a839613',
        1,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        47,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'bc5c9604-320b-478a-8f1d-7a0e3e2982c8',
        1,
        'JAR'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'a7e77370-b56e-497f-ad52-709d6af617fb',
        1,
        'OPEN_WELL'::drinking_water_source_type,
        6,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '33f1db8e-f29d-46ce-b9c7-9ed57d8afe62',
        1,
        'OTHER'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '6b4e53f1-26ce-4788-acad-5323f409062e',
        1,
        'RIVER'::drinking_water_source_type,
        31,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '51896a70-60e6-49f4-be94-6a9a3dc7313c',
        1,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        166,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '607ff8ca-0d01-42b7-9900-2212ccc06427',
        1,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        439,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'bba0a38b-2104-4ae7-b934-d9ea97e12ca6',
        2,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        14,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '2c2cc3ae-cb01-4605-82b5-f25a3d2d0d28',
        2,
        'JAR'::drinking_water_source_type,
        2,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '5ec5b009-8737-4a98-b155-497eec61f622',
        2,
        'OPEN_WELL'::drinking_water_source_type,
        4,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'cf9bbcc7-4087-44bf-98cd-575a64a16f29',
        2,
        'OTHER'::drinking_water_source_type,
        2,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'b62ad458-d908-49ea-89b6-c1216053b21c',
        2,
        'RIVER'::drinking_water_source_type,
        6,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '8480a9fa-f652-4394-bb79-aecc9bbd546b',
        2,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        8,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '8a0c148d-f409-4c12-898e-8c4a4c33a6b3',
        2,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        798,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '69a96a1f-854d-430f-bf67-5a6651275da6',
        2,
        'TUBEWELL'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '3910d156-847c-4713-808f-e5d3466454d7',
        3,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        224,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'c4ccf050-92d5-4404-9a12-4428d2d3adff',
        3,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        261,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'fc40d580-2e57-41cc-901f-2199a3b3a05a',
        4,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        37,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '907cf5c5-27c9-4c72-89df-8f6c9c3e7278',
        4,
        'COVERED_WELL'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '4c0676e9-4f62-4bb8-a1b3-1896b5d01aab',
        4,
        'OPEN_WELL'::drinking_water_source_type,
        17,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '1f1ec574-29b5-43fc-a0fc-1b83b1b3176e',
        4,
        'RIVER'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'e6659262-7f0e-478f-9006-e909a7f12dfa',
        4,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        185,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'dd3870d1-af97-4f40-96f9-b81a86674493',
        4,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        479,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '191f7435-f774-4988-99b8-14e28bf6a4a0',
        5,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        2,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '7b695b89-5796-4d18-87a4-866b88f3fd9e',
        5,
        'COVERED_WELL'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '01e25d50-5863-44de-9c69-37c6d3e32d97',
        5,
        'OPEN_WELL'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '2fb95775-c8ab-4ee4-8ba1-77979384182a',
        5,
        'OTHER'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '2349e89e-11aa-4953-a72c-482093920098',
        5,
        'RIVER'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '9d2119d0-466f-4681-bd65-77bf8066f51c',
        5,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        5,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '117662a0-8cd6-49a4-a015-3873f45c2d2e',
        5,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        293,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '43a10a59-0e95-496e-82f6-25b0bb6277ad',
        6,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        407,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '046e4145-15c0-478c-b193-31e31e26d4e6',
        6,
        'COVERED_WELL'::drinking_water_source_type,
        3,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'eb05230c-0f5e-4f6d-a7a2-83656b57e591',
        6,
        'JAR'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '50706fa9-3c52-4766-b511-d8ddb86bf188',
        6,
        'OPEN_WELL'::drinking_water_source_type,
        56,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '6933ef9f-632d-4353-ab0f-5418864f1947',
        6,
        'OTHER'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '662c6e5b-5e34-46a1-8696-96730ad38d77',
        6,
        'RIVER'::drinking_water_source_type,
        65,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '6e72fa84-72bf-4598-b60e-519a45851b08',
        6,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        87,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'cbc1141b-0eab-4937-945d-6c5c1be0a657',
        6,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        338,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '7ed07e0c-488a-4743-aa41-fe7a68640171',
        6,
        'TUBEWELL'::drinking_water_source_type,
        1,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'e35fbe7e-b8a9-4d4e-b639-05c162544efb',
        7,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        4,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '4f2b7a98-d6c8-4106-9318-946f5786b560',
        7,
        'OPEN_WELL'::drinking_water_source_type,
        2,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '1033f681-1171-4bbb-a833-f8044fc6158c',
        7,
        'RIVER'::drinking_water_source_type,
        2,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'f869e8a0-4f50-4b13-9cfc-2c779cc5871f',
        7,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        14,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    INSERT INTO ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '4d65f595-c8c0-456e-a991-c2308d20e635',
        7,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        308,
        '2025-06-22 11:44:36',
        '2025-06-22 11:44:36'
    );
    

    END IF;
END
$$;

