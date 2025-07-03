-- Generated SQL script
-- Date: 2025-06-30 13:05:35


-- Check if acme_ward_age_gender_wise_first_marriage_age table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_age_gender_wise_first_marriage_age'
    ) THEN
        CREATE TABLE acme_ward_age_gender_wise_first_marriage_age (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            first_marriage_age_group VARCHAR(100) NOT NULL,
            gender VARCHAR(50) NOT NULL,
            population INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_age_gender_wise_first_marriage_age) THEN


    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '589571d1-dab2-4d21-8149-dbee7c9c6f5e',
        1,
        'FEMALE',
        'AGE_0_14',
        18,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '0d460230-d3b8-4800-94cc-355a9d324195',
        1,
        'FEMALE',
        'AGE_15_19',
        265,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5e92b126-247a-46e9-8035-4879a5b5b93c',
        1,
        'FEMALE',
        'AGE_20_24',
        282,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '40f65759-ef43-4959-b832-61dd8a1fe414',
        1,
        'FEMALE',
        'AGE_25_29',
        63,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5c022d38-c4b0-4332-8f5e-367472e7ed3b',
        1,
        'FEMALE',
        'AGE_30_34',
        12,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '721922b2-f6f6-4dc5-9368-2cccf05654be',
        1,
        'FEMALE',
        'AGE_35_39',
        6,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '01049620-5c6a-48e0-a048-20347aadf877',
        1,
        'FEMALE',
        'AGE_40_44',
        2,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '92b21752-04f7-476e-b01a-86df55c14bb9',
        1,
        'FEMALE',
        'AGE_45_49',
        2,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '73140b90-e1c7-476f-8b4c-5f115672a9ae',
        1,
        'FEMALE',
        'AGE_50_54',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'd3f33528-4515-429b-9b64-004b541a40a4',
        1,
        'MALE',
        'AGE_0_14',
        6,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '09ad5f26-6e1e-4eb7-b9ac-cfbf00f0d87a',
        1,
        'MALE',
        'AGE_15_19',
        132,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '1076e3a3-a66f-4270-9231-93f5649fec09',
        1,
        'MALE',
        'AGE_20_24',
        287,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5cb62c05-c37a-4229-bcde-c39aec8326f9',
        1,
        'MALE',
        'AGE_25_29',
        124,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '9b64d5ad-ff97-4241-9661-06cd567cb5ce',
        1,
        'MALE',
        'AGE_30_34',
        25,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '494223b1-35ba-44dc-a251-c613859a0105',
        1,
        'MALE',
        'AGE_35_39',
        8,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '9073b482-722f-46f1-a099-d09e057081c6',
        2,
        'FEMALE',
        'AGE_0_14',
        8,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '57ac2a2e-d1d6-4331-8059-df44729a88cd',
        2,
        'FEMALE',
        'AGE_15_19',
        113,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5e55173e-24b4-464e-89c3-513f3ed09958',
        2,
        'FEMALE',
        'AGE_20_24',
        351,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '434aa13c-e13d-474f-a47e-6f115d636ea9',
        2,
        'FEMALE',
        'AGE_25_29',
        56,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '64c2a3b2-d309-4920-b066-22df9ea735c4',
        2,
        'FEMALE',
        'AGE_30_34',
        38,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'b2725834-f092-4fae-b29a-ea6c9142e853',
        2,
        'MALE',
        'AGE_0_14',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '8df36141-81f8-4d49-969e-15db69fe72bb',
        2,
        'MALE',
        'AGE_15_19',
        66,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '21536975-8a94-44f2-8d55-d74d5bb39d59',
        2,
        'MALE',
        'AGE_20_24',
        289,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ba4f6f20-b6ff-49e8-adf8-1720bc17784c',
        2,
        'MALE',
        'AGE_25_29',
        54,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '1f742ceb-2d0a-44cb-bfd4-8fd0bfb1dbde',
        2,
        'MALE',
        'AGE_30_34',
        18,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '9fe99476-18ae-442b-be36-0d7f3ddeb64f',
        2,
        'MALE',
        'AGE_35_39',
        7,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '96740c8c-a999-4cb6-ba06-385b3866c8aa',
        3,
        'FEMALE',
        'AGE_0_14',
        49,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '9d716ad9-bd63-4dff-9988-f04b5d04472c',
        3,
        'FEMALE',
        'AGE_15_19',
        555,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ff839ece-5c7e-4523-b786-3d9f387f9d15',
        3,
        'FEMALE',
        'AGE_20_24',
        355,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '63d58544-0d54-4b9e-a2a4-1831b7791dff',
        3,
        'FEMALE',
        'AGE_25_29',
        110,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ad1e6077-4a2d-4bf4-801e-404a4077de1a',
        3,
        'FEMALE',
        'AGE_30_34',
        22,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '795051e4-550d-42c6-8fa6-a9166fe29513',
        3,
        'FEMALE',
        'AGE_35_39',
        6,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '47057b06-1aa5-45f8-a982-1421d4c1bfb8',
        3,
        'FEMALE',
        'AGE_40_44',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '2066e6e9-f612-403e-8bad-71d6dde2df96',
        3,
        'FEMALE',
        'AGE_45_49',
        3,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'bbd46c22-4b7e-4a4d-be21-75af5728ffe7',
        3,
        'MALE',
        'AGE_0_14',
        9,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'b6ed8bc6-91a6-43b4-b08c-b570fd497609',
        3,
        'MALE',
        'AGE_15_19',
        222,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '547dd2d9-dba7-4082-b532-40ca16768f05',
        3,
        'MALE',
        'AGE_20_24',
        414,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'eb579325-c0c8-4fe7-b725-7a59d0489bd5',
        3,
        'MALE',
        'AGE_25_29',
        206,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '8cd69fa8-2235-443b-813c-01f0dc0703d8',
        3,
        'MALE',
        'AGE_30_34',
        62,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '28dea525-9573-4b0d-80e6-6aac34f31cb0',
        3,
        'MALE',
        'AGE_35_39',
        8,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'a7b0c743-9638-4e7c-b65a-f5b7126ac5cb',
        3,
        'MALE',
        'AGE_40_44',
        5,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '9627e661-e2e0-4b82-8dad-92db303fe816',
        3,
        'MALE',
        'AGE_50_54',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '92bd7e2e-7656-4113-bcf9-a0e7778a2dcc',
        4,
        'FEMALE',
        'AGE_0_14',
        24,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'f7e89f44-e520-49ee-b06a-564bf4f1df39',
        4,
        'FEMALE',
        'AGE_15_19',
        220,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'abbd20b9-724e-4486-9644-46c405a9a963',
        4,
        'FEMALE',
        'AGE_20_24',
        208,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'c838a17b-0d88-44ca-9ef7-ac9c90855445',
        4,
        'FEMALE',
        'AGE_25_29',
        55,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '102238b3-fa59-4fbd-a651-028ac819ab6e',
        4,
        'FEMALE',
        'AGE_30_34',
        9,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '92442c78-72c6-4222-a158-6792395224e1',
        4,
        'FEMALE',
        'AGE_35_39',
        7,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'e1ebbf17-b732-4de8-922e-5f5608f8eb6a',
        4,
        'FEMALE',
        'AGE_40_44',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '4aec2e71-5331-4210-9f23-58a56aeb5e80',
        4,
        'MALE',
        'AGE_0_14',
        11,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '2fcd0141-0f32-44e3-a02b-72c4acf2a486',
        4,
        'MALE',
        'AGE_15_19',
        101,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '7fa467fd-7841-4333-9d7e-af5a9daed220',
        4,
        'MALE',
        'AGE_20_24',
        205,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'f625bf4c-c85a-4e65-a1a9-a59686858ef2',
        4,
        'MALE',
        'AGE_25_29',
        95,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '4ad8851f-277f-4b6a-969b-cf8478fdfb71',
        4,
        'MALE',
        'AGE_30_34',
        28,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '114e82b3-3f3c-4b7e-8532-032ed9d6d70e',
        4,
        'MALE',
        'AGE_35_39',
        11,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '71f66478-2526-4bca-aad5-966b2c7dd573',
        4,
        'MALE',
        'AGE_40_44',
        3,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ba4dfb0c-15d4-409b-98eb-8f6e3684fa0b',
        4,
        'MALE',
        'AGE_45_49',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'e672bae5-c5a4-41d0-9b24-d733475ff7ab',
        4,
        'MALE',
        'AGE_50_54',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'e5a7809d-baf4-4569-af09-e73c57085eba',
        5,
        'FEMALE',
        'AGE_0_14',
        76,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'e92006d7-d919-46c7-b2f3-92ec91af7080',
        5,
        'FEMALE',
        'AGE_15_19',
        596,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '093cd2f5-ab48-470b-8ed6-ed6c958c7e0e',
        5,
        'FEMALE',
        'AGE_20_24',
        458,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'e600b85a-5de5-4f88-be94-e366011a5cc3',
        5,
        'FEMALE',
        'AGE_25_29',
        126,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'c8e8a168-daa4-43f7-8eaa-429a57ec837d',
        5,
        'FEMALE',
        'AGE_30_34',
        35,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'c480b017-6915-4fdd-9f82-0971529fb552',
        5,
        'FEMALE',
        'AGE_35_39',
        12,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '3f7cdc20-8b6a-4899-a4cd-1723d7f96d96',
        5,
        'FEMALE',
        'AGE_40_44',
        5,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'aed5ebb3-2966-4a4b-9f3d-b678b30d2dfc',
        5,
        'FEMALE',
        'AGE_45_49',
        2,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'a8d970f8-a1c7-4ef6-938c-c025d5dada29',
        5,
        'MALE',
        'AGE_0_14',
        10,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'd713712b-b156-4673-9326-43ce121963fa',
        5,
        'MALE',
        'AGE_15_19',
        275,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'a363f0ea-0b0d-4a3f-9b48-8c48aa46226a',
        5,
        'MALE',
        'AGE_20_24',
        528,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '2eb09fe7-c755-492f-9cc6-64d543c18693',
        5,
        'MALE',
        'AGE_25_29',
        239,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '266030af-96a1-4501-b313-9f3fb94eaa94',
        5,
        'MALE',
        'AGE_30_34',
        84,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '84941211-9e0a-4952-868a-1c024226117a',
        5,
        'MALE',
        'AGE_35_39',
        19,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '25dbc4ee-a537-4fea-8300-1ae4d4212f09',
        5,
        'MALE',
        'AGE_40_44',
        6,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '8428a4be-2979-4b68-af19-6f06a10dec86',
        5,
        'MALE',
        'AGE_45_49',
        3,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '4f21a36b-cfcb-46d3-a741-dc1aaa93bcf8',
        5,
        'MALE',
        'AGE_50_54',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '2368fe51-4d63-4c4b-b640-c223a5e42f9d',
        6,
        'FEMALE',
        'AGE_0_14',
        79,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '7a5fce21-dca7-4ba7-a52d-93b04de1dd2a',
        6,
        'FEMALE',
        'AGE_15_19',
        657,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '29ba1186-99eb-48d8-aa66-199efe196f58',
        6,
        'FEMALE',
        'AGE_20_24',
        418,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '212d42b6-497b-4b17-a9fc-629c5b774f97',
        6,
        'FEMALE',
        'AGE_25_29',
        96,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5048106e-0676-448d-8953-2bb758e68cd6',
        6,
        'FEMALE',
        'AGE_30_34',
        29,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '40ea3910-7000-4c39-97d4-1d40d6ef5551',
        6,
        'FEMALE',
        'AGE_35_39',
        14,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '1b77e238-ef32-4b2c-bc24-84a8bd9afe23',
        6,
        'FEMALE',
        'AGE_40_44',
        8,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '6482b2a5-e788-4a11-8888-2c92fd1a4daa',
        6,
        'FEMALE',
        'AGE_45_49',
        8,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '1a967536-65be-47fe-81ee-5e8febfc859c',
        6,
        'FEMALE',
        'AGE_50_54',
        4,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '18605c5a-545b-420f-b850-5a91fe45564e',
        6,
        'FEMALE',
        'AGE_55_59',
        6,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'f5f92238-b1f9-4741-9c8a-cb609af615d9',
        6,
        'FEMALE',
        'AGE_60_AND_ABOVE',
        11,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'd913f0e7-8516-4e2a-9c1f-df556eee8ace',
        6,
        'MALE',
        'AGE_0_14',
        16,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ad9a15dd-87a0-47a9-8d4a-0bfa553f3d95',
        6,
        'MALE',
        'AGE_15_19',
        270,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'a7adb36e-8588-4263-9cca-16034014e463',
        6,
        'MALE',
        'AGE_20_24',
        452,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5b3827e0-e11a-4a81-87e6-21aab16dcc4a',
        6,
        'MALE',
        'AGE_25_29',
        245,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '6366a805-d2b8-4dea-a401-49ae75a40e31',
        6,
        'MALE',
        'AGE_30_34',
        78,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'fbca924c-24ec-4d93-bc91-a72c97286e1e',
        6,
        'MALE',
        'AGE_35_39',
        25,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5e2c6b2d-28f2-44f3-9df0-e25e19eed68a',
        6,
        'MALE',
        'AGE_40_44',
        6,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'bea58090-33d8-4f23-9e00-893349b9f9f6',
        6,
        'MALE',
        'AGE_45_49',
        3,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '27ba2dfd-780a-4b21-a05b-a2dabf4e944b',
        6,
        'MALE',
        'AGE_50_54',
        5,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '6c3ca208-f6d5-40b4-9745-e7c5084ede46',
        6,
        'MALE',
        'AGE_55_59',
        3,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '2227937c-2b12-4213-962e-91ed90460301',
        6,
        'MALE',
        'AGE_60_AND_ABOVE',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '13f2e46e-74f0-4280-b81a-22325e861686',
        7,
        'FEMALE',
        'AGE_0_14',
        78,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '9f7e0c84-c9c9-470b-ae4f-6572b2fa3994',
        7,
        'FEMALE',
        'AGE_15_19',
        524,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '4b4dde3d-f0ad-467e-9078-7901ba40a861',
        7,
        'FEMALE',
        'AGE_20_24',
        499,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'c1e68886-a98d-400a-ae7d-b6b70b3b2367',
        7,
        'FEMALE',
        'AGE_25_29',
        136,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '903c43c4-2204-4c56-961e-dc3f72bc1a30',
        7,
        'FEMALE',
        'AGE_30_34',
        35,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '4ce9f772-e307-4e2b-86bc-e22a57668a9a',
        7,
        'FEMALE',
        'AGE_35_39',
        15,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '18700dd5-8bb9-4db6-828a-e2ba32a20a0c',
        7,
        'FEMALE',
        'AGE_40_44',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'b3c1a7c2-7be5-4274-bdec-d27aa9f00235',
        7,
        'FEMALE',
        'AGE_45_49',
        4,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ebb4eda2-ec17-4d7a-a767-4cbf3ae2e2be',
        7,
        'FEMALE',
        'AGE_50_54',
        2,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '0fc94c50-5873-405d-9f28-bba8cc62aa8d',
        7,
        'FEMALE',
        'AGE_55_59',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'a3c41ebe-2a71-4370-a709-2cdc573ebe10',
        7,
        'MALE',
        'AGE_0_14',
        14,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ef1d059c-d9f9-448a-bb44-9de24cdd0679',
        7,
        'MALE',
        'AGE_15_19',
        257,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '0fae4ddb-2ac7-41c4-9233-3fb3fb5e727a',
        7,
        'MALE',
        'AGE_20_24',
        393,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '7c1452b5-22c9-4f86-b079-be0052145b17',
        7,
        'MALE',
        'AGE_25_29',
        308,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'adc3f750-bbba-4b46-8c5e-b5559d7b3afb',
        7,
        'MALE',
        'AGE_30_34',
        111,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '9fd3a139-204c-4f00-8780-8a64c92dc45e',
        7,
        'MALE',
        'AGE_35_39',
        35,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '9ac782a3-4e39-4967-ac96-26596b90abfd',
        7,
        'MALE',
        'AGE_40_44',
        8,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '6f3b3ea4-704c-44f8-9f96-117004731583',
        7,
        'MALE',
        'AGE_45_49',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '211f9c7f-bc58-473e-af0c-796944f6b87b',
        7,
        'MALE',
        'AGE_50_54',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '2e80dbb6-75d2-4167-97fb-3431d982ca7b',
        8,
        'FEMALE',
        'AGE_0_14',
        68,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ccae6e3f-3510-4c4d-9200-6ba1f191b324',
        8,
        'FEMALE',
        'AGE_15_19',
        529,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'e1dbb62f-61a1-4fb4-baaa-6805bf38fce1',
        8,
        'FEMALE',
        'AGE_20_24',
        616,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '7f65e4da-b6ba-4b17-8e03-c7971446144b',
        8,
        'FEMALE',
        'AGE_25_29',
        118,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'b1e35e5e-144d-4aaf-adc3-47a6ef97e884',
        8,
        'FEMALE',
        'AGE_30_34',
        42,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '4139620d-0d60-460d-8a59-4ae834069c85',
        8,
        'FEMALE',
        'AGE_35_39',
        15,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'a6d1ba84-ae7c-4f40-abba-9cd9e59d6ebc',
        8,
        'FEMALE',
        'AGE_40_44',
        2,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '69b75f57-8e4c-422c-96cb-c0846561b5e8',
        8,
        'FEMALE',
        'AGE_45_49',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '21b0f2df-3ce4-47da-85ef-937827dc9875',
        8,
        'MALE',
        'AGE_0_14',
        11,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '846db732-e311-4791-a856-450da51842e6',
        8,
        'MALE',
        'AGE_15_19',
        176,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'eca946b5-49b1-4b27-a107-680e8310ec26',
        8,
        'MALE',
        'AGE_20_24',
        493,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '1dc0168c-4a0d-441c-8239-f645658330b3',
        8,
        'MALE',
        'AGE_25_29',
        236,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'b9580849-9e65-4ab4-99a5-0383a9e41aae',
        8,
        'MALE',
        'AGE_30_34',
        60,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'c29b1f6b-cef3-4b1a-95c6-72296ac8b034',
        8,
        'MALE',
        'AGE_35_39',
        25,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'f13e9b66-7bcc-483e-bc8f-1571c6d9637c',
        8,
        'MALE',
        'AGE_40_44',
        7,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'efc5a779-9a7c-44fd-8776-fb4f5746031d',
        8,
        'MALE',
        'AGE_45_49',
        3,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5fa557c2-5cdf-4044-bc8f-26899bbc2fba',
        9,
        'FEMALE',
        'AGE_0_14',
        141,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '4437b862-0c1f-4b25-9809-c55cfc27db70',
        9,
        'FEMALE',
        'AGE_15_19',
        975,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '1eb38859-27c1-4f41-bb52-372b4cba0468',
        9,
        'FEMALE',
        'AGE_20_24',
        588,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'd747b88b-90d7-4c65-a253-683455df0ef1',
        9,
        'FEMALE',
        'AGE_25_29',
        142,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'd3caabfa-f05b-4b36-b5bd-f69d97f9c66d',
        9,
        'FEMALE',
        'AGE_30_34',
        34,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'eda09ada-d77c-4ec2-94cf-f26e2fd82265',
        9,
        'FEMALE',
        'AGE_35_39',
        10,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '0ca5f80d-5cca-4063-92ca-94c8a90784da',
        9,
        'FEMALE',
        'AGE_40_44',
        2,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5ef1e764-cbb2-454a-9d31-f2361a557ae3',
        9,
        'FEMALE',
        'AGE_45_49',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '2a29b84e-c866-4538-9bbf-055c947a188f',
        9,
        'FEMALE',
        'AGE_50_54',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '61c49b07-2099-43ca-ad94-2049f93b9c8b',
        9,
        'FEMALE',
        'AGE_60_AND_ABOVE',
        2,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5d18b800-8909-4a01-afd9-b2f750784143',
        9,
        'MALE',
        'AGE_0_14',
        26,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'c05a611d-82ca-4f75-8958-04785140c21b',
        9,
        'MALE',
        'AGE_15_19',
        368,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '9aa76432-c8c1-4768-9026-768403f46183',
        9,
        'MALE',
        'AGE_20_24',
        640,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '7c970426-c4c4-4c60-9f6e-599ae9d6d580',
        9,
        'MALE',
        'AGE_25_29',
        393,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '7e37cdb9-7b1a-4f33-8e8a-aa2851c7d1bb',
        9,
        'MALE',
        'AGE_30_34',
        125,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'f7b29718-7fed-4d61-b2c3-27148657d8e8',
        9,
        'MALE',
        'AGE_35_39',
        25,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ee9a00a2-8260-436f-9651-8fbcd2fe51d0',
        9,
        'MALE',
        'AGE_40_44',
        5,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '81f1f5a6-dc45-4dea-833f-fd17edf3f193',
        9,
        'MALE',
        'AGE_45_49',
        7,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'fc9b233b-4210-4635-b3f1-3fccae3786af',
        9,
        'MALE',
        'AGE_50_54',
        2,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'dd624ae2-068c-40af-b637-18ae52c854d6',
        9,
        'MALE',
        'AGE_60_AND_ABOVE',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'f56f37f4-949b-410b-8ba4-7fe6ab23334e',
        10,
        'FEMALE',
        'AGE_0_14',
        55,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '8889b3e0-c034-4902-96eb-6d3720b6f5b5',
        10,
        'FEMALE',
        'AGE_15_19',
        601,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'f1964a38-de8f-4923-b8a2-9cd142432051',
        10,
        'FEMALE',
        'AGE_20_24',
        390,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '18894464-fb1c-4893-811c-8b3ee27de1e9',
        10,
        'FEMALE',
        'AGE_25_29',
        112,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'fccd3076-d8eb-4459-a21a-23fe8f626de0',
        10,
        'FEMALE',
        'AGE_30_34',
        35,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '22f36c0b-9259-4ed9-aee2-f508f680da24',
        10,
        'FEMALE',
        'AGE_35_39',
        7,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '3f1557a1-c26f-4673-b065-bf543680355b',
        10,
        'FEMALE',
        'AGE_40_44',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'c1065e0e-4e5a-408d-9b1c-29b0309360ae',
        10,
        'FEMALE',
        'AGE_45_49',
        2,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'ecbb279a-7064-4b2b-a6a2-703a87479d20',
        10,
        'MALE',
        'AGE_0_14',
        7,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'f27a64c9-1174-47c1-b2c5-baae88525819',
        10,
        'MALE',
        'AGE_15_19',
        295,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'c084483a-9d6c-41e7-8c46-da808924a108',
        10,
        'MALE',
        'AGE_20_24',
        401,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'f1e9735d-1f49-48e9-bffb-9b5ff6f5696f',
        10,
        'MALE',
        'AGE_25_29',
        257,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '504d01dc-7733-4444-ab52-72be82dee7d6',
        10,
        'MALE',
        'AGE_30_34',
        89,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'cbe5e560-4503-4189-a8a6-9e303b8e634d',
        10,
        'MALE',
        'AGE_35_39',
        17,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        'fb142cd9-f6c5-4562-9cb6-2e622e351dc6',
        10,
        'MALE',
        'AGE_40_44',
        3,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '25d0bd3c-1d22-4513-9c2e-3681c6341574',
        10,
        'MALE',
        'AGE_45_49',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    INSERT INTO acme_ward_age_gender_wise_first_marriage_age 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '5a694e1d-e40f-4aa8-a3ae-094a6016837b',
        10,
        'MALE',
        'AGE_50_54',
        1,
        '2025-06-30 13:05:35',
        '2025-06-30 13:05:35'
    );
    

    END IF;
END
$$;

