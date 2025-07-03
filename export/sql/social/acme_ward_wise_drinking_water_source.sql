-- Generated SQL script
-- Date: 2025-06-30 13:04:57


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

-- Check if acme_ward_wise_drinking_water_source table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_drinking_water_source'
    ) THEN
        CREATE TABLE acme_ward_wise_drinking_water_source (
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_drinking_water_source) THEN


    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '691caf29-26d1-48ed-84ad-d2857bf5dec2',
        1,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        1,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'ace904b8-a1f2-4201-b48a-a6e0a8a153c6',
        1,
        'COVERED_WELL'::drinking_water_source_type,
        1,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '76027458-333a-4b5b-a93d-35c6eb8beec7',
        1,
        'OPEN_WELL'::drinking_water_source_type,
        14,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '7f1d5251-24c5-4236-8905-4c9926374c63',
        1,
        'RIVER'::drinking_water_source_type,
        2,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'd4da0640-c761-43b6-8909-8f3bde22b247',
        1,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        86,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '71e4bf51-ca8f-49de-a52f-1d9793bf0a9e',
        1,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        330,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '022e84e4-79cc-4dff-9197-724a0f1d21fa',
        2,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        4,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '11c6c905-91a3-4ee5-9c98-5f26e316cd62',
        2,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        141,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '973ff1e1-b220-4aba-b604-0f60d059ad44',
        3,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        1,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'dd590582-934e-47bf-8fa1-d5ea873b1823',
        3,
        'JAR'::drinking_water_source_type,
        5,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '0863a404-5928-43ce-82aa-7b730a3374fc',
        3,
        'OPEN_WELL'::drinking_water_source_type,
        9,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'b54fe772-ec1a-4025-ad65-4ececfa378a5',
        3,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        259,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '3a592966-4e81-42f6-91de-40630a00a79a',
        3,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        397,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '04182d2b-183d-4bd9-8629-56d1b5a626e1',
        4,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        2,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '8a8c66a1-384e-48d3-8e31-b60e679a785c',
        4,
        'JAR'::drinking_water_source_type,
        1,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'ba64ab0c-fd66-458a-a3b8-89d5d9080986',
        4,
        'OPEN_WELL'::drinking_water_source_type,
        1,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'da519f5e-fb98-4876-a2d5-03b50c42ab09',
        4,
        'RIVER'::drinking_water_source_type,
        12,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '6a3dd39e-f820-4c80-9be9-f7b4c1531349',
        4,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        115,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '100737b5-8198-4aff-86f3-4a7894465abd',
        4,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        214,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '68b6a852-9300-46bf-b7ce-ad865a0d441f',
        5,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        26,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'd0f609a7-166a-4f9c-b218-3385c1ed77b0',
        5,
        'COVERED_WELL'::drinking_water_source_type,
        3,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '4813f94a-dc92-454d-b47d-98074785ec04',
        5,
        'OPEN_WELL'::drinking_water_source_type,
        40,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'a0eeb3bb-b9a0-4746-8660-fa7c5c35c559',
        5,
        'RIVER'::drinking_water_source_type,
        10,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '79948cf2-ea91-4aba-82c0-bfab29643ffe',
        5,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        144,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'd3ad1e94-0ec4-4f92-8812-961391c89216',
        5,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        730,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'bcb2e467-01c9-4272-aad0-03a9b7c12524',
        6,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        343,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '6e6f4c59-dacf-4cf1-8d6e-069656361c54',
        6,
        'OPEN_WELL'::drinking_water_source_type,
        2,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '84432567-539f-4217-910c-80f289a7a07d',
        6,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        358,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '97bc0706-ac46-4b9a-b0f1-101bf00df9f9',
        6,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        534,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'bde7f7a7-a943-43c6-8ea2-afae1328c8c2',
        6,
        'TUBEWELL'::drinking_water_source_type,
        1,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '97a55224-2f0d-4b17-a9d8-3803a7c39e19',
        7,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        72,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '1a7abbd3-2992-4bbb-9517-740cbff0724a',
        7,
        'JAR'::drinking_water_source_type,
        1,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'd35237dd-bb82-4128-934f-ee9c3c9cc50e',
        7,
        'OPEN_WELL'::drinking_water_source_type,
        16,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '0f9537f6-e949-4ad3-916c-f292eeb5be43',
        7,
        'RIVER'::drinking_water_source_type,
        9,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '7e7514e3-82a1-47d0-a648-d7cecbdd247b',
        7,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        32,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '02cd8bc6-7c07-41fa-8dfa-4c1103194629',
        7,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        706,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '8c857fac-0f3e-47ef-894d-0ac4f04a1e21',
        8,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        414,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '18202967-c200-40ce-9750-469d7e6c5d45',
        8,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        180,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '6557e2ec-5655-4092-8b9f-55c5d0c4f0a2',
        9,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        273,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'b15ced90-d549-4844-8a35-6d19b4fdddbb',
        9,
        'COVERED_WELL'::drinking_water_source_type,
        1,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'fc6ab28f-1ad6-4718-adb9-34eb3b002e15',
        9,
        'JAR'::drinking_water_source_type,
        7,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'e654ee8f-b5d2-4f17-9f59-ef7a7a59352f',
        9,
        'OPEN_WELL'::drinking_water_source_type,
        48,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'fbf39d72-5cdd-49f9-bd81-bf1886327886',
        9,
        'RIVER'::drinking_water_source_type,
        2,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '6315098e-b417-416e-8b63-1870b10e1b43',
        9,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        109,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '3b89a89d-0d80-49d3-ba13-61cf4781976c',
        9,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        752,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'c1d1fae1-1c10-4ad2-a810-ae264084e305',
        9,
        'TUBEWELL'::drinking_water_source_type,
        311,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'a57d6284-f1fe-4c12-a193-c022f4bbb52f',
        10,
        'AQUIFIER_MOOL'::drinking_water_source_type,
        5,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '33019e43-432f-4662-a504-9ce299e2ccca',
        10,
        'JAR'::drinking_water_source_type,
        79,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'e213879e-a8e7-4adc-9bb5-6489d948e0d6',
        10,
        'TAP_INSIDE_HOUSE'::drinking_water_source_type,
        219,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        'aec39c2c-5d98-485b-b2f4-73c06a4a2a31',
        10,
        'TAP_OUTSIDE_HOUSE'::drinking_water_source_type,
        668,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    INSERT INTO acme_ward_wise_drinking_water_source 
    (id, ward_number, drinking_water_source, households, created_at, updated_at)
    VALUES (
        '96abae2a-bca3-440c-85db-6d9722e5f092',
        10,
        'TUBEWELL'::drinking_water_source_type,
        3,
        '2025-06-30 13:04:57',
        '2025-06-30 13:04:57'
    );
    

    END IF;
END
$$;

