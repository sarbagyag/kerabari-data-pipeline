-- Generated SQL script
-- Date: 2025-05-24 12:31:43


-- Check if acme_ward_wise_primary_subject table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_primary_subject'
    ) THEN
        CREATE TABLE acme_ward_wise_primary_subject (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            subject_type VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_primary_subject) THEN


    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b56e8b94-7dfc-45b6-94c4-bc0b18bee5e5',
        1,
        'BOTANY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '456fc31e-8ad1-409a-b8bb-610c952701ce',
        1,
        'ECONOMICS',
        52,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '57eabb53-f1fc-47e5-9970-ff6f58c91d56',
        1,
        'EDUCATION',
        6,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '8d400f57-5843-4f8e-a29a-bd1853332750',
        1,
        'ENGINEERING',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'eca55b52-5fad-4c4e-9107-6822e9fb6061',
        1,
        'ENGLISH',
        27,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '68853ae5-89c8-419b-81b8-220e817e2ebc',
        1,
        'HOME_ECONOMICS',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'a4d4a6e5-5161-40d7-a01c-deb949522e92',
        1,
        'INFORMATION_TECHNOLOGY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'f400b197-a7c9-45a4-b851-636f4647b2a4',
        1,
        'MANAGEMENT',
        36,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '35d21866-3c60-4c6f-b4ad-22b8d731a509',
        1,
        'MEDICINE',
        5,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'd0620c07-28fc-45d3-a275-b0a4b2b37ebc',
        1,
        'NEPALI',
        14,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '3a51151e-86f1-4e81-8c74-147868231759',
        1,
        'OTHER',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '59e010e9-ea52-4f51-8269-a8ebadb52392',
        1,
        'POPULATION_STUDY',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'f35a82b6-e1da-4189-93a0-32d88f5e8ce1',
        1,
        'PSYCHOLOGY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '698eeacb-9e56-4c9b-8d5f-f5bd2f9bf888',
        1,
        'RURAL_DEVELOPMENT',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'cd787c8d-d679-40ad-b045-b2a3ebf373f9',
        1,
        'SCIENCE',
        7,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'caf253a4-ef88-4d24-8165-7a74b091720e',
        1,
        'SOCIAL_SCIENCES',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '9ab32c35-d228-4da3-9651-ac0aa867d0c7',
        2,
        'BIOLOGY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'd145aae2-3e14-441e-a0ac-09d7844b65fd',
        2,
        'BOTANY',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '4ab0d906-0ccf-4046-a5cb-54bf2e242805',
        2,
        'CHEMISTRY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '6080fc1f-1a1b-4124-9589-1e428b478ec6',
        2,
        'COMMERCE',
        23,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '133ebfef-0cb0-4443-94d7-5659afbf34f2',
        2,
        'ECONOMICS',
        109,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'f997ed08-a131-4615-81bc-482cc5e69c6c',
        2,
        'EDUCATION',
        67,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '35f6177e-7a87-467c-821d-e2f386112c12',
        2,
        'EDUCATIONAL_SCIENCE',
        10,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '8f844cac-d1ed-4292-85c0-a04010366e2f',
        2,
        'ENGINEERING',
        32,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '5eb65593-8942-47e9-ab94-4a8f5aad5f28',
        2,
        'ENGLISH',
        99,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'cc55570c-3d1f-47b6-bd01-7aa799dcb7e4',
        2,
        'FORESTRY_AND_AGRICULTRE',
        39,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'a9c549e7-ad0e-4bb3-9e57-95ad4814f11c',
        2,
        'GEOGRAPHY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '53bc1b19-9c7a-41fd-9006-75a0b016f78c',
        2,
        'HISTORY',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '39c77dfa-41b8-407b-b6cd-31020d5b6436',
        2,
        'HOME_ECONOMICS',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'f6b7dd46-ef9f-4cde-b576-5722048b04c3',
        2,
        'HUMANITIES',
        9,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '8cea70e6-ea89-4a47-a8ed-0eefc57038b3',
        2,
        'INFORMATION_TECHNOLOGY',
        8,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '9fa7fa15-6b48-4094-9696-f296f19faba0',
        2,
        'MANAGEMENT',
        183,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'ed112b3f-d412-4d90-a53a-b4a638857735',
        2,
        'MEDICINE',
        29,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '391dc2a1-7145-4b45-92ab-9f7fc22944b5',
        2,
        'NEPALI',
        100,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '7bc09cde-2e21-4740-8db9-85241ffd4860',
        2,
        'OTHER',
        39,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '86063e6a-0490-4a57-a322-afa691f45940',
        2,
        'PHYSICS',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '52f6d631-5279-4812-8e67-9837115b9612',
        2,
        'POLITCAL_SCIENCE',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '40cf18ba-6368-4aed-b439-5910337b44c4',
        2,
        'POPULATION_STUDY',
        5,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '3e07dcd7-3c4e-40ed-99bf-240804b7bfc3',
        2,
        'PSYCHOLOGY',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '485fd0ef-cf46-44bd-8f63-edd137609173',
        2,
        'RURAL_DEVELOPMENT',
        5,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '0ff04a72-4ca3-47b2-98c5-1f2d004ec358',
        2,
        'SCIENCE',
        62,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '85720aa9-58b7-4588-9aac-13973318d7c2',
        2,
        'SOCIAL_SCIENCES',
        13,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'fd58f05d-1572-4c8c-b039-121896feadcc',
        2,
        'STATISTICS',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '89a6399f-8414-46ad-96f0-269263ef9f29',
        2,
        'TOURISM',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '36076200-4edb-4fca-94f3-dcfa8f47b9d8',
        3,
        'CHEMISTRY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '98946eb4-6e3a-43bd-a174-ccfa5da889e6',
        3,
        'COMMERCE',
        6,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'e83f7e7c-84da-4899-9451-78592fd4ad2b',
        3,
        'ECONOMICS',
        24,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'd8013207-5f11-4b82-a691-52e45ccca4b9',
        3,
        'EDUCATION',
        62,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'dc4f71b4-20bc-407d-893a-a07adf59d356',
        3,
        'EDUCATIONAL_SCIENCE',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '814319bb-e48e-40e3-9512-c799c15e5705',
        3,
        'ENGINEERING',
        31,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '660b0b0e-c0a5-4b76-b541-6338741130ae',
        3,
        'ENGLISH',
        73,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '12a7f022-716d-4229-98c6-3a3a6ae64b07',
        3,
        'FORESTRY_AND_AGRICULTRE',
        43,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b78cd50a-b450-4b0b-a9fb-77779109916e',
        3,
        'GEOGRAPHY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '9c25ca57-9aa5-47f9-b601-08a0406bdb71',
        3,
        'HISTORY',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '115dff2f-0579-431a-81ca-e72ff30a0c14',
        3,
        'HOME_ECONOMICS',
        6,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '13c0f5e8-78ce-46c5-980f-045f4c70eba6',
        3,
        'HUMANITIES',
        12,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '2423c0d1-81f1-487c-909f-c2ff6fb1fdb4',
        3,
        'INFORMATION_TECHNOLOGY',
        29,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'e14d1345-6c32-4860-b45e-50ecbaf5cf99',
        3,
        'MANAGEMENT',
        241,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'f16bef1f-dda8-40ad-95a5-541a75e1be0b',
        3,
        'MEDICINE',
        39,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '9619bf73-b3bb-4fea-b668-1d1cb30f311c',
        3,
        'NEPALI',
        70,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'c90184b0-5b1d-4c4d-83df-dea64f500d28',
        3,
        'OTHER',
        75,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '042fe9af-21c7-4925-8b5a-50a3b9ad1b33',
        3,
        'POLITCAL_SCIENCE',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'c3c4188a-e19a-4a41-92fa-21ecda5f946d',
        3,
        'POPULATION_STUDY',
        17,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'a296e756-c3ad-4b72-a3b4-6c724e53a602',
        3,
        'PSYCHOLOGY',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '625bbf6e-9eb0-4043-bc98-a5ce6d40f7a1',
        3,
        'RURAL_DEVELOPMENT',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'bc4e874c-5dd8-4d67-8a3d-44eb47f884ea',
        3,
        'SCIENCE',
        69,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b755a074-9db0-48f6-b58c-f63d9a970d48',
        3,
        'SOCIAL_SCIENCES',
        11,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '112f7bf5-0f15-4327-8457-7dbc4959ac58',
        3,
        'STATISTICS',
        23,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '4c69facd-97e3-40fe-8b76-d538af4bc569',
        4,
        'ECONOMICS',
        14,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '3188a78c-b494-4858-81b0-1ff3e9856142',
        4,
        'EDUCATION',
        13,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '1a229720-471f-434c-ba53-d99f86a156cf',
        4,
        'EDUCATIONAL_SCIENCE',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '7bd14934-2cad-49ab-bd0a-864bfe08be09',
        4,
        'ENGINEERING',
        13,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '381f7dd7-7a16-4891-a854-54860cb885e1',
        4,
        'ENGLISH',
        12,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '97daa83e-643f-483f-a1fc-9fe0d2227f8e',
        4,
        'FORESTRY_AND_AGRICULTRE',
        7,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '3c0f4b02-5ca1-42fe-a78e-a26592ae64d3',
        4,
        'HISTORY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'bc6ac012-0c1d-4e70-b729-a7418f8f062e',
        4,
        'INFORMATION_TECHNOLOGY',
        5,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '5362426f-263b-4c21-a30c-1c9d91dbb036',
        4,
        'MANAGEMENT',
        33,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'cdea3bfc-507c-4d91-80a6-a84f529eef19',
        4,
        'MEDICINE',
        9,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'e07fb6fa-d279-4a25-babf-c2a1a9b84425',
        4,
        'NEPALI',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '1477ca65-a21e-4ee5-b74e-fc71c4d9c97b',
        4,
        'OTHER',
        16,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'abb59d62-1a8c-4929-ba79-953bc14b93d4',
        4,
        'POPULATION_STUDY',
        5,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'd7c90bff-d7e7-46e0-9b73-3d729cd27084',
        4,
        'RURAL_DEVELOPMENT',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b31f55de-199e-4cb5-a56f-cd98d608a022',
        4,
        'SCIENCE',
        5,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '79349379-074a-4f9f-bde5-dfcd4a8a4fe2',
        4,
        'SOCIAL_SCIENCES',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '875a16ec-6894-413e-8058-60182c6d929a',
        4,
        'STATISTICS',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'ed3824bd-0894-4b9b-8529-9eab4d3b5cdb',
        5,
        'BIOLOGY',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b6413850-c570-43b1-8ea7-8eca97b61fb8',
        5,
        'EDUCATION',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b3cd7bbb-7227-4b85-b04b-798d36efca46',
        5,
        'EDUCATIONAL_SCIENCE',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'e320b6ba-a8ec-4749-bd2c-b033e72e7cc1',
        5,
        'ENGLISH',
        6,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '1524128e-86bb-4f11-9e0b-f835b428fac9',
        5,
        'FORESTRY_AND_AGRICULTRE',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '52f314dd-ae11-49b3-b177-105cf1c93304',
        5,
        'HOME_ECONOMICS',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '7441f6fe-d976-4ccf-8270-d8d14fa95f0d',
        5,
        'INFORMATION_TECHNOLOGY',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '927515e5-44eb-4ccc-b44a-ab043a5a9c34',
        5,
        'MANAGEMENT',
        10,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '5ca54ff1-4b04-4c20-b826-4aae3934ac81',
        5,
        'MEDICINE',
        5,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '90a6384a-26bd-4dc9-bac2-ff257f6d4a0e',
        5,
        'NEPALI',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'a92aad10-800a-446b-ae4b-623f203c8027',
        5,
        'OTHER',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'cb4eb0ee-1925-4842-b414-27c302e6db57',
        5,
        'PHYSICS',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '4337f181-f4e5-4d2c-bf9f-1e782a3914ee',
        5,
        'POPULATION_STUDY',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'a3cb07c1-f96c-45f0-913f-328f5d3e3708',
        5,
        'PSYCHOLOGY',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'd5032e92-594b-4d7f-9fef-d4b1a29cae94',
        5,
        'SCIENCE',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '29860bd4-99b0-4878-ab39-60905625040a',
        6,
        'COMMERCE',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '9f62e416-da08-4e5b-bc60-2d4f67d8501a',
        6,
        'ECONOMICS',
        7,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b83f307e-7ed1-4d39-a3a8-a107463a4bbe',
        6,
        'EDUCATION',
        9,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '6330e592-f844-4d20-9779-b1263a84e1a4',
        6,
        'EDUCATIONAL_SCIENCE',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '61744266-5b26-46b1-b499-18ed17f0c58d',
        6,
        'ENGINEERING',
        5,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '59ce739e-4b00-4617-b0d3-051febd302f0',
        6,
        'ENGLISH',
        24,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '68bc02dd-d6b9-4dd0-b971-030620f35ef3',
        6,
        'HUMANITIES',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '9932d6a8-aa43-4f04-92f9-492815944909',
        6,
        'INFORMATION_TECHNOLOGY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '76aeb910-356f-4fab-8847-87393e4b5806',
        6,
        'MANAGEMENT',
        20,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'ebcccb87-6dc0-4aba-a8bb-ca7b1b7fef52',
        6,
        'MEDICINE',
        8,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '7fb015c4-7946-4bf2-bacf-7179bafc6c11',
        6,
        'NEPALI',
        19,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '448e5caa-2b78-48a6-8045-de98f35d1547',
        6,
        'OTHER',
        9,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'dae85ca8-5f46-4b72-9715-11b9041b9bf7',
        6,
        'POPULATION_STUDY',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b8e0a2d2-09e7-4161-928d-ec1a473297f4',
        6,
        'PSYCHOLOGY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '56f1254a-eb56-44d0-bb4b-d392fcb70e5f',
        6,
        'RURAL_DEVELOPMENT',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '1ffd33ac-37e5-4768-80ce-1fcc27a4c206',
        6,
        'SCIENCE',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'f07fd013-a1b9-4ec8-a7bb-153f1cb463dd',
        6,
        'SOCIAL_SCIENCES',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '213e255d-e32c-4413-9256-1854152c6d3e',
        7,
        'BIOLOGY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '08ada18c-0754-4015-8eb6-c66fbb2e1865',
        7,
        'ECONOMICS',
        56,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'fc966536-819a-4d6a-9ac9-970719fcfa74',
        7,
        'EDUCATION',
        7,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'ecc5d508-931e-4279-85ad-b58eed4267b5',
        7,
        'EDUCATIONAL_SCIENCE',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '4160182d-203b-4733-af2d-5672d2484cc2',
        7,
        'ENGINEERING',
        16,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '6afc4022-8799-457e-a0d3-df563b3b8fb4',
        7,
        'ENGLISH',
        9,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'ecbb9ba4-6c1e-433d-9994-7dce5c9b7804',
        7,
        'FORESTRY_AND_AGRICULTRE',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '446e179b-8c78-4cc4-be99-063d11742f16',
        7,
        'HUMANITIES',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '0fa3b299-ae86-4a18-b8be-e2674a07c551',
        7,
        'MANAGEMENT',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b1b5b7e8-c0a9-4f24-bdf9-7aa834abbf13',
        7,
        'MEDICINE',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '1678fda3-f425-48bd-850d-1cc6cc5c361b',
        7,
        'NEPALI',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'b66c20e4-c1b1-4b70-87e5-c1d95b3de9b3',
        7,
        'OTHER',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '7c1cb2cc-1c45-47c3-b7e4-fc672c52e00c',
        7,
        'POLITCAL_SCIENCE',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'a0fb7ecb-1fcc-4b02-a20d-b212e437e543',
        7,
        'POPULATION_STUDY',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '8542f4a7-3ba1-4723-ac1b-5ca53be7ede5',
        7,
        'SCIENCE',
        5,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'e58e24f9-6db7-48bc-8324-5a98fa73980d',
        8,
        'COMMERCE',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '3e56746b-8df3-4f42-a491-7b43c7b0f5da',
        8,
        'ECONOMICS',
        16,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '79212499-c3f9-4755-9c1e-54f70d024a26',
        8,
        'EDUCATION',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'a723ae10-0480-464c-a258-578241839c44',
        8,
        'ENGINEERING',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '94cc4635-c8bf-4523-ab2b-004c3aec864e',
        8,
        'ENGLISH',
        3,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '32d3ae75-837b-486d-a6f8-02995a96d49f',
        8,
        'HISTORY',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '1e2e2dbd-caa0-4ca8-bc60-d136a8e36447',
        8,
        'MANAGEMENT',
        6,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '8d699723-8ac3-4f07-83c5-2ef57c4727ff',
        8,
        'MEDICINE',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'e07e9fc5-4bdd-4686-8efd-83e3dfa70cd8',
        8,
        'NEPALI',
        4,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'c5ee486e-434c-4a21-a868-05fffa8d8c78',
        8,
        'OTHER',
        1,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    INSERT INTO acme_ward_wise_primary_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '7fefd542-98fa-42c1-9025-047cad8942a2',
        8,
        'SCIENCE',
        2,
        '2025-05-24 12:31:43',
        '2025-05-24 12:31:43'
    );
    

    END IF;
END
$$;

