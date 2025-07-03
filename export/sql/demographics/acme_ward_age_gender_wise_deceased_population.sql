-- Generated SQL script
-- Date: 2025-06-30 12:02:20


-- Check if acme_ward_age_gender_wise_deceased_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_age_gender_wise_deceased_population'
    ) THEN
        CREATE TABLE acme_ward_age_gender_wise_deceased_population (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            age_group VARCHAR(100) NOT NULL,
            gender VARCHAR(100) NOT NULL,
            deceased_count INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_age_gender_wise_deceased_population) THEN


    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '87e3235e-30be-4640-a909-2ef31ac6180a',
        1,
        'AGE_0_4',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'bdcba295-4883-46ef-b932-24d5c9076f5b',
        1,
        'AGE_20_24',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'ca309eac-0f31-45c8-bfa9-9c2923062082',
        1,
        'AGE_40_44',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '8be49fb2-f294-40f9-b4a6-341e692edde1',
        1,
        'AGE_55_59',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '05e5cae2-4c94-4c51-b420-941f6636cb1d',
        1,
        'AGE_60_64',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '5a9d0596-4bde-47e3-9dfa-1a48e3685dfa',
        1,
        'AGE_75_AND_ABOVE',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'f2bb8f66-e77f-400a-b665-6ffce943ff72',
        2,
        'AGE_50_54',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '564b45d0-77b1-42d7-a9a9-c153d2cdd32f',
        3,
        'AGE_15_19',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '80f95e5e-54e8-4f07-afbf-5ef26ad22405',
        3,
        'AGE_25_29',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'aab0a8e3-ad6d-4010-9627-fcebdaff776c',
        3,
        'AGE_30_34',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'fde011e1-0f17-45bb-ac1e-05790c511a66',
        3,
        'AGE_35_39',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'be6390ca-9079-4000-a308-1d6a052aa87c',
        3,
        'AGE_40_44',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '9e114c7f-ea1b-41af-8b57-9d8ff0e02250',
        3,
        'AGE_55_59',
        'MALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'a26285d7-9c24-4085-8e47-808ece6f7e7b',
        3,
        'AGE_5_9',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'a7739cad-9d92-4401-b6b1-29e22587628a',
        3,
        'AGE_60_64',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '50926189-b0c1-4901-8e42-87df2415bf7f',
        3,
        'AGE_65_69',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '68bd61db-b82e-439c-a2c3-3cb40e1bd0ec',
        3,
        'AGE_70_74',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'e4573988-5229-44bc-a9fe-c50a74f5df0d',
        3,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '23c877b3-51f3-4d38-a6fc-c75a6307f005',
        3,
        'AGE_75_AND_ABOVE',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'e539d572-c624-4bf7-bedf-49a76fc3bd8c',
        4,
        'AGE_45_49',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '6b92d2c2-1e1c-4b2b-96ee-e6ec97459813',
        4,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '2cb06f7c-d536-4e68-8b60-a5141ab6087a',
        4,
        'AGE_75_AND_ABOVE',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'aa21c9f5-9689-4f9d-bd5e-383bbdafd95a',
        5,
        'AGE_10_14',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'f51e9a4d-5d40-4693-abb1-07a68771b644',
        5,
        'AGE_35_39',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '9a69fc0b-cf63-4157-a187-f44e86abe179',
        5,
        'AGE_40_44',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'df94325f-06b3-43bf-b5c3-1f416f925b0b',
        5,
        'AGE_50_54',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '61715291-d1b0-4da6-8b4f-e67e895d82ea',
        5,
        'AGE_55_59',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'b8f78da0-759d-4c62-8cd0-cc267072c128',
        5,
        'AGE_60_64',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '4a47c7d8-c7d0-4fe0-aad5-b611147a09b6',
        5,
        'AGE_60_64',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '65eb2376-3039-476d-bcd8-64edeec3b866',
        5,
        'AGE_65_69',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'adb3112f-2ff5-446a-8ca8-40eea3013b29',
        5,
        'AGE_70_74',
        'FEMALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '4ae3b88a-bc72-42eb-85eb-8cf412b5a72a',
        5,
        'AGE_70_74',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'bb52cdad-6f8d-4878-beae-82d5702f95e3',
        5,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        3,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'bd6e0d55-efc5-45d8-bb0b-293ecf675aaf',
        5,
        'AGE_75_AND_ABOVE',
        'MALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'de01a368-7893-4547-bad3-dac9c9b51199',
        6,
        'AGE_25_29',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '01496c49-7b93-47e8-9316-f1faa9922cea',
        6,
        'AGE_30_34',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '6ffd509e-d2a0-40ea-9c6e-2c9c5a1c9ca3',
        6,
        'AGE_35_39',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '12461a3c-efb5-4f74-be90-4765362f3a4f',
        6,
        'AGE_40_44',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '8ff752be-ecd0-4eb3-a434-4e9fda160f7c',
        6,
        'AGE_40_44',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'fba8f14b-a45f-4089-a80b-6355c8d0073f',
        6,
        'AGE_45_49',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'fd0638a5-21b8-4ccd-ad30-88649d32789b',
        6,
        'AGE_45_49',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '37afd5aa-8dab-4b8b-99ed-b7f5e56dfb87',
        6,
        'AGE_60_64',
        'MALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'b99ed4dc-ca95-4de1-9882-864a882b5d14',
        6,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        4,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '05960fbc-497c-4da8-8550-363f1f7c2e0b',
        6,
        'AGE_75_AND_ABOVE',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '1d2f1671-e1c3-4019-897a-db6e8efc8589',
        7,
        'AGE_35_39',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '6aee3a3b-2ba1-4358-8f82-81b8ea6277d8',
        7,
        'AGE_50_54',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '479bf8d3-8306-4df3-aa83-f0ce72894d3c',
        7,
        'AGE_55_59',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'fe7a225f-5ab6-4d5c-aeff-569fee4c2561',
        7,
        'AGE_60_64',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '950bcbc9-4fb9-4649-bd49-22f11cdcd4e6',
        7,
        'AGE_70_74',
        'FEMALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '4fdca84a-d765-4943-abec-ea98973607ca',
        7,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '936064d9-771b-46bb-b3d9-dc0407865ad5',
        7,
        'AGE_75_AND_ABOVE',
        'MALE',
        4,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '5a23581d-4e10-46a5-828e-475d7bd684db',
        8,
        'AGE_15_19',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '56c4a7a2-e4d1-4b09-a9e2-3db7a074cb33',
        8,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'cc9c508d-2edf-4b04-8019-d5e059ccd230',
        8,
        'AGE_75_AND_ABOVE',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '2536438a-905d-4454-8c7b-973c6ffae0d3',
        9,
        'AGE_0_4',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '07b39767-5106-48d2-94ca-03cf4c628c3a',
        9,
        'AGE_10_14',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'c0a7eb20-fb8e-4e70-975f-477d242d0931',
        9,
        'AGE_20_24',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '6eff69c1-a84e-42d6-8e4a-f3aa0ea86f42',
        9,
        'AGE_30_34',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '98e1abfa-b3c1-46ce-af47-6e709d8893ec',
        9,
        'AGE_35_39',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '71f6d924-ec63-43d9-ab15-4ba47cfb39f9',
        9,
        'AGE_35_39',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'e53b0b9a-b357-45e7-a06b-2d7840b164e6',
        9,
        'AGE_40_44',
        'MALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'de5310e2-2801-4dcc-bd53-4dc5fead59db',
        9,
        'AGE_45_49',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '4f19d701-049e-4b36-8bf5-3b377e75bf46',
        9,
        'AGE_50_54',
        'MALE',
        3,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '808bc3c5-55da-44af-8c09-c7d3498fd285',
        9,
        'AGE_5_9',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'a753bf3d-b673-46af-aa1e-0f34a78bffab',
        9,
        'AGE_60_64',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '7c75cde5-b71c-46d4-aabc-fc6605c74f61',
        9,
        'AGE_60_64',
        'MALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '993e37cc-fc20-4ce4-a217-b02ca3c2cab0',
        9,
        'AGE_65_69',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'b63596c4-7a42-47ee-9bc9-486d58a59799',
        9,
        'AGE_65_69',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '8ce87f4c-41b5-492c-b90b-5ff4b2e34851',
        9,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        7,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '632b08eb-2fb1-4edc-b53e-56ac97b012a8',
        9,
        'AGE_75_AND_ABOVE',
        'MALE',
        11,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'e38353ae-14d3-4a15-9cc2-5c436cb13206',
        10,
        'AGE_20_24',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '36d70b9c-9791-4a23-8de0-6bc806b021f7',
        10,
        'AGE_40_44',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '006595fc-31ac-4889-bcef-0943a13ca892',
        10,
        'AGE_45_49',
        'MALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '8d715d3b-2dbb-4dbd-ad31-7f63ef7912c1',
        10,
        'AGE_50_54',
        'MALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'fe882925-8a13-45a0-a622-19bcf1b9b25a',
        10,
        'AGE_55_59',
        'MALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '16406242-d3c6-469e-931c-324914079960',
        10,
        'AGE_60_64',
        'FEMALE',
        2,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'd4d13fe0-c845-49a2-8173-b03d219eef16',
        10,
        'AGE_70_74',
        'MALE',
        3,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'e5c40dfe-2648-4116-9f5d-a7f147cbb21c',
        10,
        'AGE_75_AND_ABOVE',
        'FEMALE',
        1,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    INSERT INTO acme_ward_age_gender_wise_deceased_population 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        'a0509801-5f8c-4008-8f82-c669fdcdc762',
        10,
        'AGE_75_AND_ABOVE',
        'MALE',
        7,
        '2025-06-30 12:02:20',
        '2025-06-30 12:02:20'
    );
    

    END IF;
END
$$;

