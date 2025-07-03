-- Generated SQL script
-- Date: 2025-06-22 14:27:26


-- Check if ward_wise_birth_certificate_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'ward_wise_birth_certificate_population'
    ) THEN
        CREATE TABLE ward_wise_birth_certificate_population (
            id VARCHAR(36) PRIMARY KEY,
            ward_no INTEGER NOT NULL,
            birth_certificate_status VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM ward_wise_birth_certificate_population) THEN


    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '519d7c89-848e-4fa2-b954-c614dfe3de4f',
        1,
        'HAS_CERTIFICATE',
        70,
        NULL,
        NULL,
        70,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '13c4ba93-a82f-450a-a440-f03e60373b67',
        1,
        'NOT_STATED',
        148,
        NULL,
        NULL,
        148,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '853e8e5d-2a95-47a6-8a09-beae543fe5d8',
        1,
        'NO_CERTIFICATE',
        4,
        NULL,
        NULL,
        4,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '4b83b61f-0ea8-4e37-803b-4667fcdcc2cc',
        2,
        'HAS_CERTIFICATE',
        65,
        NULL,
        NULL,
        65,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '31bf8455-e3eb-4794-acb4-1dfb467d4e28',
        2,
        'NOT_STATED',
        6,
        NULL,
        NULL,
        6,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '00776fbf-0a49-4c67-97d9-87b996af36da',
        2,
        'NO_CERTIFICATE',
        13,
        NULL,
        NULL,
        13,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'c17f33c5-dec3-45b7-9e36-341bf96c4203',
        3,
        'HAS_CERTIFICATE',
        80,
        NULL,
        NULL,
        80,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'aaa9e0f6-a311-4140-8ae8-f513164de356',
        3,
        'NOT_STATED',
        20,
        NULL,
        NULL,
        20,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'cfca25a5-cd9c-4798-898b-4edb660c0d71',
        4,
        'HAS_CERTIFICATE',
        60,
        NULL,
        NULL,
        60,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'b6495ad7-951f-446c-bbb6-a1eb799ebf82',
        4,
        'NOT_STATED',
        2,
        NULL,
        NULL,
        2,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '710cc276-767b-4565-9ffc-7186a0fb8094',
        4,
        'NO_CERTIFICATE',
        5,
        NULL,
        NULL,
        5,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '46eee0ef-1b8c-4e92-9864-8150ea16c8b8',
        5,
        'HAS_CERTIFICATE',
        22,
        NULL,
        NULL,
        22,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        'e5cb4eac-1dbe-4490-b927-5d86c74cd1d0',
        5,
        'NOT_STATED',
        23,
        NULL,
        NULL,
        23,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '94a7fde8-e32d-4723-b239-367227b6f368',
        5,
        'NO_CERTIFICATE',
        2,
        NULL,
        NULL,
        2,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '2f46dbc5-0302-4dc0-a8fe-fd6685cdeb43',
        6,
        'HAS_CERTIFICATE',
        88,
        NULL,
        NULL,
        88,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '2e0b17c1-6e66-4f0c-b8ff-4fe63068cffc',
        6,
        'NOT_STATED',
        3,
        NULL,
        NULL,
        3,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '55a1dbbc-462c-44e5-9de0-024a009c5dbe',
        6,
        'NO_CERTIFICATE',
        6,
        NULL,
        NULL,
        6,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '83622f5d-12a4-489d-94e1-fad7487d4ccd',
        7,
        'HAS_CERTIFICATE',
        50,
        NULL,
        NULL,
        50,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '10fa93f0-9b87-4403-8829-c66c4d12e5f4',
        7,
        'NOT_STATED',
        48,
        NULL,
        NULL,
        48,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    INSERT INTO ward_wise_birth_certificate_population 
    (id, ward_no, birth_certificate_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '9ede362b-f3d8-4298-a662-19bb2a6f0b2b',
        7,
        'NO_CERTIFICATE',
        7,
        NULL,
        NULL,
        7,
        '2025-06-22 14:27:26',
        '2025-06-22 14:27:26'
    );
    

    END IF;
END
$$;

