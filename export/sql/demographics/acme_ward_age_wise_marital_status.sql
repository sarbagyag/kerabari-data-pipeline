-- Generated SQL script
-- Date: 2025-06-30 11:56:19


-- Check if acme_ward_age_wise_marital_status table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_age_wise_marital_status'
    ) THEN
        CREATE TABLE acme_ward_age_wise_marital_status (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            age_group VARCHAR(100) NOT NULL,
            marital_status VARCHAR(100) NOT NULL,
            population INTEGER NOT NULL,
            male_population INTEGER,
            female_population INTEGER,
            other_population INTEGER,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_age_wise_marital_status) THEN


    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0525bdd5-d374-4e2d-9776-505efbce10fe',
        1,
        'AGE_15_19',
        'NOT_STATED',
        194,
        NULL,
        NULL,
        194,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '36d0481c-985d-4180-8372-0b56a3ae58a3',
        1,
        'AGE_20_24',
        'NOT_STATED',
        205,
        NULL,
        NULL,
        205,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'c52d35bb-c6a7-4535-bebb-c9c9ace48b15',
        1,
        'AGE_25_29',
        'NOT_STATED',
        237,
        NULL,
        NULL,
        237,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '42ab9a78-2f52-45c0-9043-379ede5dc376',
        1,
        'AGE_30_34',
        'NOT_STATED',
        211,
        NULL,
        NULL,
        211,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '90505f07-6498-4efc-ae25-ea5d321e57cd',
        1,
        'AGE_35_39',
        'NOT_STATED',
        113,
        NULL,
        NULL,
        113,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'aa735df1-891e-4485-ad74-059bf0f5fe03',
        1,
        'AGE_40_44',
        'NOT_STATED',
        162,
        NULL,
        NULL,
        162,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'c8c2c8bd-7bff-4bc0-96bf-acfd97864264',
        1,
        'AGE_45_49',
        'NOT_STATED',
        108,
        NULL,
        NULL,
        108,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '9ec82820-69e4-4974-a814-71ce0b2232a2',
        1,
        'AGE_50_54',
        'NOT_STATED',
        96,
        NULL,
        NULL,
        96,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'bde44070-a0e4-4327-bd57-6e91d6e10db5',
        1,
        'AGE_55_59',
        'NOT_STATED',
        80,
        NULL,
        NULL,
        80,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'f7725796-7fe9-40f3-9921-278622d562e4',
        1,
        'AGE_60_64',
        'NOT_STATED',
        88,
        NULL,
        NULL,
        88,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '14125d35-3086-4132-8011-9097179d9693',
        1,
        'AGE_65_69',
        'NOT_STATED',
        45,
        NULL,
        NULL,
        45,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '837a7b51-8fb7-4030-b14b-5265590dbc29',
        1,
        'AGE_70_74',
        'NOT_STATED',
        53,
        NULL,
        NULL,
        53,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0aea4fc4-3a92-4072-ae8b-2f974e9e36d6',
        1,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        74,
        NULL,
        NULL,
        74,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '5a4b6059-ecd5-4070-b5ad-a4104520f457',
        1,
        'AGE_BELOW_15',
        'NOT_STATED',
        193,
        NULL,
        NULL,
        193,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '67639aa7-2466-4029-b0e4-0fb09bfc0f48',
        2,
        'AGE_15_19',
        'NOT_STATED',
        214,
        NULL,
        NULL,
        214,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'ce179fd1-4e86-47c2-9cfd-6dc2153afcfd',
        2,
        'AGE_20_24',
        'NOT_STATED',
        225,
        NULL,
        NULL,
        225,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0cab5545-b32c-4205-8c72-00b2703a8e9d',
        2,
        'AGE_25_29',
        'NOT_STATED',
        244,
        NULL,
        NULL,
        244,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'df5263db-2aa4-43dd-8400-a93848d54945',
        2,
        'AGE_30_34',
        'NOT_STATED',
        233,
        NULL,
        NULL,
        233,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '8272a955-664b-498b-ad76-d97ac6265636',
        2,
        'AGE_35_39',
        'NOT_STATED',
        187,
        NULL,
        NULL,
        187,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0002076f-77d5-4389-9107-a7ec43cb531f',
        2,
        'AGE_40_44',
        'NOT_STATED',
        176,
        NULL,
        NULL,
        176,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '3b9b877c-2b3d-4a28-b7e8-54cefd8d0bbc',
        2,
        'AGE_45_49',
        'NOT_STATED',
        118,
        NULL,
        NULL,
        118,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'eb90c5f3-a9e7-49c1-b05f-a66dc600cf18',
        2,
        'AGE_50_54',
        'NOT_STATED',
        76,
        NULL,
        NULL,
        76,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '5d874506-6393-4aef-bc0c-2ec5c37469d3',
        2,
        'AGE_55_59',
        'NOT_STATED',
        48,
        NULL,
        NULL,
        48,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'e409701a-8d9a-4893-96ec-e3b678680876',
        2,
        'AGE_60_64',
        'NOT_STATED',
        65,
        NULL,
        NULL,
        65,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '546db6ee-ed2d-41fa-a97b-67be15fd6957',
        2,
        'AGE_65_69',
        'NOT_STATED',
        50,
        NULL,
        NULL,
        50,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0e4ba66b-0594-44ae-bae1-df7145fcbd9e',
        2,
        'AGE_70_74',
        'NOT_STATED',
        46,
        NULL,
        NULL,
        46,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '7b2235d7-2a59-4e8e-b77c-14df8eafa217',
        2,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        131,
        NULL,
        NULL,
        131,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'a779b300-c457-431f-af50-c92c44f63ede',
        2,
        'AGE_BELOW_15',
        'NOT_STATED',
        358,
        NULL,
        NULL,
        358,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '677dd3f0-f46e-4aa6-bfd6-1151261ad736',
        3,
        'AGE_15_19',
        'NOT_STATED',
        297,
        NULL,
        NULL,
        297,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'eb3aba7a-b18d-41de-8eac-20bd6627babf',
        3,
        'AGE_20_24',
        'NOT_STATED',
        314,
        NULL,
        NULL,
        314,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '560326de-cf57-4ccb-a33a-4c02920ed395',
        3,
        'AGE_25_29',
        'NOT_STATED',
        325,
        NULL,
        NULL,
        325,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '6fec782f-c070-48aa-b83d-76affda19fe7',
        3,
        'AGE_30_34',
        'NOT_STATED',
        320,
        NULL,
        NULL,
        320,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '84df9bd6-2f93-4cfe-9cfd-14d90d512d04',
        3,
        'AGE_35_39',
        'NOT_STATED',
        281,
        NULL,
        NULL,
        281,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '39a2821e-fb96-47c7-baa3-baa691647281',
        3,
        'AGE_40_44',
        'NOT_STATED',
        280,
        NULL,
        NULL,
        280,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '7fb7046b-7c82-401b-a397-efff2bbb5f4b',
        3,
        'AGE_45_49',
        'NOT_STATED',
        201,
        NULL,
        NULL,
        201,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'dd0df1be-fa56-4568-b19d-4e3d28b072c9',
        3,
        'AGE_50_54',
        'NOT_STATED',
        156,
        NULL,
        NULL,
        156,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'abd26277-ca50-42d7-812b-f057dbc2b479',
        3,
        'AGE_55_59',
        'NOT_STATED',
        163,
        NULL,
        NULL,
        163,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'ea57ac35-805b-4516-bf30-5ebd36dd6f7a',
        3,
        'AGE_60_64',
        'NOT_STATED',
        135,
        NULL,
        NULL,
        135,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'aba9c61d-b1d2-437f-bae5-516fe521c5c6',
        3,
        'AGE_65_69',
        'NOT_STATED',
        86,
        NULL,
        NULL,
        86,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'bc60520f-c62e-44be-be85-c63f8a1b6b6e',
        3,
        'AGE_70_74',
        'NOT_STATED',
        84,
        NULL,
        NULL,
        84,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '6dcff427-fd72-4601-91a1-884636eba087',
        3,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        91,
        NULL,
        NULL,
        91,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '2417d5c1-c55a-4164-9b02-3329909be8ce',
        3,
        'AGE_BELOW_15',
        'NOT_STATED',
        355,
        NULL,
        NULL,
        355,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '083de6fd-1a3d-4be7-9a0b-5600e8129283',
        4,
        'AGE_15_19',
        'NOT_STATED',
        153,
        NULL,
        NULL,
        153,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '775dd143-8dad-4fc5-9828-c6c4f95f3e73',
        4,
        'AGE_20_24',
        'NOT_STATED',
        169,
        NULL,
        NULL,
        169,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'c6b5d431-2f02-4246-9d25-11582a2c3ffa',
        4,
        'AGE_25_29',
        'NOT_STATED',
        179,
        NULL,
        NULL,
        179,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'b27b6c36-a51c-468d-b046-581501aaaaca',
        4,
        'AGE_30_34',
        'NOT_STATED',
        140,
        NULL,
        NULL,
        140,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'bcd88349-6eed-476c-888f-db6571d028de',
        4,
        'AGE_35_39',
        'NOT_STATED',
        109,
        NULL,
        NULL,
        109,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'ff183f49-61b2-40ea-aa79-fc521360514b',
        4,
        'AGE_40_44',
        'NOT_STATED',
        104,
        NULL,
        NULL,
        104,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '85754ac4-2e1f-4c52-89bf-7aac64b9e49c',
        4,
        'AGE_45_49',
        'NOT_STATED',
        85,
        NULL,
        NULL,
        85,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '3afcc000-7756-4c5d-a2a0-55a3dafbe09e',
        4,
        'AGE_50_54',
        'NOT_STATED',
        92,
        NULL,
        NULL,
        92,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '27da6e27-89c8-4197-bea5-4d6a79676436',
        4,
        'AGE_55_59',
        'NOT_STATED',
        91,
        NULL,
        NULL,
        91,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'f9969310-dd91-4865-9ba9-0cfbbaa5f927',
        4,
        'AGE_60_64',
        'NOT_STATED',
        78,
        NULL,
        NULL,
        78,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'b9ff9de3-e7eb-4e74-aa5f-8e4ec6e3fbfb',
        4,
        'AGE_65_69',
        'NOT_STATED',
        52,
        NULL,
        NULL,
        52,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'b9bcf3e6-9986-49a7-aadc-8a4569532333',
        4,
        'AGE_70_74',
        'NOT_STATED',
        29,
        NULL,
        NULL,
        29,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '714a9b0d-5912-4d19-bc7e-ec9db202e51d',
        4,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        46,
        NULL,
        NULL,
        46,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '32bf5221-ac91-47d3-94a0-5fcb37903527',
        4,
        'AGE_BELOW_15',
        'NOT_STATED',
        184,
        NULL,
        NULL,
        184,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '2a39c4c7-410d-4192-835b-86b35dab4a72',
        5,
        'AGE_15_19',
        'NOT_STATED',
        325,
        NULL,
        NULL,
        325,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '1839464d-3d49-44ae-a5f0-a23b1e4337ff',
        5,
        'AGE_20_24',
        'NOT_STATED',
        415,
        NULL,
        NULL,
        415,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '6419093f-816c-487c-b44d-7f5af5530ac0',
        5,
        'AGE_25_29',
        'NOT_STATED',
        430,
        NULL,
        NULL,
        430,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '315ed16c-38b0-44e7-81f2-539577eaef94',
        5,
        'AGE_30_34',
        'NOT_STATED',
        400,
        NULL,
        NULL,
        400,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'cf1fa472-e888-470a-8b20-72bf531d362e',
        5,
        'AGE_35_39',
        'NOT_STATED',
        334,
        NULL,
        NULL,
        334,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '394bfc9a-05e1-4ec5-af7e-9ed34ae34d74',
        5,
        'AGE_40_44',
        'NOT_STATED',
        314,
        NULL,
        NULL,
        314,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'cc987836-a191-49d3-882c-789095918b65',
        5,
        'AGE_45_49',
        'NOT_STATED',
        277,
        NULL,
        NULL,
        277,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'f46e6922-7931-4915-bb71-61afdb991565',
        5,
        'AGE_50_54',
        'NOT_STATED',
        207,
        NULL,
        NULL,
        207,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0fba72fd-809c-4afa-8376-38eb8a5e066f',
        5,
        'AGE_55_59',
        'NOT_STATED',
        210,
        NULL,
        NULL,
        210,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '65a83551-23ed-402a-bd18-ea35472b43de',
        5,
        'AGE_60_64',
        'NOT_STATED',
        147,
        NULL,
        NULL,
        147,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '9381317d-776b-4cc0-b864-1fb48d6edd56',
        5,
        'AGE_65_69',
        'NOT_STATED',
        103,
        NULL,
        NULL,
        103,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '19ff5955-2146-49a4-89ef-ce4af158bc09',
        5,
        'AGE_70_74',
        'NOT_STATED',
        99,
        NULL,
        NULL,
        99,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'dfcae97d-39e9-4498-b08b-3ae031ba3e1b',
        5,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        129,
        NULL,
        NULL,
        129,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '5d11c6a3-46f5-481f-8f4a-3ea9711d52e4',
        5,
        'AGE_BELOW_15',
        'NOT_STATED',
        315,
        NULL,
        NULL,
        315,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'd5223a6f-b2ed-491b-9df9-ab6b8da845a8',
        6,
        'AGE_15_19',
        'NOT_STATED',
        351,
        NULL,
        NULL,
        351,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '2aad708b-496a-40a7-b4f9-16d1d190ec6f',
        6,
        'AGE_20_24',
        'NOT_STATED',
        414,
        NULL,
        NULL,
        414,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'b60fe15c-70fb-4deb-9ba6-84a556b3a5e2',
        6,
        'AGE_25_29',
        'NOT_STATED',
        355,
        NULL,
        NULL,
        355,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '155f42fa-c7cf-45bd-a561-304ace4beebf',
        6,
        'AGE_30_34',
        'NOT_STATED',
        372,
        NULL,
        NULL,
        372,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '55ebd202-b178-473d-8c52-2944c55a120f',
        6,
        'AGE_35_39',
        'NOT_STATED',
        299,
        NULL,
        NULL,
        299,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0301a92d-2380-42a6-8c36-a527f813de2f',
        6,
        'AGE_40_44',
        'NOT_STATED',
        301,
        NULL,
        NULL,
        301,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'cf8d94c4-5644-4f92-9518-1e28bb8f4cd7',
        6,
        'AGE_45_49',
        'NOT_STATED',
        246,
        NULL,
        NULL,
        246,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '38ffdcd3-8e2a-42b2-b852-e96fc3c70613',
        6,
        'AGE_50_54',
        'NOT_STATED',
        217,
        NULL,
        NULL,
        217,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '2593ed15-282e-4e7e-9055-7851841a996b',
        6,
        'AGE_55_59',
        'NOT_STATED',
        193,
        NULL,
        NULL,
        193,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '75797b90-ab7a-4641-bf27-a8328873bdc7',
        6,
        'AGE_60_64',
        'NOT_STATED',
        163,
        NULL,
        NULL,
        163,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '54780a3d-6b3f-4576-9fd8-c5e86100fefb',
        6,
        'AGE_65_69',
        'NOT_STATED',
        120,
        NULL,
        NULL,
        120,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '305a7dad-ad20-4656-82b0-48f54ffa2c6a',
        6,
        'AGE_70_74',
        'NOT_STATED',
        96,
        NULL,
        NULL,
        96,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '63ab59bd-d64e-487c-968d-a3e269f64268',
        6,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        135,
        NULL,
        NULL,
        135,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '5658bc5b-bb9a-4725-8b69-522d7d0463f2',
        6,
        'AGE_BELOW_15',
        'NOT_STATED',
        396,
        NULL,
        NULL,
        396,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '78edade4-80df-42fe-9650-b6f1eb2a1ebb',
        7,
        'AGE_15_19',
        'NOT_STATED',
        363,
        NULL,
        NULL,
        363,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '2bba2744-7663-4d2d-80c9-81b5e86dad11',
        7,
        'AGE_20_24',
        'NOT_STATED',
        429,
        NULL,
        NULL,
        429,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0b06f7a6-9f33-4603-ad38-4fe15bf288d3',
        7,
        'AGE_25_29',
        'NOT_STATED',
        415,
        NULL,
        NULL,
        415,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'b66a56e9-a74f-4746-b248-d5b5b4b23e0d',
        7,
        'AGE_30_34',
        'NOT_STATED',
        352,
        NULL,
        NULL,
        352,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'fd24d739-9b5c-46c8-96af-74059fd1e44e',
        7,
        'AGE_35_39',
        'NOT_STATED',
        329,
        NULL,
        NULL,
        329,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '9ebe4316-190f-4fb3-b5b7-c5bde0bdff4c',
        7,
        'AGE_40_44',
        'NOT_STATED',
        300,
        NULL,
        NULL,
        300,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '751e6d2a-f6a4-4755-9ff7-975bdfa7aeb9',
        7,
        'AGE_45_49',
        'NOT_STATED',
        259,
        NULL,
        NULL,
        259,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '6fe5e6ad-7827-417b-ba3f-620dad1a0f3d',
        7,
        'AGE_50_54',
        'NOT_STATED',
        200,
        NULL,
        NULL,
        200,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '9a16e0a8-5b89-4dd3-a902-4a8aa249ab7b',
        7,
        'AGE_55_59',
        'NOT_STATED',
        210,
        NULL,
        NULL,
        210,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'e5dae403-ce09-4355-a3bb-b533e94cc31f',
        7,
        'AGE_60_64',
        'NOT_STATED',
        152,
        NULL,
        NULL,
        152,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0f91fcf5-36b1-4462-9d0d-a63639eee544',
        7,
        'AGE_65_69',
        'NOT_STATED',
        110,
        NULL,
        NULL,
        110,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '5423db38-10ed-45d8-88ce-421f9796a08c',
        7,
        'AGE_70_74',
        'NOT_STATED',
        100,
        NULL,
        NULL,
        100,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'f393ee0d-b601-4851-b6f2-6a6d5e4a718f',
        7,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        210,
        NULL,
        NULL,
        210,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'd1dc5cd7-b559-465c-a68f-7dffa7b4362f',
        7,
        'AGE_BELOW_15',
        'NOT_STATED',
        374,
        NULL,
        NULL,
        374,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '279f9fe8-8776-4d68-8563-b9008f49a7e8',
        8,
        'AGE_15_19',
        'NOT_STATED',
        335,
        NULL,
        NULL,
        335,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'abc2e60b-6f99-40b0-922f-684abbebe4d1',
        8,
        'AGE_20_24',
        'NOT_STATED',
        325,
        NULL,
        NULL,
        325,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '0ad33ceb-5258-419a-a871-c6b2d161f1db',
        8,
        'AGE_25_29',
        'NOT_STATED',
        312,
        NULL,
        NULL,
        312,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'd28d2ebc-8393-418b-84aa-ef281b1f65dd',
        8,
        'AGE_30_34',
        'NOT_STATED',
        372,
        NULL,
        NULL,
        372,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '6a8ee86b-dba7-4ba2-abc0-2d4b27032824',
        8,
        'AGE_35_39',
        'NOT_STATED',
        363,
        NULL,
        NULL,
        363,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '9e89192d-ec82-4fc5-a924-6940d4cdc8cc',
        8,
        'AGE_40_44',
        'NOT_STATED',
        336,
        NULL,
        NULL,
        336,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '522d6e60-8e83-44c0-abdb-5bf05b514459',
        8,
        'AGE_45_49',
        'NOT_STATED',
        256,
        NULL,
        NULL,
        256,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'd2f73db9-2cac-4b32-aed9-03d958c7822e',
        8,
        'AGE_50_54',
        'NOT_STATED',
        242,
        NULL,
        NULL,
        242,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'cd6efa5c-9861-447f-9908-24ed04cbd6d8',
        8,
        'AGE_55_59',
        'NOT_STATED',
        181,
        NULL,
        NULL,
        181,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'af24083a-4507-43fd-9afd-c3c54b2a212c',
        8,
        'AGE_60_64',
        'NOT_STATED',
        176,
        NULL,
        NULL,
        176,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'd282c64b-f24e-4a02-abe1-f25025c6b428',
        8,
        'AGE_65_69',
        'NOT_STATED',
        151,
        NULL,
        NULL,
        151,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '50f2a758-6073-4115-95f0-81ea9bb742a7',
        8,
        'AGE_70_74',
        'NOT_STATED',
        131,
        NULL,
        NULL,
        131,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '7e7023a5-b4a1-48e8-8368-9141b3265a2d',
        8,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        279,
        NULL,
        NULL,
        279,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '1911ff30-6e6a-40cb-9711-7b79878f3dc8',
        8,
        'AGE_BELOW_15',
        'NOT_STATED',
        415,
        NULL,
        NULL,
        415,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '69e86c20-0c9d-42d8-81ea-d83a66ba1f93',
        9,
        'AGE_15_19',
        'NOT_STATED',
        480,
        NULL,
        NULL,
        480,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '9a289a18-7d82-415d-a299-57e913619583',
        9,
        'AGE_20_24',
        'NOT_STATED',
        589,
        NULL,
        NULL,
        589,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'b8f46047-0fec-4845-8cb3-d1ecf22e1cbe',
        9,
        'AGE_25_29',
        'NOT_STATED',
        537,
        NULL,
        NULL,
        537,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '2268c9f4-0196-4fc0-a30a-7ae17d6ccb45',
        9,
        'AGE_30_34',
        'NOT_STATED',
        507,
        NULL,
        NULL,
        507,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '1d43b5e1-b1b8-4d59-a1db-7d220e5ad4bc',
        9,
        'AGE_35_39',
        'NOT_STATED',
        461,
        NULL,
        NULL,
        461,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '24b789a8-2aa8-41d4-904a-99c060edd83d',
        9,
        'AGE_40_44',
        'NOT_STATED',
        489,
        NULL,
        NULL,
        489,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'ee39d05d-35b1-436e-90b2-70fa03f2d503',
        9,
        'AGE_45_49',
        'NOT_STATED',
        338,
        NULL,
        NULL,
        338,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'fd44d267-2400-444b-9fb3-53307edfb472',
        9,
        'AGE_50_54',
        'NOT_STATED',
        314,
        NULL,
        NULL,
        314,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'c41c9ee4-97b9-49f5-b1bb-b7194893e419',
        9,
        'AGE_55_59',
        'NOT_STATED',
        264,
        NULL,
        NULL,
        264,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'f747c786-d1ec-42fe-aa94-db3ec16612e1',
        9,
        'AGE_60_64',
        'NOT_STATED',
        199,
        NULL,
        NULL,
        199,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'c97f0b10-ca97-4139-8779-afe4ca648bff',
        9,
        'AGE_65_69',
        'NOT_STATED',
        179,
        NULL,
        NULL,
        179,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '749db5ce-daf7-41af-9ad1-f7b7235579cf',
        9,
        'AGE_70_74',
        'NOT_STATED',
        154,
        NULL,
        NULL,
        154,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '07f5cf51-c327-4897-bbf7-df81fd25994d',
        9,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        229,
        NULL,
        NULL,
        229,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '9482e6c5-3d51-4d3f-8285-c2e0cbce6404',
        9,
        'AGE_BELOW_15',
        'NOT_STATED',
        470,
        NULL,
        NULL,
        470,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'a0c095eb-f4ff-4956-873f-6750dac8e9d7',
        10,
        'AGE_15_19',
        'NOT_STATED',
        302,
        NULL,
        NULL,
        302,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'c258136e-fc69-4277-b181-b8d747f1e249',
        10,
        'AGE_20_24',
        'NOT_STATED',
        337,
        NULL,
        NULL,
        337,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'ccb0d05c-e4fc-4adc-972f-2633f60fbb49',
        10,
        'AGE_25_29',
        'NOT_STATED',
        352,
        NULL,
        NULL,
        352,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'a993ea99-f8ca-4dab-959e-b84ea17a7698',
        10,
        'AGE_30_34',
        'NOT_STATED',
        381,
        NULL,
        NULL,
        381,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'fb31bc30-9ed1-4e29-a31a-82944cb53a01',
        10,
        'AGE_35_39',
        'NOT_STATED',
        337,
        NULL,
        NULL,
        337,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '16cebb18-8f44-4e84-ac31-c20eb25ee2a0',
        10,
        'AGE_40_44',
        'NOT_STATED',
        324,
        NULL,
        NULL,
        324,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '58b782cd-e595-47f0-81b7-9dad64a6ce3d',
        10,
        'AGE_45_49',
        'NOT_STATED',
        242,
        NULL,
        NULL,
        242,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'e4ade6ac-8d3c-4fdb-9294-aff17aa09032',
        10,
        'AGE_50_54',
        'NOT_STATED',
        206,
        NULL,
        NULL,
        206,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '4119a5d9-8e9c-4f19-895a-0abda359294d',
        10,
        'AGE_55_59',
        'NOT_STATED',
        153,
        NULL,
        NULL,
        153,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '30d8ada3-38a7-4f84-be4c-9b6ded9b1435',
        10,
        'AGE_60_64',
        'NOT_STATED',
        140,
        NULL,
        NULL,
        140,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '6efd07a8-7abb-42d4-9047-3b14625af87a',
        10,
        'AGE_65_69',
        'NOT_STATED',
        99,
        NULL,
        NULL,
        99,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'df6261c3-7c09-4a52-8727-c2b18bf4c001',
        10,
        'AGE_70_74',
        'NOT_STATED',
        81,
        NULL,
        NULL,
        81,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '434fcf21-ea5c-4db2-b4cf-e36b99924dc4',
        10,
        'AGE_75_AND_ABOVE',
        'NOT_STATED',
        104,
        NULL,
        NULL,
        104,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    INSERT INTO acme_ward_age_wise_marital_status 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '9f614d1a-2cad-4fdf-a3cd-4606b8b49ca4',
        10,
        'AGE_BELOW_15',
        'NOT_STATED',
        335,
        NULL,
        NULL,
        335,
        '2025-06-30 11:56:19',
        '2025-06-30 11:56:19'
    );
    

    END IF;
END
$$;

