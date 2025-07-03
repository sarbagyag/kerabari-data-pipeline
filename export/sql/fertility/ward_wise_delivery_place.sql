-- Generated SQL script
-- Date: 2025-06-22 12:56:14


-- Create enum type if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'delivery_place_type') THEN
        CREATE TYPE delivery_place_type AS ENUM (
            'house',
            'governmental_health_institution',
            'private_health_institution',
            'other'
        );
    END IF;
END
$$;

-- Check if ward_wise_delivery_place table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'ward_wise_delivery_place'
    ) THEN
        CREATE TABLE ward_wise_delivery_place (
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
    IF NOT EXISTS (SELECT 1 FROM ward_wise_delivery_place) THEN


    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '6d00f39e-af7a-4ad0-9cd9-5a46d9c9b525',
        1,
        'governmental_health_institution'::delivery_place_type,
        83,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'e1a8c971-acea-4682-8068-da981149e38a',
        1,
        'other'::delivery_place_type,
        1600,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '36d0b37e-2db5-4f20-a5cb-5efb902827d9',
        2,
        'governmental_health_institution'::delivery_place_type,
        56,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '8765ae95-2d9e-4354-a0c9-5c3191b25439',
        2,
        'house'::delivery_place_type,
        8,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '59e15b88-f2fb-4095-bfae-fe3f213ed56d',
        2,
        'other'::delivery_place_type,
        234,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '9bf26f18-3af9-4ab3-9f57-d824b47b4f92',
        3,
        'governmental_health_institution'::delivery_place_type,
        16,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '6bebdca1-f2cf-413a-97c7-1e18e3e94960',
        3,
        'house'::delivery_place_type,
        14,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '1d7f9782-7dbe-470c-b7f9-7f89360363de',
        3,
        'other'::delivery_place_type,
        255,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '151d4669-377e-4925-95da-fde355210d34',
        4,
        'governmental_health_institution'::delivery_place_type,
        27,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'a65b277d-9462-4238-837c-fdb885713591',
        4,
        'house'::delivery_place_type,
        1,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '64060432-0754-4460-930a-66e287ebd15c',
        4,
        'other'::delivery_place_type,
        364,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '3ec7f1e2-a6b8-4118-8afe-338784a872b8',
        5,
        'governmental_health_institution'::delivery_place_type,
        25,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'cce31af2-ed05-4e17-8ac6-5bd6bd7cb954',
        5,
        'other'::delivery_place_type,
        960,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '7ca5fe17-7331-4a1d-b192-6c580077e80f',
        6,
        'governmental_health_institution'::delivery_place_type,
        78,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'e8549bd3-b3eb-490a-a8e5-22e1da6b5d3f',
        6,
        'house'::delivery_place_type,
        5,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '7c8f3656-23db-440a-90f2-ba44c34fd282',
        6,
        'other'::delivery_place_type,
        603,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '72c3e4a9-c43c-485d-bc50-8f3ed51c3273',
        7,
        'governmental_health_institution'::delivery_place_type,
        55,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '31cf5672-4e07-4a6f-a24d-68af1cd2a42f',
        7,
        'house'::delivery_place_type,
        2,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    INSERT INTO ward_wise_delivery_place 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        'f567b178-cc82-4fcd-9088-518f80438b58',
        7,
        'other'::delivery_place_type,
        533,
        '2025-06-22 12:56:14',
        '2025-06-22 12:56:14'
    );
    

    END IF;
END
$$;

