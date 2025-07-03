-- Generated SQL script
-- Date: 2025-06-30 11:44:34


-- Set UTF-8 encoding for this script
SET client_encoding = 'UTF8';

-- Create age_group enum type if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'age_group') THEN
        CREATE TYPE age_group AS ENUM (
            'AGE_0_4',
            'AGE_5_9',
            'AGE_10_14',
            'AGE_15_19',
            'AGE_20_24',
            'AGE_25_29',
            'AGE_30_34',
            'AGE_35_39',
            'AGE_40_44',
            'AGE_45_49',
            'AGE_50_54',
            'AGE_55_59',
            'AGE_60_64',
            'AGE_65_69',
            'AGE_70_74',
            'AGE_75_AND_ABOVE'
        );
    END IF;
END
$$;

-- Create gender enum type if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'gender') THEN
        CREATE TYPE gender AS ENUM (
            'MALE',
            'FEMALE',
            'OTHER'
        );
    END IF;
END
$$;

-- Check if acme_ward_age_wise_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_age_wise_population'
    ) THEN
        CREATE TABLE acme_ward_age_wise_population (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            age_group age_group NOT NULL,
            gender gender NOT NULL,
            population INTEGER NOT NULL DEFAULT 0,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
        
        -- Create indexes for faster lookups
        CREATE INDEX idx_ward_age_gender ON acme_ward_age_wise_population(ward_number, age_group, gender);
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_age_wise_population) THEN


    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'dd9e929b-c616-4d3d-9713-ff0927d70d2a',
        1,
        'AGE_0_4',
        'FEMALE',
        71,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fef85b4f-1d60-4516-8fcb-a4fd461673e5',
        1,
        'AGE_0_4',
        'MALE',
        67,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1970831e-a73b-44e6-9d6b-3c279116cebf',
        1,
        'AGE_10_14',
        'FEMALE',
        90,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '42711dfa-5a46-4816-80df-beeaea87c36a',
        1,
        'AGE_10_14',
        'MALE',
        92,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6392c272-ce34-4bec-8e1b-e459e4fc5aef',
        1,
        'AGE_15_19',
        'FEMALE',
        88,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'bcd71147-c047-40d4-a069-e5aba74bbe98',
        1,
        'AGE_15_19',
        'MALE',
        106,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '5b3a9ea7-d560-4d38-93dd-f7f163d9da1f',
        1,
        'AGE_20_24',
        'FEMALE',
        101,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a6beddd8-c305-4a97-8e05-e92b931abd10',
        1,
        'AGE_20_24',
        'MALE',
        104,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0790bdb2-2765-4a43-80e9-03f67aaa1a52',
        1,
        'AGE_25_29',
        'FEMALE',
        116,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fd449c42-b617-4a5f-b194-e99e349d68af',
        1,
        'AGE_25_29',
        'MALE',
        121,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b66dea4a-ded6-477e-8a26-308c5f89eae3',
        1,
        'AGE_30_34',
        'FEMALE',
        98,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0ddf317f-3317-40f0-aaed-6acb8d5eaf2b',
        1,
        'AGE_30_34',
        'MALE',
        113,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '11256481-8b5c-40db-8477-36a35d881f96',
        1,
        'AGE_35_39',
        'FEMALE',
        49,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'aec4e35b-3fc3-4a70-98eb-607b94192e6f',
        1,
        'AGE_35_39',
        'MALE',
        64,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f52ef0d1-2ed8-47cd-8c30-c0437601f3f1',
        1,
        'AGE_40_44',
        'FEMALE',
        86,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'dc2027d4-c3a0-4a16-b93a-2227aea6826b',
        1,
        'AGE_40_44',
        'MALE',
        76,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6453bcc0-8542-4a01-96b5-b6528acd3711',
        1,
        'AGE_45_49',
        'FEMALE',
        57,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6a943c94-5079-4e09-8689-48221044007e',
        1,
        'AGE_45_49',
        'MALE',
        51,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '9b2689fd-9ca7-4988-a9d5-80f3e76b2519',
        1,
        'AGE_50_54',
        'FEMALE',
        51,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '5b56207d-bc70-45a0-94a8-75a0349cb992',
        1,
        'AGE_50_54',
        'MALE',
        45,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7e849c3b-3056-43e3-afaf-ca8c0f5f99e4',
        1,
        'AGE_55_59',
        'FEMALE',
        38,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0929be52-f3a3-4b74-8d3f-c29ca4770576',
        1,
        'AGE_55_59',
        'MALE',
        42,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fe88ff67-22cd-4fd3-b5e4-7415fb686e71',
        1,
        'AGE_5_9',
        'FEMALE',
        68,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2cd78416-06a6-44c1-9538-ec09cc9218eb',
        1,
        'AGE_5_9',
        'MALE',
        82,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '151919ef-a48c-4a4f-bbd8-9473399fae2c',
        1,
        'AGE_60_64',
        'FEMALE',
        43,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1eb6202c-c007-4d0f-b6df-67b50affe89b',
        1,
        'AGE_60_64',
        'MALE',
        45,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2f19dd44-68bb-41cd-9832-2d637a01d14b',
        1,
        'AGE_65_69',
        'FEMALE',
        25,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fa9c54a2-63ee-404d-89d0-534170365db6',
        1,
        'AGE_65_69',
        'MALE',
        20,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '731434c5-3712-406c-99b7-7bb191da18b0',
        1,
        'AGE_70_74',
        'FEMALE',
        25,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4a88aa81-4d04-4e6b-82a5-533d374b84e8',
        1,
        'AGE_70_74',
        'MALE',
        28,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7abe2d5b-325a-4802-aeba-7a53f62f7614',
        1,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        43,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4f33c1d4-561f-4758-b6e9-91b7e401cfcb',
        1,
        'AGE_75_AND_ABOVE',
        'MALE',
        31,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6cbeefc8-fcad-42a0-9dc9-666ac2839125',
        2,
        'AGE_0_4',
        'FEMALE',
        21,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6a652e64-c566-45ee-96f6-7a483f9a4fde',
        2,
        'AGE_0_4',
        'MALE',
        141,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0999a198-c5d8-4bc8-95eb-45795abf76bc',
        2,
        'AGE_10_14',
        'FEMALE',
        47,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '975e71bf-0294-4e34-a865-356a1488331d',
        2,
        'AGE_10_14',
        'MALE',
        110,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c8a93d65-4e7d-4af8-baf4-83efdab44859',
        2,
        'AGE_15_19',
        'FEMALE',
        59,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '389c2ca5-ae9b-4e1c-bfab-f8906170ace8',
        2,
        'AGE_15_19',
        'MALE',
        155,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8d4a4989-559d-4a77-be0b-d7a8b64e82a3',
        2,
        'AGE_20_24',
        'FEMALE',
        84,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd814b281-6c98-45c0-8ca2-f3a485526ea5',
        2,
        'AGE_20_24',
        'MALE',
        141,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '83533837-9f69-47d4-8b09-65af8122332d',
        2,
        'AGE_25_29',
        'FEMALE',
        114,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '44da9490-62c7-4166-b52c-749c4e0dcb90',
        2,
        'AGE_25_29',
        'MALE',
        130,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8e8d76ea-dce5-42dd-a477-dd09633d28d9',
        2,
        'AGE_30_34',
        'FEMALE',
        135,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd748f448-195b-4cf2-981d-b9090db53c12',
        2,
        'AGE_30_34',
        'MALE',
        98,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6ff52f8c-ce9d-4d3d-ad1b-594652124fd1',
        2,
        'AGE_35_39',
        'FEMALE',
        123,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '43da0c19-e1a3-45ce-b0bb-e5d211661e59',
        2,
        'AGE_35_39',
        'MALE',
        64,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f8f95590-7d2b-48bc-9b50-9f8c34d0da39',
        2,
        'AGE_40_44',
        'FEMALE',
        134,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '38511b76-24ff-4cf0-a884-9c44eae668af',
        2,
        'AGE_40_44',
        'MALE',
        42,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7744e8fb-bb48-49e3-bc6e-48bce7cc727f',
        2,
        'AGE_45_49',
        'FEMALE',
        91,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'bcbe494c-fa16-41ce-860a-c607863ce0ac',
        2,
        'AGE_45_49',
        'MALE',
        27,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd7bc387e-7d95-4c66-b666-50db84d1eb12',
        2,
        'AGE_50_54',
        'FEMALE',
        46,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '210de6e5-79f6-4479-9a1c-0c4522a2699d',
        2,
        'AGE_50_54',
        'MALE',
        30,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6051dfa6-1206-443b-825f-9b54e5d72222',
        2,
        'AGE_55_59',
        'FEMALE',
        30,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'cce3ecdc-026f-4079-aea4-5bbd76cbc229',
        2,
        'AGE_55_59',
        'MALE',
        18,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '5f01eeb7-9e9d-48a8-a536-0cda472a7a66',
        2,
        'AGE_5_9',
        'FEMALE',
        37,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'de305c21-b8e8-44d8-a6bb-8b6ea54c759a',
        2,
        'AGE_5_9',
        'MALE',
        84,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'efa78e95-9e89-4efa-b8ab-f41034814f74',
        2,
        'AGE_60_64',
        'FEMALE',
        44,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '823275ae-a572-4554-91fb-519a9987a531',
        2,
        'AGE_60_64',
        'MALE',
        21,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd043d7c8-f295-4886-9697-6aef1ed016aa',
        2,
        'AGE_65_69',
        'FEMALE',
        34,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2bf43884-6775-428f-b484-2290b19ccf00',
        2,
        'AGE_65_69',
        'MALE',
        16,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0709da45-949e-4a3a-bd08-cbca2924dcb6',
        2,
        'AGE_70_74',
        'FEMALE',
        38,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e01d9655-4cd5-4f32-b43e-4a842daad8d3',
        2,
        'AGE_70_74',
        'MALE',
        8,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4ad64589-0993-4289-8424-34840a7ca762',
        2,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        123,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '57854058-c532-4f12-80a6-e87dcc839d67',
        2,
        'AGE_75_AND_ABOVE',
        'MALE',
        8,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '68ad8282-30a1-4152-85c6-540aaf74ee47',
        3,
        'AGE_0_4',
        'FEMALE',
        83,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8dadb669-6135-4dee-a9b8-fa1fdb54815f',
        3,
        'AGE_0_4',
        'MALE',
        141,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0bb0fd00-04af-49eb-8b73-8c096508720a',
        3,
        'AGE_0_4',
        'OTHER',
        4,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e2602cdc-9c62-4a43-9688-8e2088281849',
        3,
        'AGE_10_14',
        'FEMALE',
        132,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e8403a24-d780-4b19-8777-bae6ab88f353',
        3,
        'AGE_10_14',
        'MALE',
        137,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4065093c-fce4-4217-ae41-f11db05591d1',
        3,
        'AGE_15_19',
        'FEMALE',
        147,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0140c600-8a29-4e6d-a378-29fcb9a74883',
        3,
        'AGE_15_19',
        'MALE',
        150,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ac867fc5-ab57-4a49-bb7a-63b2e254ee4a',
        3,
        'AGE_20_24',
        'FEMALE',
        147,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f18abdf5-e703-4259-8f01-380a9263ceb0',
        3,
        'AGE_20_24',
        'MALE',
        167,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'df77e2aa-dd61-40d7-b273-f1e241a408e9',
        3,
        'AGE_25_29',
        'FEMALE',
        186,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '69935fd7-b954-42ba-af9a-47744d9e0958',
        3,
        'AGE_25_29',
        'MALE',
        139,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b29b5ff7-fa52-4abf-be38-0b194bf788a9',
        3,
        'AGE_30_34',
        'FEMALE',
        136,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'bfca2444-7775-4651-a9be-4c06dad71602',
        3,
        'AGE_30_34',
        'MALE',
        184,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8671d8cc-3300-4aa4-a10a-f2da591d377b',
        3,
        'AGE_35_39',
        'FEMALE',
        150,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a564d7c4-6bf0-4be6-a209-f22125fc6259',
        3,
        'AGE_35_39',
        'MALE',
        131,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ed56a191-deda-445e-8ef4-1c5b38c25836',
        3,
        'AGE_40_44',
        'FEMALE',
        147,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b92c49b0-1c4c-44e1-9d1d-ab2c95da2e14',
        3,
        'AGE_40_44',
        'MALE',
        133,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '08fd9325-2c41-414d-a5b8-0a4b35b37f3f',
        3,
        'AGE_45_49',
        'FEMALE',
        127,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3dbbad0f-2a5e-48d3-b3db-117a64753e28',
        3,
        'AGE_45_49',
        'MALE',
        74,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '69d19f17-b882-4107-a6ae-7705b62bd2a4',
        3,
        'AGE_50_54',
        'FEMALE',
        84,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '249017a6-c104-441b-b5f7-ae5237d2e8ce',
        3,
        'AGE_50_54',
        'MALE',
        72,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6ea44f02-6cef-4f28-a139-d8249b6104f8',
        3,
        'AGE_55_59',
        'FEMALE',
        89,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4d808076-ec4b-417d-850d-6e488fbc3c51',
        3,
        'AGE_55_59',
        'MALE',
        74,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '475949b7-42b4-41ea-a06d-44f9f70b8a2e',
        3,
        'AGE_5_9',
        'FEMALE',
        122,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7e559fe6-a6a2-48e9-9a1f-5daa306b3169',
        3,
        'AGE_5_9',
        'MALE',
        137,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '672290be-c0d8-486d-bc08-06883e130e8d',
        3,
        'AGE_60_64',
        'FEMALE',
        77,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4e49835b-7682-43e8-935a-95c1364854b0',
        3,
        'AGE_60_64',
        'MALE',
        58,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0b007c53-0be7-4f50-bb95-15247cb51da6',
        3,
        'AGE_65_69',
        'FEMALE',
        55,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e1388556-3a23-40e1-b475-a79e0d1bc5d1',
        3,
        'AGE_65_69',
        'MALE',
        31,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '47555437-d45c-45bc-9c32-483afa280018',
        3,
        'AGE_70_74',
        'FEMALE',
        45,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fd866d26-386e-4ba4-89a3-d6ec146197e8',
        3,
        'AGE_70_74',
        'MALE',
        39,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7c1c9292-d313-45f9-b17a-8a740b0b79cd',
        3,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        65,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '5ac83948-2df1-4d94-8fa2-0af6a238d14c',
        3,
        'AGE_75_AND_ABOVE',
        'MALE',
        26,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'edf1d8a5-ba92-4ec5-8905-9a72391b2582',
        4,
        'AGE_0_4',
        'FEMALE',
        56,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '15bb4750-ca82-48d9-9f20-a2ea9a7dbf36',
        4,
        'AGE_0_4',
        'MALE',
        58,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '363cc404-56ea-430f-aafb-465e5b471592',
        4,
        'AGE_10_14',
        'FEMALE',
        84,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd0119c82-158b-4c38-bfb2-01d0ee580ce1',
        4,
        'AGE_10_14',
        'MALE',
        71,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '70bd5104-918d-421e-b591-ef8f4ee04010',
        4,
        'AGE_15_19',
        'FEMALE',
        91,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7efdf14f-a6e4-46eb-beef-28c41fa947d1',
        4,
        'AGE_15_19',
        'MALE',
        62,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e24c516e-a74a-4b65-a44f-7bbc46ef87a8',
        4,
        'AGE_20_24',
        'FEMALE',
        86,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '57fcc623-e75a-4dd9-a486-e3e398b5abea',
        4,
        'AGE_20_24',
        'MALE',
        83,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '61b1ece5-cb9c-47c6-a635-e6bdac64d70e',
        4,
        'AGE_25_29',
        'FEMALE',
        77,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '46336894-ab3a-4d34-9939-fbc8c627939c',
        4,
        'AGE_25_29',
        'MALE',
        102,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2f6ca952-1c18-4482-8cfc-2a59e15bff41',
        4,
        'AGE_30_34',
        'FEMALE',
        58,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a6781071-f5a7-4f82-af85-07888e0b5b77',
        4,
        'AGE_30_34',
        'MALE',
        82,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b08ab32d-e790-4627-9b3e-5fb28a55bc39',
        4,
        'AGE_35_39',
        'FEMALE',
        59,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6799351e-7a98-4ab5-ae7e-f932e67a23d3',
        4,
        'AGE_35_39',
        'MALE',
        50,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6bf94f00-6912-455b-a1aa-fc21f9417966',
        4,
        'AGE_40_44',
        'FEMALE',
        47,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8da1ba9a-828e-4938-823a-a1e266e0e37b',
        4,
        'AGE_40_44',
        'MALE',
        57,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6ac93044-a8bb-48ea-9f3b-463af5a2815e',
        4,
        'AGE_45_49',
        'FEMALE',
        47,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3d89d91a-0e4d-4a06-9c52-d7a6fcf06150',
        4,
        'AGE_45_49',
        'MALE',
        38,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8d7c9774-c775-4bd5-9ded-eca6bb010ce3',
        4,
        'AGE_50_54',
        'FEMALE',
        52,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1272c999-da99-4614-89c3-639940d1301e',
        4,
        'AGE_50_54',
        'MALE',
        40,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a65c1ddf-c5b6-4ac9-b3f0-d74ed3c2b78d',
        4,
        'AGE_55_59',
        'FEMALE',
        46,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c9738196-74f1-4df9-8dce-988d42717c3b',
        4,
        'AGE_55_59',
        'MALE',
        45,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '84dcda48-bd35-4b8b-aac6-62cce4a0329a',
        4,
        'AGE_5_9',
        'FEMALE',
        69,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0d150bbf-f5da-4b19-9311-0064ee0502bc',
        4,
        'AGE_5_9',
        'MALE',
        64,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0d937b34-eed3-4c2d-a78f-9cd459a00c63',
        4,
        'AGE_60_64',
        'FEMALE',
        36,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2a2df525-c8d5-4096-b4c2-6c64edeca649',
        4,
        'AGE_60_64',
        'MALE',
        42,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '80666c3c-4f2e-40f8-9c6e-281e24eb0fa2',
        4,
        'AGE_65_69',
        'FEMALE',
        22,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '19bb0e38-4090-4bac-81cd-1184018c4ebd',
        4,
        'AGE_65_69',
        'MALE',
        30,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f6ca0e02-fd27-4018-9d9b-16c64c883372',
        4,
        'AGE_70_74',
        'FEMALE',
        13,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2349d2c3-772b-4551-892f-477aa47d9b0a',
        4,
        'AGE_70_74',
        'MALE',
        16,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '5d95515f-586a-464a-8495-422815701bb2',
        4,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        25,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ad35b2ad-71cb-4a8d-98c7-1aea70880e38',
        4,
        'AGE_75_AND_ABOVE',
        'MALE',
        21,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '08cb8fc3-f129-4770-a556-05010454a27b',
        5,
        'AGE_0_4',
        'FEMALE',
        97,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '447a8c97-a614-43c9-86b6-8798e65642bb',
        5,
        'AGE_0_4',
        'MALE',
        114,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6d0b0d51-2b34-4302-9502-877ac78f533e',
        5,
        'AGE_10_14',
        'FEMALE',
        155,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f9884725-767e-4c44-8101-5a05b462d357',
        5,
        'AGE_10_14',
        'MALE',
        160,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6b3dba5b-77bd-4dd1-bd5c-41799d2e62bb',
        5,
        'AGE_15_19',
        'FEMALE',
        165,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd320a90e-6d41-42fe-81eb-03b39090d144',
        5,
        'AGE_15_19',
        'MALE',
        160,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '92b7dcb1-ebe0-427d-a9ee-68951593c71e',
        5,
        'AGE_20_24',
        'FEMALE',
        214,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '30ae5586-b62e-4ab5-bc6f-6faa667e8534',
        5,
        'AGE_20_24',
        'MALE',
        201,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1b2157c1-b2d2-4429-bc28-4e08f098494a',
        5,
        'AGE_25_29',
        'FEMALE',
        216,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '9cdbb945-ee47-46ba-bc4b-1d51b7155d8a',
        5,
        'AGE_25_29',
        'MALE',
        214,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7af5de5c-96a7-428a-8e8d-83f7d2386b10',
        5,
        'AGE_30_34',
        'FEMALE',
        185,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e4fd9d4c-1fd2-462a-8fa2-714603d31f03',
        5,
        'AGE_30_34',
        'MALE',
        215,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3b4e58d2-be91-48e9-bfb1-fcde5c4815f4',
        5,
        'AGE_35_39',
        'FEMALE',
        179,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '07996fd3-197f-4000-891d-24df986a6eba',
        5,
        'AGE_35_39',
        'MALE',
        155,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a4295dad-f760-4eee-9a66-0ac953541ffc',
        5,
        'AGE_40_44',
        'FEMALE',
        152,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'cd9e39d7-f3d0-43c4-bc59-b250356b3e0e',
        5,
        'AGE_40_44',
        'MALE',
        162,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0202c9cb-a4fe-4efe-895f-f296cb5f6ba6',
        5,
        'AGE_45_49',
        'FEMALE',
        144,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7bd376bd-86da-4621-a77d-f20d910abd84',
        5,
        'AGE_45_49',
        'MALE',
        133,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '09be0e5f-75e8-4b1f-8c18-b9b5e079c7b5',
        5,
        'AGE_50_54',
        'FEMALE',
        101,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0f5281bc-21d8-4929-a972-ae01bae6736f',
        5,
        'AGE_50_54',
        'MALE',
        106,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8ff41102-64d1-41b8-b961-b5d90784c6ce',
        5,
        'AGE_55_59',
        'FEMALE',
        105,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '35f08ee1-fbf4-46f6-82b7-bb1174f26c0e',
        5,
        'AGE_55_59',
        'MALE',
        105,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '90e47c49-91ba-4f76-a98e-0f31f71dcf02',
        5,
        'AGE_5_9',
        'FEMALE',
        142,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f7779c6e-8c41-49fb-b259-a24777249c47',
        5,
        'AGE_5_9',
        'MALE',
        135,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a58d5c5b-ed0e-4152-85bd-4b07692616e5',
        5,
        'AGE_60_64',
        'FEMALE',
        80,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '749f426a-5e05-4c71-b30f-6ac16afce917',
        5,
        'AGE_60_64',
        'MALE',
        67,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6514dea5-17b8-42c1-9fdc-10d037870f82',
        5,
        'AGE_65_69',
        'FEMALE',
        51,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd68677e3-d473-466d-822e-a21f04981f6e',
        5,
        'AGE_65_69',
        'MALE',
        52,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '246aa068-99cf-481a-94f0-438bb64a53d1',
        5,
        'AGE_70_74',
        'FEMALE',
        54,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0a309405-5d64-4eaa-aeec-77bfeefeb9b0',
        5,
        'AGE_70_74',
        'MALE',
        45,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd5dd6d3c-e915-4663-8725-9e8d7eaa5600',
        5,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        70,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '16514e09-cf92-40fe-acc6-9a3295af669d',
        5,
        'AGE_75_AND_ABOVE',
        'MALE',
        59,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0c5c731f-6b18-4c2f-9c78-d971275d31bd',
        6,
        'AGE_0_4',
        'FEMALE',
        111,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '43e2c3f6-0c53-472d-acbc-914915ad97da',
        6,
        'AGE_0_4',
        'MALE',
        96,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fc8c7298-658a-45ba-a72a-7ed5567f12ea',
        6,
        'AGE_0_4',
        'OTHER',
        7,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c5e68250-8334-40b7-ab7e-58f3c1162413',
        6,
        'AGE_10_14',
        'FEMALE',
        194,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '180cb9e1-5421-41f6-bcf0-dc0869a3b95f',
        6,
        'AGE_10_14',
        'MALE',
        154,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'eee07b45-8d39-41c4-acf8-9b5761b38ac0',
        6,
        'AGE_15_19',
        'FEMALE',
        192,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'baed6846-a80f-4a93-9d77-a57c0e9fa0ff',
        6,
        'AGE_15_19',
        'MALE',
        159,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e77955b5-2001-4571-a251-aa8a1ccffcda',
        6,
        'AGE_20_24',
        'FEMALE',
        195,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '428df2a4-955d-4d71-b9dd-545011ae41e8',
        6,
        'AGE_20_24',
        'MALE',
        219,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '81c9169f-3539-4ec2-a80c-6ad091b0bbef',
        6,
        'AGE_25_29',
        'FEMALE',
        200,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '11f6dbdf-759d-4c31-80f8-edbafefcd057',
        6,
        'AGE_25_29',
        'MALE',
        155,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '5db13ba8-17c7-4afb-ae79-f96547d811bb',
        6,
        'AGE_30_34',
        'FEMALE',
        182,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8f74a5d1-c967-45a1-a121-7e65743fffd7',
        6,
        'AGE_30_34',
        'MALE',
        190,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f331378a-dab3-4f01-96d2-47669d9db2e2',
        6,
        'AGE_35_39',
        'FEMALE',
        139,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7909cd43-dbc8-49a7-93db-3a912a25d5a4',
        6,
        'AGE_35_39',
        'MALE',
        160,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '30a53d4f-9348-4beb-a88d-d65eb278f4cb',
        6,
        'AGE_40_44',
        'FEMALE',
        157,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '66ce0601-0ebb-40de-86b7-1251bf99828e',
        6,
        'AGE_40_44',
        'MALE',
        144,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '17f8a03f-ef6a-473e-9895-b15eb235527d',
        6,
        'AGE_45_49',
        'FEMALE',
        126,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '13bcb228-7083-4168-8c41-664f34bbb259',
        6,
        'AGE_45_49',
        'MALE',
        120,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c019e359-6d5b-4fb5-88b6-f0ee782caa6e',
        6,
        'AGE_50_54',
        'FEMALE',
        104,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b03beda4-dde8-4d20-b57d-ce8195bbc9e4',
        6,
        'AGE_50_54',
        'MALE',
        113,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'efaebca7-5fa9-4a21-840f-bb4c73ef0fd6',
        6,
        'AGE_55_59',
        'FEMALE',
        106,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '28a088d1-2d02-4b53-a445-1828c14b8c86',
        6,
        'AGE_55_59',
        'MALE',
        87,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '259ba222-efcc-43a7-bdec-4bd7584e60d9',
        6,
        'AGE_5_9',
        'FEMALE',
        150,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a4aadf5b-30f0-470f-94e6-e5d357f44289',
        6,
        'AGE_5_9',
        'MALE',
        163,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '120f7548-5c52-4827-8975-b76193cffec1',
        6,
        'AGE_5_9',
        'OTHER',
        1,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3f6bde97-2ace-4d9c-b4bc-d5d6530171b2',
        6,
        'AGE_60_64',
        'FEMALE',
        73,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e5ea50d9-1694-4120-bee6-08ba900ba8e0',
        6,
        'AGE_60_64',
        'MALE',
        90,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd19d2d46-e8fb-4388-b8ea-2336ec18c2ca',
        6,
        'AGE_65_69',
        'FEMALE',
        66,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '019da785-6e6f-4013-b201-05c0c68a3312',
        6,
        'AGE_65_69',
        'MALE',
        54,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b594099a-875e-42aa-b3eb-f887e5819314',
        6,
        'AGE_70_74',
        'FEMALE',
        58,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7af2248d-cff5-4c45-9db1-857730c6050f',
        6,
        'AGE_70_74',
        'MALE',
        38,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '725310a2-b3ca-4ddc-9030-d43a9a0ad0d9',
        6,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        72,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2f48747f-cb66-40ec-bf9f-60d181439260',
        6,
        'AGE_75_AND_ABOVE',
        'MALE',
        63,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8dbc3400-d6b5-4e04-aaca-b95a124f880c',
        7,
        'AGE_0_4',
        'FEMALE',
        85,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '35372dce-0c13-4068-b9b8-6399a71146d0',
        7,
        'AGE_0_4',
        'MALE',
        106,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '349acbca-971c-4ac0-b192-b4617e3f5543',
        7,
        'AGE_10_14',
        'FEMALE',
        190,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'cb1788b2-02f1-415c-8497-4d9ec4796d91',
        7,
        'AGE_10_14',
        'MALE',
        168,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ac32c83e-e7bd-40d5-b42b-c6089008cace',
        7,
        'AGE_15_19',
        'FEMALE',
        208,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '273e5b4e-e567-44e4-a784-5a688a171773',
        7,
        'AGE_15_19',
        'MALE',
        155,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fbe2f49e-aea0-4918-aa9b-f8c14bf69ba8',
        7,
        'AGE_20_24',
        'FEMALE',
        259,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'dcd0e806-68f9-4bdc-8c9f-ee867d361363',
        7,
        'AGE_20_24',
        'MALE',
        170,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c18e5df4-5561-4ad9-ad4b-63bab54fad2d',
        7,
        'AGE_25_29',
        'FEMALE',
        204,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '249c3e7f-43ca-46ca-bf30-de9c879a7a4b',
        7,
        'AGE_25_29',
        'MALE',
        211,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e74d0a6e-0fc9-4758-8d38-31294f378d75',
        7,
        'AGE_30_34',
        'FEMALE',
        177,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6113ade4-a5f1-4a2c-9822-0646a13ea85f',
        7,
        'AGE_30_34',
        'MALE',
        175,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c96eb141-86ad-48ae-916f-86e0734f55db',
        7,
        'AGE_35_39',
        'FEMALE',
        183,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '60c8d843-1f89-4b65-8d94-dff7029e5489',
        7,
        'AGE_35_39',
        'MALE',
        146,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '9bb61279-fe83-4910-bb25-855ca743dbc5',
        7,
        'AGE_40_44',
        'FEMALE',
        150,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '51c86c7e-2991-41a7-92cd-1ddc12801af3',
        7,
        'AGE_40_44',
        'MALE',
        150,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '322cc676-113a-4023-9eb9-f7d7f247bc3d',
        7,
        'AGE_45_49',
        'FEMALE',
        117,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7d714256-ddee-43fb-b2ea-a9bff876a1f7',
        7,
        'AGE_45_49',
        'MALE',
        142,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '035a4e1e-a2ed-4139-85c0-b4df0d250793',
        7,
        'AGE_50_54',
        'FEMALE',
        104,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0b90f1ac-be89-4a3e-93a1-1d2d2fff5dae',
        7,
        'AGE_50_54',
        'MALE',
        96,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2a869e05-c26c-4f32-a6a5-600f46978b6f',
        7,
        'AGE_55_59',
        'FEMALE',
        110,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '110548e0-b3d0-4e80-a1ba-9f678bed14c2',
        7,
        'AGE_55_59',
        'MALE',
        100,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'cb82ce98-866a-4a8d-ad89-f658aefd2770',
        7,
        'AGE_5_9',
        'FEMALE',
        142,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'cb3cce1d-f35c-493f-a0aa-55eb64fec3a8',
        7,
        'AGE_5_9',
        'MALE',
        165,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '719076d8-4b36-46dc-862c-4f3bd6a5902b',
        7,
        'AGE_60_64',
        'FEMALE',
        78,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '423bf5db-8dc6-4f3e-909f-ccd8806e5f58',
        7,
        'AGE_60_64',
        'MALE',
        74,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c168f093-aed1-4358-a19c-5afba96ea7ed',
        7,
        'AGE_65_69',
        'FEMALE',
        62,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'afc90b37-de38-4133-be02-a7839a90ffa0',
        7,
        'AGE_65_69',
        'MALE',
        48,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b1457532-a1f5-4418-af87-3a2315f640a0',
        7,
        'AGE_70_74',
        'FEMALE',
        53,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1b7caae7-33de-4de3-9c89-8703cd0bc491',
        7,
        'AGE_70_74',
        'MALE',
        47,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '47ae62ae-c3f7-42f0-b8a8-c4fddff19624',
        7,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        141,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ce899916-9b7d-46c4-aa16-76c7c7989b5d',
        7,
        'AGE_75_AND_ABOVE',
        'MALE',
        69,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b7b236df-7a26-4230-9026-d1d4287513f6',
        8,
        'AGE_0_4',
        'FEMALE',
        67,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '37ec93b0-154d-4b30-b229-1ad084f66999',
        8,
        'AGE_0_4',
        'MALE',
        59,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '01537bd1-3cde-4dae-bf14-11d2c8f0b371',
        8,
        'AGE_10_14',
        'FEMALE',
        152,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b0453afe-2721-44d3-9ec3-dccd391524d4',
        8,
        'AGE_10_14',
        'MALE',
        200,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8f9d54ab-88be-4fc1-9abe-c4cdbd8b728a',
        8,
        'AGE_15_19',
        'FEMALE',
        159,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2bca021c-ac4e-4a81-84e5-62da1226b6a0',
        8,
        'AGE_15_19',
        'MALE',
        176,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f7468735-ca1a-4a89-ae0e-2c171b58ea78',
        8,
        'AGE_20_24',
        'FEMALE',
        164,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3304f171-4d3e-48dd-b6ec-e4bbe2970bc5',
        8,
        'AGE_20_24',
        'MALE',
        161,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a2c22581-0bf4-4f95-86ca-848052d8136b',
        8,
        'AGE_25_29',
        'FEMALE',
        153,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3facecf7-6f8c-4722-b918-fd417f12243a',
        8,
        'AGE_25_29',
        'MALE',
        159,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1f00805c-f8a0-4f9c-924b-b9b48e14a80f',
        8,
        'AGE_30_34',
        'FEMALE',
        204,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2726d6ed-3782-4ce1-ab07-38fe524d2b3a',
        8,
        'AGE_30_34',
        'MALE',
        168,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a33236e8-884e-4db2-b964-fe96b6feb4ea',
        8,
        'AGE_35_39',
        'FEMALE',
        213,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '66cd2d05-5387-4bc9-b3b8-d71fd0c9b08f',
        8,
        'AGE_35_39',
        'MALE',
        150,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f308ee5d-1347-4567-9b74-7020ed16fdb9',
        8,
        'AGE_40_44',
        'FEMALE',
        194,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3ac54cf0-4be8-4c69-8687-3247765e31e3',
        8,
        'AGE_40_44',
        'MALE',
        142,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'bd08c2d8-4d7d-405d-821d-3cc21ba45845',
        8,
        'AGE_45_49',
        'FEMALE',
        140,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '946cbefe-00cb-4e3d-af70-8ac71afb74e9',
        8,
        'AGE_45_49',
        'MALE',
        116,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e8ee5fca-ea13-4726-b219-5db82af5f769',
        8,
        'AGE_50_54',
        'FEMALE',
        117,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '230ad6fa-2c47-48bf-935a-7129fcd4b303',
        8,
        'AGE_50_54',
        'MALE',
        125,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '071df17b-2667-487c-8ebb-86a6c0492e23',
        8,
        'AGE_55_59',
        'FEMALE',
        99,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6eb02a43-9490-4ec7-b6e1-3ae9e6fc81df',
        8,
        'AGE_55_59',
        'MALE',
        82,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '79df5901-8e2f-408f-b244-a4f8153dbf70',
        8,
        'AGE_5_9',
        'FEMALE',
        132,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '14ab2f3b-f441-455e-b634-8141507b746c',
        8,
        'AGE_5_9',
        'MALE',
        133,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f589bd54-fb26-4c48-8da9-90393269d035',
        8,
        'AGE_60_64',
        'FEMALE',
        98,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'aab965a5-7728-473e-ad05-407ba621525e',
        8,
        'AGE_60_64',
        'MALE',
        78,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a11a9cf0-1516-40ba-8392-f376318fae45',
        8,
        'AGE_65_69',
        'FEMALE',
        73,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7cdf65a9-8034-4e48-b3bc-bc6da8298ad6',
        8,
        'AGE_65_69',
        'MALE',
        78,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7fa9ce1f-0b57-410a-91d7-1f1485f55f50',
        8,
        'AGE_70_74',
        'FEMALE',
        60,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6d3d53b1-ac74-4b36-bc52-6e9a3ad960e0',
        8,
        'AGE_70_74',
        'MALE',
        71,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2c4bd2cb-780a-4d71-b9d4-714d8f96ccb0',
        8,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        198,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1f8fbebf-5925-4548-924d-6ffba179d328',
        8,
        'AGE_75_AND_ABOVE',
        'MALE',
        81,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f423c935-9533-463e-8272-a2fa676980eb',
        9,
        'AGE_0_4',
        'FEMALE',
        130,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a0027978-f238-4c3e-97cf-bb97acaa2fa3',
        9,
        'AGE_0_4',
        'MALE',
        149,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '04b4b329-62eb-4da2-8cea-efb211b9044e',
        9,
        'AGE_0_4',
        'OTHER',
        4,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ff5fde25-8cb0-4f46-a7bc-9aa603fb7c6b',
        9,
        'AGE_10_14',
        'FEMALE',
        247,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4805f6ae-3278-4d9e-9463-63a59b96d030',
        9,
        'AGE_10_14',
        'MALE',
        223,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '01f514d4-250e-4893-8e4c-882da72ee357',
        9,
        'AGE_15_19',
        'FEMALE',
        252,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f41ec6a2-547e-4bf8-8eab-d8963dc6cf8b',
        9,
        'AGE_15_19',
        'MALE',
        228,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '5eae3a51-adef-45e1-ac5a-1993bd46193b',
        9,
        'AGE_20_24',
        'FEMALE',
        327,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '9f0a1385-7555-4ea6-80b7-c1bf6cb25700',
        9,
        'AGE_20_24',
        'MALE',
        261,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '49f8d69b-ee2b-4fc9-821a-15c153d2b0e4',
        9,
        'AGE_20_24',
        'OTHER',
        1,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '00577bd4-ff3a-4c5c-b8f5-e819db6dea35',
        9,
        'AGE_25_29',
        'FEMALE',
        287,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '32a69f39-3839-49f8-9802-d12de5e0111e',
        9,
        'AGE_25_29',
        'MALE',
        250,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '878ffaee-1a2a-42ae-bfcb-81cf6bf8bc00',
        9,
        'AGE_30_34',
        'FEMALE',
        233,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '19678a0d-bbf7-46a6-ba4b-999d7b0e0043',
        9,
        'AGE_30_34',
        'MALE',
        274,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '239446e5-f424-43b4-b59f-460da8dc257c',
        9,
        'AGE_35_39',
        'FEMALE',
        238,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e1f6bec8-2d1a-4400-8c3a-557130b40517',
        9,
        'AGE_35_39',
        'MALE',
        223,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e596236d-7080-46d6-a986-8302be617b56',
        9,
        'AGE_40_44',
        'FEMALE',
        239,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0eb43e10-f376-4bb4-a00c-97dc935ab62e',
        9,
        'AGE_40_44',
        'MALE',
        250,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c968196b-d162-405d-8e83-eb81e8327b1a',
        9,
        'AGE_45_49',
        'FEMALE',
        175,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'cc6d28e4-0aa2-4d57-9959-500cddbe9c9e',
        9,
        'AGE_45_49',
        'MALE',
        163,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a3ea788c-7cae-4b2b-bf2c-57e830248657',
        9,
        'AGE_50_54',
        'FEMALE',
        165,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '16e5d32d-6dd3-4018-a19e-153dca668950',
        9,
        'AGE_50_54',
        'MALE',
        149,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd3aa4b5a-319d-4e1b-8f26-4f1d717bc39e',
        9,
        'AGE_55_59',
        'FEMALE',
        144,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a7056478-ff19-4879-be7e-333ce37421bc',
        9,
        'AGE_55_59',
        'MALE',
        120,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e4a9b947-355e-4b24-ba89-9d187e73a8a7',
        9,
        'AGE_5_9',
        'FEMALE',
        184,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fd9c6e68-216d-4768-9d30-66939066b389',
        9,
        'AGE_5_9',
        'MALE',
        246,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'feeaf5ce-ba82-4f70-bd04-b9493daa9221',
        9,
        'AGE_60_64',
        'FEMALE',
        111,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a3b8d4e1-bb46-4221-96e6-26099bc34d4e',
        9,
        'AGE_60_64',
        'MALE',
        88,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6874c308-e17d-4e0d-b132-21e6df5db5a2',
        9,
        'AGE_65_69',
        'FEMALE',
        111,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b4cab157-7b40-45c9-88b5-5bf3701cfda6',
        9,
        'AGE_65_69',
        'MALE',
        68,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0dfc2551-31af-4634-a3fc-d194cd3115bf',
        9,
        'AGE_70_74',
        'FEMALE',
        82,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd5d32e5f-c4a7-4b5d-aa5a-65ff868128f1',
        9,
        'AGE_70_74',
        'MALE',
        72,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '33a33203-5f55-4329-9ded-3f4ed0715495',
        9,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        146,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '424dad43-d83f-42c2-b2f3-86ab2f456464',
        9,
        'AGE_75_AND_ABOVE',
        'MALE',
        83,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '015be565-c870-41b2-9de1-39bf8110ccd2',
        10,
        'AGE_0_4',
        'FEMALE',
        85,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8ca694a5-d5ee-4d35-b70e-52c3f0fe08c8',
        10,
        'AGE_0_4',
        'MALE',
        88,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c9cf9556-76c6-43a0-a613-e6aa3556460b',
        10,
        'AGE_10_14',
        'FEMALE',
        150,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '5ba88ad8-b1da-4ffd-a175-a5505b4ea31b',
        10,
        'AGE_10_14',
        'MALE',
        185,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '5f8a8abe-0777-448b-a925-06dd071319f0',
        10,
        'AGE_15_19',
        'FEMALE',
        164,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'c92b2ea2-87b9-416e-b7b0-5f3e0b4bf085',
        10,
        'AGE_15_19',
        'MALE',
        138,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '53b6120b-b7cc-4bc6-9141-3dbdc593b3f9',
        10,
        'AGE_20_24',
        'FEMALE',
        175,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd8d3c0ae-d0c8-4bf9-b93a-9d55ed45f9b6',
        10,
        'AGE_20_24',
        'MALE',
        162,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2a83bed4-3f80-4e29-8e0d-fe72492684a8',
        10,
        'AGE_25_29',
        'FEMALE',
        200,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0cab325d-1bef-460d-9a5b-dfe9cae4a70a',
        10,
        'AGE_25_29',
        'MALE',
        152,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a2a796c8-847e-4a35-bf19-6a7a2de424d2',
        10,
        'AGE_30_34',
        'FEMALE',
        192,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd7bc1813-234a-4d44-99d4-359cd0650d71',
        10,
        'AGE_30_34',
        'MALE',
        189,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'cdce3a38-8b69-4498-a0bc-3c7db05070b1',
        10,
        'AGE_35_39',
        'FEMALE',
        165,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '871df7c8-8ad0-435c-853a-e86053a97a55',
        10,
        'AGE_35_39',
        'MALE',
        172,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '33d78785-45c9-4515-8b8b-fbe70e568584',
        10,
        'AGE_40_44',
        'FEMALE',
        156,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7df90a6d-01b4-46f3-9c6c-5edf9c7de64d',
        10,
        'AGE_40_44',
        'MALE',
        168,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ba57e939-a932-4192-9dbc-8a10a3a1b418',
        10,
        'AGE_45_49',
        'FEMALE',
        115,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '778a91f7-802f-4370-aae2-a414e7f064b9',
        10,
        'AGE_45_49',
        'MALE',
        127,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f7a02c36-c7ac-4f22-9b17-984c00f66609',
        10,
        'AGE_50_54',
        'FEMALE',
        96,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ff63aee7-4275-4a85-a0b0-13633a7b8537',
        10,
        'AGE_50_54',
        'MALE',
        110,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '107a93f7-cc54-41fb-9e1a-0a91852d62e7',
        10,
        'AGE_55_59',
        'FEMALE',
        87,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b331fa0f-5afb-4d42-9441-c9367a522d31',
        10,
        'AGE_55_59',
        'MALE',
        66,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '00993dbf-b800-4c63-90c5-2bf7912163dc',
        10,
        'AGE_5_9',
        'FEMALE',
        116,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6cca1889-dbe1-408d-b8d3-4c58097e998f',
        10,
        'AGE_5_9',
        'MALE',
        152,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e2356478-1e9b-4a25-a7c8-8b4512eb1ad8',
        10,
        'AGE_60_64',
        'FEMALE',
        63,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '9e05d182-8b0a-4cee-9a56-642ec264c155',
        10,
        'AGE_60_64',
        'MALE',
        77,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd5e93059-eef0-409e-941c-ca4d38ff8c63',
        10,
        'AGE_65_69',
        'FEMALE',
        54,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e85f5456-e633-4ab7-86e1-c89a1c6cd89b',
        10,
        'AGE_65_69',
        'MALE',
        45,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '371cd407-bb42-4a8c-8ce5-a559bbf8c119',
        10,
        'AGE_70_74',
        'FEMALE',
        50,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7f626a92-1774-4d99-ab21-72569b676cad',
        10,
        'AGE_70_74',
        'MALE',
        31,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3f51c0ea-d8a8-44e3-b677-dc17391de2b1',
        10,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        63,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

    INSERT INTO acme_ward_age_wise_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a22213fd-a97c-4bc7-8948-c850c95ac9aa',
        10,
        'AGE_75_AND_ABOVE',
        'MALE',
        41,
        '2025-06-30 11:44:34',
        '2025-06-30 11:44:34'
    );
    

        RAISE NOTICE 'Ward age-wise population data inserted successfully';
    ELSE
        RAISE NOTICE 'Ward age-wise population data already exists, skipping insertion';
    END IF;
END
$$;

