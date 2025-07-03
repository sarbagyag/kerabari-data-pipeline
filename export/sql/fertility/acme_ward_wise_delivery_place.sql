-- Generated SQL script
-- Date: 2025-06-30 12:55:23


-- Create enum type if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'delivery_place_type') THEN
        CREATE TYPE delivery_place_type AS ENUM (
            'HOUSE',
            'GOVERNMENTAL_HEALTH_INSTITUTION',
            'PRIVATE_HEALTH_INSTITUTION',
            'OTHER'
        );
    END IF;
END
$$;

-- Check if acme_ward_wise_delivery_place table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_delivery_place'
    ) THEN
        CREATE TABLE acme_ward_wise_delivery_place (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            delivery_place delivery_place_type NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_delivery_place) THEN


    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '9587c40a-64cb-4fcc-8bea-84c2f325f201',
        1,
        'GOVERNMENTAL_HEALTH_INSTITUTION'::delivery_place_type,
        11,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '1f731c01-f496-4e78-84e7-634ea45c9311',
        1,
        'PRIVATE_HEALTH_INSTITUTION'::delivery_place_type,
        1,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '56de6373-cebe-48a6-83f5-48041c5555b5',
        2,
        'HOUSE'::delivery_place_type,
        1,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'ffe80a1c-aadc-4ad4-97a3-f7d2bee236be',
        3,
        'GOVERNMENTAL_HEALTH_INSTITUTION'::delivery_place_type,
        12,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'c05e77d0-3775-4abb-9b75-3d186b8d3499',
        3,
        'HOUSE'::delivery_place_type,
        3,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'f24ed61d-2c29-41d9-b3cf-30614b78f803',
        3,
        'PRIVATE_HEALTH_INSTITUTION'::delivery_place_type,
        9,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'ee78c899-1b67-4a86-abf0-6c48ca5de649',
        4,
        'GOVERNMENTAL_HEALTH_INSTITUTION'::delivery_place_type,
        5,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '9c6d1fea-e440-4238-ab3a-ec1d5f9f7a0b',
        4,
        'HOUSE'::delivery_place_type,
        1,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '7b616cfb-d1f1-4f80-a6db-efa4d5606d1d',
        5,
        'GOVERNMENTAL_HEALTH_INSTITUTION'::delivery_place_type,
        21,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '5caa4e06-c2da-4bd3-818e-d3ddcdd13f9e',
        5,
        'PRIVATE_HEALTH_INSTITUTION'::delivery_place_type,
        1,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '05d3501a-ba8c-4326-ba73-eaf15fb6a7da',
        6,
        'GOVERNMENTAL_HEALTH_INSTITUTION'::delivery_place_type,
        20,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'b0a69a52-5edd-4a29-97a8-e7c2c70fdb26',
        6,
        'HOUSE'::delivery_place_type,
        3,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'f03eb0c9-d11d-47f3-81cf-48bf6f9f01cc',
        6,
        'PRIVATE_HEALTH_INSTITUTION'::delivery_place_type,
        10,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'b16a393f-9bac-4de3-a613-46e0251e52e0',
        7,
        'GOVERNMENTAL_HEALTH_INSTITUTION'::delivery_place_type,
        12,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'ddeb9fc0-a3a8-409d-bb7a-848291bb257b',
        7,
        'HOUSE'::delivery_place_type,
        6,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '526634fe-8cbf-4cba-9f27-4c4190b3ecf3',
        8,
        'GOVERNMENTAL_HEALTH_INSTITUTION'::delivery_place_type,
        6,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '46baf53a-1fa4-4dc1-9405-2cd54f5290b7',
        8,
        'OTHER'::delivery_place_type,
        5,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'dfb006f6-3bd0-41f6-ac5c-194a4328e4ca',
        8,
        'PRIVATE_HEALTH_INSTITUTION'::delivery_place_type,
        5,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'dabd70ff-5ae3-4ca2-adae-aa8f87e18718',
        9,
        'GOVERNMENTAL_HEALTH_INSTITUTION'::delivery_place_type,
        23,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'b8fe9d3f-758d-446d-900b-32de72546977',
        9,
        'HOUSE'::delivery_place_type,
        6,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '8c3db22a-cf79-4a22-b684-e50415754abd',
        9,
        'OTHER'::delivery_place_type,
        2,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'fadf37df-b170-48a7-b0b1-a3fca433fe28',
        9,
        'PRIVATE_HEALTH_INSTITUTION'::delivery_place_type,
        17,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '4d766572-9dca-4c42-9822-e4e4629a84e3',
        10,
        'GOVERNMENTAL_HEALTH_INSTITUTION'::delivery_place_type,
        10,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '258c958b-5d09-492c-97f2-21fe27b3b68e',
        10,
        'HOUSE'::delivery_place_type,
        1,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'df53b858-d8e9-4b8c-adb9-45816e6184f0',
        10,
        'OTHER'::delivery_place_type,
        1,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    INSERT INTO acme_ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '70c09f61-e0ee-4590-82db-2ec6816a26a6',
        10,
        'PRIVATE_HEALTH_INSTITUTION'::delivery_place_type,
        11,
        '2025-06-30 12:55:23',
        '2025-06-30 12:55:23'
    );
    

    END IF;
END
$$;

