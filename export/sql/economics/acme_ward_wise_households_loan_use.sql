-- Generated SQL script
-- Date: 2025-06-30 12:16:21


-- Check if acme_ward_wise_households_loan_use table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_households_loan_use'
    ) THEN
        CREATE TABLE acme_ward_wise_households_loan_use (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL,
            loan_use TEXT NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_households_loan_use) THEN


    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '5e9ab134-db2c-4e87-99ad-ae19ac3a1dd2',
        1,
        'AGRICULTURE',
        70,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '57cffce6-fb4d-41e5-b9b6-7e5c6cae307b',
        1,
        'BUSINESS',
        4,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '3d0a23e8-4b10-4765-a420-ce5e07d894ef',
        1,
        'FOREIGN_EMPLOYMENT',
        18,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '2fe7b779-a105-4bee-8e08-9422ccdf52b6',
        1,
        'HEALTH_TREATMENT',
        12,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'e73cab38-1d48-4157-9a68-b215799d68bc',
        1,
        'HOME_CONSTRUCTION',
        15,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '38945205-f522-4317-8d0b-965d385e2db3',
        1,
        'HOUSEHOLD_EXPENSES',
        30,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '916c7b30-8b12-4147-b2c7-ceb67b00a911',
        1,
        'OTHER',
        85,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'b96a27cd-817b-435d-a767-06ac27686af5',
        2,
        'AGRICULTURE',
        6,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '8016f88c-5cc4-4a65-9df4-39144a694477',
        2,
        'BUSINESS',
        8,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '3c31d662-fd23-4557-a533-892877777bd9',
        2,
        'FOREIGN_EMPLOYMENT',
        4,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'b2b917bd-7952-4fb1-a8f7-f547ce98f579',
        2,
        'HEALTH_TREATMENT',
        3,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '3bb1285a-d44b-4b77-8d9c-1b5534ef2425',
        2,
        'HOME_CONSTRUCTION',
        14,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '6424e878-d680-4a73-bf8d-42c14b51607e',
        2,
        'HOUSEHOLD_EXPENSES',
        55,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '9678a606-dddb-4eea-8cd3-f76b15a7b460',
        2,
        'OTHER',
        16,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'be40e649-3fb7-4155-b359-0d0758b3ecf1',
        3,
        'AGRICULTURE',
        15,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '50f667c0-2cf9-437a-95eb-00489635bdba',
        3,
        'BUSINESS',
        14,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'd7fedb14-ada8-4f59-a897-b4fc196fea05',
        3,
        'CEREMONY',
        2,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '29f95ef7-2910-486a-b7aa-fe52499beebe',
        3,
        'EDUCATION',
        4,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'e97733ce-db6a-4a0b-9a3a-b822ee0d73ab',
        3,
        'FOREIGN_EMPLOYMENT',
        33,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'adce921c-f5ae-4295-abb8-29ac6abe406a',
        3,
        'HEALTH_TREATMENT',
        10,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'f0782dc2-831f-483d-ac71-24e0370257cc',
        3,
        'HOME_CONSTRUCTION',
        33,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'c1ba237b-ac12-4bdc-a8b8-bf00b758bf69',
        3,
        'HOUSEHOLD_EXPENSES',
        36,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '70278c95-fa0f-4b55-a588-2509e31f9f80',
        3,
        'OTHER',
        74,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '11a7bc42-8f7e-4136-9268-31624998dc37',
        4,
        'AGRICULTURE',
        20,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'be535ac9-43ec-44cd-a295-1ce4f2a97f3f',
        4,
        'BUSINESS',
        28,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'b8d41e19-81a1-4386-9740-ac8ee5024e06',
        4,
        'CEREMONY',
        1,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'bbd98828-c022-47f1-8f15-8769bfd34ff1',
        4,
        'FOREIGN_EMPLOYMENT',
        22,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '6d4e62db-d732-4d21-b3ef-69cde5f8e20a',
        4,
        'HEALTH_TREATMENT',
        16,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '022e3035-148b-4846-85f6-23a1681f3e73',
        4,
        'HOME_CONSTRUCTION',
        18,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'e19ca14c-c5be-4be9-b2db-d9f29e9d1b3c',
        4,
        'HOUSEHOLD_EXPENSES',
        67,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '44481c85-faaa-4510-b889-bff95b096dc8',
        4,
        'OTHER',
        19,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '259e31ab-98a4-4a66-8463-e85533e92682',
        5,
        'AGRICULTURE',
        58,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'b97f224a-b63a-4590-b4ad-87899431a197',
        5,
        'BUSINESS',
        24,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'b9961f30-3615-4417-a34c-3392200ece2b',
        5,
        'CEREMONY',
        4,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'f8ddafbf-46ec-4478-b85e-714b59baf4cf',
        5,
        'EDUCATION',
        4,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '3eb318d7-22a3-43f5-bac3-fe7c08543ef3',
        5,
        'FOREIGN_EMPLOYMENT',
        62,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '5579414f-3ecd-4a0b-aef5-5b1a16c5f16d',
        5,
        'HEALTH_TREATMENT',
        13,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'd8402656-e75e-4fdd-9c37-4b2270f6740d',
        5,
        'HOME_CONSTRUCTION',
        59,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'c5abe857-d7d4-4b50-b003-9cdcb359c90e',
        5,
        'HOUSEHOLD_EXPENSES',
        198,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '9e1a4989-46d6-4bd9-9f3c-b2ed0226bf98',
        5,
        'OTHER',
        84,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'd68feae4-9385-41ae-9724-25ecf5df22bd',
        6,
        'AGRICULTURE',
        216,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '9bdee6a9-4e87-4f37-a7e8-8f9eecb5acaf',
        6,
        'BUSINESS',
        28,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '02477a23-42fd-4c90-865a-f593461b5575',
        6,
        'CEREMONY',
        3,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '6161c061-e426-4b82-81f3-3b3861882873',
        6,
        'EDUCATION',
        2,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'faa408df-43c3-4341-ad04-a0120d1d200f',
        6,
        'FOREIGN_EMPLOYMENT',
        20,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'e3f019db-9ada-4eb4-b85a-e0cfde7cca27',
        6,
        'HEALTH_TREATMENT',
        14,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '6ed90d5f-cddc-4aa3-857a-435a951559ad',
        6,
        'HOME_CONSTRUCTION',
        53,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '1275a3eb-aea2-4f40-a4a7-71883cbb1df7',
        6,
        'HOUSEHOLD_EXPENSES',
        64,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '05460e75-cf7c-44fa-a0b7-c2723f79df78',
        6,
        'OTHER',
        46,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '13fcdf3e-1a42-4e31-870b-6e731b34f250',
        7,
        'AGRICULTURE',
        27,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'cdf5fa01-ab6a-439f-98ba-58c72f303d31',
        7,
        'BUSINESS',
        51,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '2f7acc39-1808-4a53-9704-d5946703daad',
        7,
        'CEREMONY',
        8,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'd3145dea-5db3-4dda-8cbd-96c9351b84e6',
        7,
        'EDUCATION',
        11,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '9b98fee2-97a0-448b-9bca-8b616937e08d',
        7,
        'FOREIGN_EMPLOYMENT',
        84,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'e18906b7-0305-4d3c-bf60-b4374ea3ebff',
        7,
        'HEALTH_TREATMENT',
        25,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '75615451-ecd3-40a2-8b4a-d318bb8be8b3',
        7,
        'HOME_CONSTRUCTION',
        133,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '93f9fa4f-aa45-41f1-b127-112201173387',
        7,
        'HOUSEHOLD_EXPENSES',
        100,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '1c9b0234-fdbb-4780-a361-39bb5a1df869',
        7,
        'OTHER',
        43,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'a4a82124-88af-4ebf-a8da-f5843786e0ce',
        8,
        'AGRICULTURE',
        10,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '031b09db-2627-4903-a189-afb3b35745e7',
        8,
        'BUSINESS',
        26,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '61a36271-033a-4e88-ac50-0498219cbbb7',
        8,
        'CEREMONY',
        1,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '6379fae1-1b08-4e59-9deb-a08a59874365',
        8,
        'EDUCATION',
        1,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '0139cfb0-7462-48d3-ad70-a0a075ccc493',
        8,
        'FOREIGN_EMPLOYMENT',
        13,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '67e323aa-324e-42be-97bd-56b5cebb0fca',
        8,
        'HEALTH_TREATMENT',
        4,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '34a267fe-f326-44db-ba8d-e3f9d3ad2c2a',
        8,
        'HOME_CONSTRUCTION',
        37,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'e78f8ca2-46fb-4d1f-bf8b-5763cb8c8311',
        8,
        'HOUSEHOLD_EXPENSES',
        99,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'f9b4929e-db4e-45cc-894e-f6d08b332779',
        8,
        'OTHER',
        18,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '375a812f-c136-4386-9903-6a6fd008f597',
        9,
        'AGRICULTURE',
        57,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'b34278cd-b394-4fec-8453-6c17e7cc5475',
        9,
        'BUSINESS',
        44,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'f815fb7e-135b-498a-9a2d-9cf7343fe79b',
        9,
        'CEREMONY',
        8,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'b3b411af-9bbb-46ef-9d87-a45d16329c54',
        9,
        'EDUCATION',
        17,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '3cbf6e25-89fd-4bd9-a5bf-8673dfff4958',
        9,
        'FOREIGN_EMPLOYMENT',
        112,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '1f6bf8ed-8ffd-46b9-9c83-377303e2c600',
        9,
        'HEALTH_TREATMENT',
        23,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '35b69ae2-06d6-4617-85d3-766dec742701',
        9,
        'HOME_CONSTRUCTION',
        103,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'c7d0c9e8-c933-4e9f-b365-b73632aa971d',
        9,
        'HOUSEHOLD_EXPENSES',
        97,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '7681ef7e-7725-4d12-961e-db3c6d3c2881',
        9,
        'OTHER',
        269,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '14bb605f-c1c1-41c3-9c00-7079d065c1f1',
        10,
        'AGRICULTURE',
        18,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'b32345dc-0a75-4f1a-a4e5-20acd1c90373',
        10,
        'BUSINESS',
        89,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '665f3d94-c837-4d1b-a93a-87b23026a1d9',
        10,
        'EDUCATION',
        6,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '4b8e69d0-1b15-46a7-b305-df828b3723a0',
        10,
        'FOREIGN_EMPLOYMENT',
        42,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '14202181-64d7-49c1-ab3a-5dce0fb92e71',
        10,
        'HEALTH_TREATMENT',
        5,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        'c7a024ac-479e-4289-9c13-8dd24b245501',
        10,
        'HOME_CONSTRUCTION',
        94,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '794b4592-7814-4445-b1bc-a49370dbeacc',
        10,
        'HOUSEHOLD_EXPENSES',
        56,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    INSERT INTO acme_ward_wise_households_loan_use 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '4063b559-ae4b-4de4-b27b-0230ed3fd61a',
        10,
        'OTHER',
        46,
        '2025-06-30 12:16:21',
        '2025-06-30 12:16:21'
    );
    

    END IF;
END
$$;

