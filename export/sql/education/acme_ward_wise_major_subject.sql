-- Generated SQL script
-- Date: 2025-06-30 12:45:31


-- Check if acme_ward_wise_major_subject table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_major_subject'
    ) THEN
        CREATE TABLE acme_ward_wise_major_subject (
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_major_subject) THEN


    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '441ccdae-a621-4584-9d66-4ae252c331fa',
        1,
        'OTHER',
        42,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '57017ad0-b483-4f72-a974-8fde7a9b0a13',
        2,
        'OTHER',
        1650,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '1626c9e1-e7d9-416c-80b6-5c43b2e2014e',
        3,
        'OTHER',
        544,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'a1137709-db9f-419e-80f6-7aa54a50f492',
        4,
        'OTHER',
        168,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'd645dc28-15cd-4480-b297-b35c75790563',
        5,
        'OTHER',
        52,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        'afd8f1a3-ef95-4459-8727-61fa041e7c8b',
        6,
        'OTHER',
        163,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '3eba8e07-a94f-4d0d-b866-817965189150',
        7,
        'OTHER',
        444,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '8573b77f-74c1-499b-a94b-16210616f6ec',
        8,
        'OTHER',
        1703,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '74c7f806-2353-4b20-8f55-59350debb9f1',
        9,
        'OTHER',
        252,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    INSERT INTO acme_ward_wise_major_subject 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '1b446345-80f8-4df1-b581-0cc0fd97a765',
        10,
        'OTHER',
        19,
        '2025-06-30 12:45:31',
        '2025-06-30 12:45:31'
    );
    

    END IF;
END
$$;

