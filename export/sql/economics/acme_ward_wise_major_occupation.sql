-- Generated SQL script
-- Date: 2025-06-30 12:15:37


-- Check if acme_ward_wise_major_occupation table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_major_occupation'
    ) THEN
        CREATE TABLE acme_ward_wise_major_occupation (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL,
            occupation TEXT NOT NULL,
            population INTEGER NOT NULL DEFAULT 0 CHECK (population >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_major_occupation) THEN


    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '158ce062-0bc0-4bd5-856f-c9e81594f66a',
        1,
        'OTHER',
        18,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '1e002f41-23d6-4f0e-8b8d-b21894078c0f',
        1,
        'animal_husbandry',
        238,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'ceb50d58-a580-49c0-a118-80268cef55f3',
        1,
        'business',
        17,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'eb051586-77ab-4bee-9863-fac9b77e1749',
        1,
        'foreign_employment',
        222,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '726e3cf2-f72b-43e9-9653-35cc0044f3f1',
        1,
        'governmental_job',
        56,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'd501bc88-8581-4a73-849c-87a7374e3de0',
        1,
        'householder',
        292,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'eb045257-3d60-4661-8f7e-131deb52840f',
        1,
        'industry',
        203,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '2924b366-4df4-47f1-96cc-ca18e3a2abb6',
        1,
        'labour',
        88,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'b0a14f19-b3df-4297-9d16-6dc94813331f',
        1,
        'non_governmental_job',
        7,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '1020a6a3-8ca3-442e-9947-b43b5dc26e2a',
        1,
        'other',
        137,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'e8f4343a-2257-44c6-8b57-85fb0cf7215c',
        1,
        'other_self_employment',
        5,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'c77b3d80-29f4-48c9-97d3-7e5ec32ef854',
        1,
        'other_unemployment',
        35,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '34aa0097-644a-4d58-9238-f0c8b48cf76b',
        1,
        'student',
        172,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'b589e33f-2165-472b-8180-47bea90f595b',
        2,
        'OTHER',
        862,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'aabb5701-f1b1-449a-81d8-7f95892e35b1',
        2,
        'animal_husbandry',
        48,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'e49b30c4-c3a1-4fb0-86a5-92ec1b783bd8',
        2,
        'business',
        69,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'e1d09faf-2cee-4afe-afa2-436930807177',
        2,
        'foreign_employment',
        135,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '47bfef4e-34b9-4059-a174-b9dba7068156',
        2,
        'governmental_job',
        86,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '692af3e5-0b2a-4545-b795-b87f8fcd6905',
        2,
        'householder',
        78,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '39eb3094-ffea-441b-b2e4-a2402707a59c',
        2,
        'industry',
        185,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '23a37c6b-ec64-4e85-a9c1-2e4a29188709',
        2,
        'labour',
        451,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '8b8ff8ae-48fc-428b-a047-c42843239f21',
        2,
        'non_governmental_job',
        52,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'ac243937-9dc1-4074-b397-951a4770c907',
        2,
        'other',
        2,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '260353a0-6fc3-4954-835d-872c919e6218',
        2,
        'other_self_employment',
        20,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'd6b38da4-740c-4287-9cf9-6b6802d458d5',
        2,
        'student',
        5,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '7489d72b-28c4-4d36-8c9a-634886f758fc',
        3,
        'OTHER',
        328,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '15e20f21-1f5e-4385-8566-56ebe9705805',
        3,
        'animal_husbandry',
        43,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '68483764-8032-42bb-9261-9b1d8e4eb3e4',
        3,
        'business',
        66,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '901d659f-195f-482e-be49-c9e5bccdf2c1',
        3,
        'foreign_employment',
        429,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '03cc2053-89d4-4228-ab33-30620424e2f3',
        3,
        'governmental_job',
        44,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'f6158d28-351d-4d25-b67d-9bcbb04fd9bd',
        3,
        'householder',
        196,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'f1e1672e-9c40-4696-8931-b616d17973c4',
        3,
        'industry',
        228,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '09f0e364-112f-4d19-95d4-2bf3ca5ca2c0',
        3,
        'labour',
        286,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'b7d8e096-de30-4b2d-9b57-8e3f663f739a',
        3,
        'non_governmental_job',
        38,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'b4037626-46d6-4032-9935-7898ae762daf',
        3,
        'other',
        31,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '722860d1-73da-450a-a2f9-d27c1a67bc40',
        3,
        'other_self_employment',
        72,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'c91d821e-26b6-4a4d-8403-81a17f3c417b',
        3,
        'other_unemployment',
        2,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '9da5a6ae-7f15-4687-9032-7533b6361a82',
        3,
        'student',
        110,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'd06c50ac-30f7-4561-8afb-85355f38e19b',
        4,
        'OTHER',
        155,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '3f8bf787-1515-4922-863b-36a1648d970d',
        4,
        'animal_husbandry',
        20,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'c1561abb-d75a-4215-ab2b-2b7f3da8cd45',
        4,
        'foreign_employment',
        130,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '475e548c-d6c5-44d0-af6b-a76af79d4172',
        4,
        'governmental_job',
        18,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '7bc20e9f-2c6b-4d2a-b9f1-31e14e601d84',
        4,
        'industry',
        1,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'e13d54b6-6398-46b8-8607-070b07c5741f',
        4,
        'labour',
        34,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'a648b981-93af-4a85-be02-988d4da2871a',
        4,
        'other',
        6,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'f2d0287c-7b9f-4ad9-9cc2-ef887f03bae8',
        4,
        'student',
        1,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'c6db9bdf-b4dd-4e22-a3c1-6b2d3937a9c5',
        5,
        'OTHER',
        46,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'd698ac45-faa4-408f-b2f7-d5e0e44bbed6',
        5,
        'animal_husbandry',
        53,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'c67225d4-9826-4e22-88b9-ead810a8a48f',
        5,
        'business',
        62,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'fce9b23c-5500-4b82-acfa-c56b814e8fec',
        5,
        'foreign_employment',
        512,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '73ce1576-d16c-44e0-97af-13711a74146a',
        5,
        'governmental_job',
        57,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '7be43cc9-ffa5-4ad3-9fac-ff6146b86be8',
        5,
        'householder',
        117,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '81d0bcf7-c7d3-4500-a0d0-42f55beebb42',
        5,
        'industry',
        102,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '74522be8-6559-4801-9a2b-82b9fc8fb21b',
        5,
        'labour',
        335,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '7a19a3c0-9d88-4729-9ac7-00d0b884cc12',
        5,
        'non_governmental_job',
        99,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'd6ec7502-d74e-4788-b10b-633b1baf7bf1',
        5,
        'other',
        55,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '62125b67-526d-4cab-a747-b3df5f88c7b4',
        5,
        'other_self_employment',
        16,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '0c334862-fc1c-478c-96cc-4d9d9f58871b',
        5,
        'other_unemployment',
        2,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '92318d9a-60e1-4c49-9eac-5dbefa303547',
        5,
        'student',
        29,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'a6ab9fb0-294d-4786-b5b8-c4cf118ed490',
        6,
        'OTHER',
        140,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'ee785cf4-717c-4778-963e-137349b261e2',
        6,
        'animal_husbandry',
        75,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '4135166e-6ff1-40c1-b29a-e21c86c4a303',
        6,
        'business',
        57,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '3163fac2-5b24-49e0-8661-0aafbb215fb2',
        6,
        'foreign_employment',
        310,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '4f2655eb-aad9-4186-9adc-43d678533359',
        6,
        'governmental_job',
        26,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'f28a56db-ca32-4603-8a64-09a2c4e2cb6f',
        6,
        'householder',
        2,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '293e4109-fb09-48e9-9031-ace00011baef',
        6,
        'industry',
        159,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'bc340406-725d-423b-a934-bb8e04a0bb74',
        6,
        'labour',
        177,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'dc9fa4f3-b5f2-4786-9789-478857e955b8',
        6,
        'non_governmental_job',
        32,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '7053ede5-d4d6-4acb-980f-ef0d6ae24aa5',
        6,
        'other',
        11,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'f46da34f-fd26-45ed-9406-77158ba45a22',
        6,
        'other_self_employment',
        18,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'efd68095-4ee5-4aee-963c-5a120bf848d8',
        6,
        'other_unemployment',
        1,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'eb140ccb-ca7d-483c-9ddc-0edc7b38746c',
        6,
        'student',
        9,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '26b68346-e718-4e46-b731-e0a90785cb10',
        7,
        'OTHER',
        234,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '1563051a-fa18-4df0-b03b-c8ebda6ccc68',
        7,
        'animal_husbandry',
        15,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'b779cca3-ed22-4f89-a382-5d4d436d1c0f',
        7,
        'business',
        48,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '99263671-b0ad-4293-bd63-eb5140ce3952',
        7,
        'foreign_employment',
        380,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'a38aa033-8af9-4dbd-859c-08910c2d255c',
        7,
        'governmental_job',
        51,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '23a0dcb7-96e0-4607-869a-4c2db0eceb87',
        7,
        'householder',
        485,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'e0141929-8a0f-4c03-91a1-4efbddb41706',
        7,
        'industry',
        487,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'd3938ede-ac2a-4c5f-95a0-ee978a3cec60',
        7,
        'labour',
        88,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '2fa39e9d-73d1-474c-9855-b21a650b084a',
        7,
        'non_governmental_job',
        44,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'a986a47c-959f-471d-b19b-659b68f4028b',
        7,
        'other',
        206,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'd467279d-a2fd-4028-a32c-a530c261d82e',
        7,
        'other_self_employment',
        10,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'd0747870-8096-4bfd-a5b8-db3cbd21aa74',
        7,
        'other_unemployment',
        14,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '394fb659-8e9c-4c93-b056-2551dd459335',
        7,
        'student',
        549,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'dedde3ee-2e4b-48e3-ae91-aa8fbb100c37',
        8,
        'OTHER',
        1337,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'f9d18a94-aef5-4653-b1fa-da8934d6f6ee',
        8,
        'animal_husbandry',
        15,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'c4ab2525-c70a-4792-b336-380720a14f22',
        8,
        'business',
        74,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '91ef393f-c481-4b66-b304-7efcfcf51e59',
        8,
        'foreign_employment',
        242,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '893b2adf-9f2a-4ed3-83b7-0cd0c3088203',
        8,
        'governmental_job',
        43,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '2e183ae7-f0c7-45c3-b973-bf35a1bebbdb',
        8,
        'householder',
        53,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '96581489-7e49-4d62-8f4b-0f8f3b0b6481',
        8,
        'industry',
        196,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'f5596252-470d-4c63-b9ae-8506ddfb961b',
        8,
        'labour',
        132,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '9a4e5e41-b262-4460-8fe4-4175538b6056',
        8,
        'non_governmental_job',
        40,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '1903e26b-ce0f-4767-b383-da4ae4b10e1e',
        8,
        'other',
        32,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '95bf2ee4-829f-4268-a703-10fd6f3f5555',
        8,
        'other_self_employment',
        49,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '674b743c-4955-47b7-9b6e-605271bc5a1e',
        8,
        'student',
        23,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '21d8748a-4205-4470-9ea0-bd79a8c85e06',
        9,
        'OTHER',
        93,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'ffcfbb24-83bc-4152-8933-c5d5e29d196e',
        9,
        'animal_husbandry',
        248,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'f1892f12-eef7-479e-be73-8fb46e59d6c5',
        9,
        'business',
        116,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'c253c408-435e-4f91-9baa-7946eb73c331',
        9,
        'foreign_employment',
        757,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'dc62c11d-2bdf-4b57-8732-9f1d16aceb5b',
        9,
        'governmental_job',
        100,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '8955489a-596d-4ac5-9178-d450a63973c9',
        9,
        'householder',
        763,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '5bc07d25-5643-4f00-bf23-fe4e840ac962',
        9,
        'industry',
        90,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'ce7b92bc-ae6e-4aa7-a32f-4978ef8ab343',
        9,
        'labour',
        342,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '10d46db3-322f-49f2-abfc-c6d85d9ecd0d',
        9,
        'non_governmental_job',
        97,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'edaa9659-0cd2-439d-a1fe-9687c8f534d2',
        9,
        'other',
        30,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '17a421d9-f8cd-4d0c-875b-8efd13390ca5',
        9,
        'other_self_employment',
        122,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '2fd212b1-9a42-49fb-aa58-5b6b57c06138',
        9,
        'other_unemployment',
        152,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'bae209e6-d8c1-41fb-8684-1236896d9c75',
        9,
        'student',
        45,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '11e0879c-be6f-4c1b-9d56-6b9946889cc4',
        10,
        'OTHER',
        14,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '4df28ec7-e701-4a6d-8f05-7b9313de65e9',
        10,
        'animal_husbandry',
        41,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '0d723603-2fa7-4a69-8690-73ba9089e33a',
        10,
        'business',
        242,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '01690134-3e48-4135-976e-1bb3d7f5ca88',
        10,
        'foreign_employment',
        492,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '313eba52-aa1b-46bb-863b-6f06a6dc1dbf',
        10,
        'governmental_job',
        70,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '12edf8c8-e0fa-411a-bf21-418e9fda0627',
        10,
        'householder',
        156,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'ddf76563-0652-49ef-9c1b-fc7d49531541',
        10,
        'industry',
        178,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '9512b42a-aef4-445f-b5a5-140501981a2b',
        10,
        'labour',
        176,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '1f828121-1073-42b4-b86a-938b5a69fa7c',
        10,
        'non_governmental_job',
        94,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '9976068f-f747-4e8a-b980-4281c518e8ef',
        10,
        'other',
        62,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '87e6dc29-1702-4d43-8ef5-7b230d2d8531',
        10,
        'other_self_employment',
        82,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        'c6f6262e-9000-492d-ae5a-f97736e10658',
        10,
        'other_unemployment',
        5,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    INSERT INTO acme_ward_wise_major_occupation 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '31a30966-1a70-4865-8d94-c8035b13cf58',
        10,
        'student',
        71,
        '2025-06-30 12:15:37',
        '2025-06-30 12:15:37'
    );
    

    END IF;
END
$$;

