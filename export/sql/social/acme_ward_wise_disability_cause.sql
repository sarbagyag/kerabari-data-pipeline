-- Generated SQL script
-- Date: 2025-06-30 13:06:15


-- Check if acme_ward_wise_disability_cause table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_disability_cause'
    ) THEN
        CREATE TABLE acme_ward_wise_disability_cause (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            disability_cause TEXT NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_disability_cause) THEN


    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'd1ed48e3-7063-41dc-a6f5-c5729f4e2b4d',
        1,
        'accident',
        11,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '9ed6263e-a640-4c80-8906-9c6c39203406',
        1,
        'congenital',
        19,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'cc4fb2d1-806a-4f06-b03c-d2d6f4aef564',
        1,
        'disease',
        6,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '828c1655-18fc-4efc-9dc7-368afb1a451d',
        1,
        'other',
        1,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'f18b3b11-acc6-44ae-baca-90f0e9eecc4b',
        1,
        'unknown',
        2,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '3500e7a7-33a6-48ed-95ce-ef59b035fad4',
        2,
        'accident',
        5,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'c66de7bc-8ada-45a2-9edd-7ecaa32f6928',
        2,
        'congenital',
        5,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '6556f3f3-98ff-4758-8177-fcd8ae54749d',
        2,
        'disease',
        2,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '2f3edbec-ea37-4630-b069-f166242ee1df',
        2,
        'unknown',
        52,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'a07c7523-8faf-4a12-9102-4592e3a7bd00',
        3,
        'accident',
        15,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'f0cced36-d75b-4f13-81cf-b80fca7ba564',
        3,
        'conflict',
        2,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'd7b376c2-cbf1-45ba-8fce-c0579bc641e4',
        3,
        'congenital',
        22,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '72b7e46e-975e-4551-84af-64b8474bee9e',
        3,
        'disease',
        30,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '729eb523-e84e-40a3-94b2-046bf0e42a4e',
        3,
        'other',
        3,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '18718308-41a1-4df7-a8d8-f1ba3119f7c9',
        3,
        'unknown',
        20,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'd54aef73-8ca2-44e1-b5b9-038f6f773d15',
        4,
        'accident',
        5,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '60a21562-49c6-4312-9a05-b90802fd127e',
        4,
        'congenital',
        31,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '3ea2d915-b415-422d-9af8-e7214e34b180',
        4,
        'disease',
        4,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'd6a52db2-7d99-4c7c-bbf0-1e9d41a81b72',
        4,
        'other',
        4,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'f206a078-4149-4f82-b412-88634bf99d54',
        4,
        'unknown',
        6,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'bcafa41b-d3fc-49a0-888e-e14b689c849f',
        5,
        'accident',
        22,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'a6160c90-77b7-45eb-8681-9aad28b70265',
        5,
        'congenital',
        31,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '9395f955-1ea5-4913-8c14-e78a99fe7948',
        5,
        'disease',
        22,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '17f344c5-0361-48ea-999a-63e4bab0377e',
        5,
        'other',
        6,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'd45e74e6-0bdf-4ad5-a303-8ac5e5a87960',
        5,
        'unknown',
        2,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'e345ceff-50fc-402b-b50d-e309ffefb2b1',
        6,
        'accident',
        10,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '6774912c-f2f6-45eb-81f8-31f547b02f61',
        6,
        'congenital',
        34,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '59d2a879-7cba-4d57-ac5c-79e72b497c81',
        6,
        'disease',
        10,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '6030fb14-25e8-4ac0-a3d7-c341af1ffe37',
        6,
        'malnutrition',
        1,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'a3798870-5221-44f7-94e6-23378df0898d',
        6,
        'other',
        4,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '470ee34b-9bc8-4154-8ec5-33b1f15d2bda',
        6,
        'unknown',
        3,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '9196e434-b771-475e-8fff-2c8f4ae1ae0e',
        7,
        'accident',
        4,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'a48e595f-d4e6-4b34-890f-57b5cc2e90d7',
        7,
        'congenital',
        11,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '26b43c11-5296-410b-8e7b-bff07948ce99',
        7,
        'disease',
        4,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '51ebc576-46ef-4a99-b542-b250187edce9',
        7,
        'other',
        1,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '6c891a52-3583-41af-add5-f60d01002f5b',
        7,
        'unknown',
        4,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '52b95977-fcbd-4928-82a4-cf0fde1fd044',
        8,
        'accident',
        4,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '35e8ae89-b382-4de6-983d-18f0d7c3fac1',
        8,
        'congenital',
        18,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'e0b33966-2f20-4f3d-a92e-36196594d9c1',
        8,
        'disease',
        8,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'c81e4a46-508f-465f-ab9b-594098de5e86',
        8,
        'other',
        3,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '548546cc-3b12-4eb2-ac80-ff3b433b6902',
        8,
        'unknown',
        54,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'e11832a3-e2ad-4b70-baad-9dfebd1135f3',
        9,
        'accident',
        24,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '42f1f7a3-231f-4b0e-9f88-74e9223b3659',
        9,
        'congenital',
        54,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'a3f4cc5c-3c42-4470-81a5-66a8a22b42d4',
        9,
        'disease',
        19,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '3f47a54a-8720-4af7-9ce1-f336072ec436',
        9,
        'other',
        4,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '810598bc-e235-41b5-a497-040b6044e6d2',
        9,
        'unknown',
        5,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '3a155156-5ec4-4370-ac42-cff80bb92aad',
        10,
        'accident',
        11,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'cb637a54-2b7a-434e-b578-c0e3b6c457c3',
        10,
        'congenital',
        37,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '86ef1abc-b92b-4a01-8b53-1bc690ed17e9',
        10,
        'disease',
        24,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    INSERT INTO acme_ward_wise_disability_cause 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        'b388ac93-9305-4127-a11b-8aa7aa045d5a',
        10,
        'other',
        3,
        '2025-06-30 13:06:15',
        '2025-06-30 13:06:15'
    );
    

    END IF;
END
$$;

