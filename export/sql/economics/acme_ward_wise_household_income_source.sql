-- Generated SQL script
-- Date: 2025-06-30 12:14:24


-- Check if acme_ward_wise_household_income_source table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_household_income_source'
    ) THEN
        CREATE TABLE acme_ward_wise_household_income_source (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL,
            income_source TEXT NOT NULL,
            households INTEGER NOT NULL DEFAULT 0 CHECK (households >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_household_income_source) THEN


    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'c7164fe3-7509-4642-9819-03e53f3f9274',
        1,
        'AGRICULTURE',
        326,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'e8246b42-b20e-4c68-a69c-8fe8a9d72e8c',
        1,
        'BUSINESS',
        33,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '7fd59378-2db2-49c1-b301-5fc921a95abe',
        1,
        'FOREIGN_EMPLOYMENT',
        166,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '5b190401-8163-4ae8-a223-1f51865068e1',
        1,
        'INDUSTRY',
        2,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'd87c9382-afab-4524-b3ee-98f8d6f454fd',
        1,
        'JOB',
        35,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'c8da6eaf-19dc-4715-9dc7-8b07c9e9cc68',
        1,
        'LABOUR',
        67,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '43158072-cfbf-4611-82f8-cbfc7d76bc98',
        1,
        'OTHER',
        3,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '0f61a41d-eb5a-4580-aa42-eb4324b5a687',
        2,
        'AGRICULTURE',
        107,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '7e94100b-30f0-417b-8d59-03d8616d65bd',
        2,
        'BUSINESS',
        21,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '19763e8e-cd71-43da-9aba-c920479504b5',
        2,
        'FOREIGN_EMPLOYMENT',
        22,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'd3f3e3a4-b95a-4f61-a5eb-e27b56b6348f',
        2,
        'JOB',
        19,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'c411b17e-1a33-4917-b278-434cd9a6ac38',
        2,
        'LABOUR',
        17,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '9c0c78c3-1d52-42bb-9f86-a6e35ec5fc44',
        2,
        'OTHER',
        1,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '5bb5e57c-2099-41d7-a2bb-89f4ca3abe1f',
        3,
        'AGRICULTURE',
        343,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '4983bc34-b6fd-48ac-beee-67f211f39c10',
        3,
        'BUSINESS',
        61,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '4e1e79b0-8269-4dd0-a857-9f401e78e295',
        3,
        'FOREIGN_EMPLOYMENT',
        315,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'b6fbc8b9-e303-4673-8e84-19b185830412',
        3,
        'INDUSTRY',
        1,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'bbfcda44-b0ff-47fc-8f87-4ee73d1cb84f',
        3,
        'JOB',
        33,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '484790ee-2e7a-4b7d-8ac2-cce70c65e939',
        3,
        'LABOUR',
        235,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'b4ff9b3d-5609-4f1f-bada-022dd8ac6554',
        3,
        'OTHER',
        17,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '65c9961a-c108-4fd0-879e-9c891b09903a',
        4,
        'AGRICULTURE',
        314,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '775f4b25-5f6e-4e32-af4d-2143c876501f',
        4,
        'BUSINESS',
        3,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'fe9608ec-df38-474e-8a4d-f14047a81cc0',
        4,
        'FOREIGN_EMPLOYMENT',
        121,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '347c697f-1059-4071-aad8-ccedf1a8ec4e',
        4,
        'JOB',
        19,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '2248469d-c9b8-4474-bcec-17d6a23f005e',
        4,
        'LABOUR',
        9,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '597def79-4a48-4a21-9bda-b277d6a27c40',
        4,
        'OTHER',
        5,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'c5e73cfa-fd93-45b5-ac11-1a5f0beb550a',
        5,
        'AGRICULTURE',
        479,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '866a1a3a-95f5-410e-a856-5586316eaefb',
        5,
        'BUSINESS',
        58,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'e2bdff00-6c5f-4497-ad52-72e62372df3a',
        5,
        'FOREIGN_EMPLOYMENT',
        412,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'a807eaa4-26df-4c8f-9742-b5f830960db4',
        5,
        'INDUSTRY',
        2,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '5a264586-ccb0-430f-85c2-560a7151412c',
        5,
        'JOB',
        83,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'c45c842c-6bcf-4d6b-8276-cb7c191e538d',
        5,
        'LABOUR',
        213,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '5b51b28b-83c2-442b-9547-2c7a4e5f22ec',
        5,
        'OTHER',
        33,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '44be2b53-4924-426d-ba8f-0b7089e1e87a',
        6,
        'AGRICULTURE',
        600,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '88d04040-60da-40f8-9280-a706a542f150',
        6,
        'BUSINESS',
        50,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '99827afa-c1b6-4a88-8377-a7760bfa66e6',
        6,
        'FOREIGN_EMPLOYMENT',
        241,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '69f1c116-21af-4761-9c45-22668f768513',
        6,
        'JOB',
        41,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '0832fac3-e77a-45f9-8e33-ea56f93cb54b',
        6,
        'LABOUR',
        155,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'd7eb218f-5aa6-4a5f-84bc-7d7195d83f90',
        6,
        'OTHER',
        38,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '816497b9-3573-4d21-91a1-cf11595e6256',
        7,
        'AGRICULTURE',
        458,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'ce6461ab-c3ed-4275-9410-88be4fdb87a8',
        7,
        'BUSINESS',
        85,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'a63a818c-4712-4315-a134-67a83a905a81',
        7,
        'FOREIGN_EMPLOYMENT',
        255,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '666dab4c-fd36-4d70-a34b-8f49b9b2efec',
        7,
        'INDUSTRY',
        8,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'd605e3dd-7f2b-41ef-b25e-45a89a415e9d',
        7,
        'JOB',
        43,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '579660aa-1a0b-4c00-8a6f-8aefbad86412',
        7,
        'LABOUR',
        81,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '24bbda69-b9d1-4eeb-a746-9ed82f56ec08',
        7,
        'OTHER',
        24,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '317830c0-7404-437b-a356-ceafb231689d',
        8,
        'AGRICULTURE',
        204,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '253faa7a-ce9e-4f70-ae95-a07c1106938d',
        8,
        'BUSINESS',
        54,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '316a870a-532c-4d54-a45d-80c975a10df0',
        8,
        'FOREIGN_EMPLOYMENT',
        220,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '2ef96e82-9f7d-4d38-8fd1-95b5eefd134d',
        8,
        'JOB',
        39,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '3c26793f-c2f8-4575-b6ac-8a6af103f423',
        8,
        'LABOUR',
        88,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'c7a46601-81b8-45f4-acd0-47675dd9636f',
        8,
        'OTHER',
        31,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'e7a8929f-10e1-4a7f-a9ce-aa60418a1fa3',
        9,
        'AGRICULTURE',
        828,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '41bb37aa-eafe-463c-8df6-9757d9b00a9a',
        9,
        'BUSINESS',
        111,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '4a329144-54b4-4dfa-920d-5e091c1e4a8e',
        9,
        'FOREIGN_EMPLOYMENT',
        550,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '4dd002ab-1c1c-43e6-acd3-6fe1543d2c6e',
        9,
        'INDUSTRY',
        1,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '605a69af-e41b-40de-8d78-3309e6213d3b',
        9,
        'JOB',
        94,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '9be0939a-0c7a-474d-aa44-d5d9c67aa8fa',
        9,
        'LABOUR',
        180,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'efaf3f1e-2dd1-4cd2-9f1b-c5b8e03da03b',
        9,
        'OTHER',
        32,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'da424065-a5cf-413d-864e-bf93a9475beb',
        10,
        'AGRICULTURE',
        236,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '5d07a74c-794a-47bb-8d7e-8f153d96197c',
        10,
        'BUSINESS',
        198,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '2ead2d19-953f-4e6c-beca-a905d45c972d',
        10,
        'FOREIGN_EMPLOYMENT',
        398,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'bb2c5129-112a-4ab8-bcf6-0e4aea40e03d',
        10,
        'INDUSTRY',
        1,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '56bb81ae-1dbd-4f37-89d3-7b3d7ff22091',
        10,
        'JOB',
        107,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '40a9c39f-7caa-4a89-8443-101b51ff7a61',
        10,
        'LABOUR',
        103,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    INSERT INTO acme_ward_wise_household_income_source 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        'e38e9cc6-6ee5-43f6-ab31-00418cf0b09c',
        10,
        'OTHER',
        49,
        '2025-06-30 12:14:24',
        '2025-06-30 12:14:24'
    );
    

    END IF;
END
$$;

