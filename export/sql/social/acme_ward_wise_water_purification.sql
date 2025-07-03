-- Generated SQL script
-- Date: 2025-06-30 13:05:19


-- Drop existing enum type if it exists (to handle value changes)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'water_purification_method_type') THEN
        -- Check if the enum has the correct values
        IF NOT EXISTS (
            SELECT 1 FROM pg_enum 
            WHERE enumtypid = (SELECT oid FROM pg_type WHERE typname = 'water_purification_method_type')
            AND enumlabel = 'BOILING'
        ) THEN
            -- Drop the table first if it exists (since it references the enum)
            DROP TABLE IF EXISTS acme_ward_wise_water_purification CASCADE;
            -- Drop the enum type
            DROP TYPE water_purification_method_type CASCADE;
        END IF;
    END IF;
END
$$;

-- Create enum type if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'water_purification_method_type') THEN
        CREATE TYPE water_purification_method_type AS ENUM (
            'BOILING',
            'FILTERING',
            'CHEMICAL_PIYUSH',
            'NO_ANY_FILTERING',
            'OTHER'
        );
    END IF;
END
$$;

-- Check if acme_ward_wise_water_purification table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_water_purification'
    ) THEN
        CREATE TABLE acme_ward_wise_water_purification (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            water_purification_method water_purification_method_type NOT NULL,
            households INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_water_purification) THEN


    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '076d4658-25d5-4075-83fc-f011e4ad7de5',
        1,
        'BOILING'::water_purification_method_type,
        232,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '545d3a68-cba6-4a70-9277-7ff28a8c036c',
        1,
        'FILTERING'::water_purification_method_type,
        75,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'c4238123-ead6-40bd-b4e0-68864b9d172e',
        1,
        'NO_ANY_FILTERING'::water_purification_method_type,
        238,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'af3de375-5f99-4efa-8555-e46d6dc7f576',
        1,
        'OTHER'::water_purification_method_type,
        1,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '99137287-fc91-49df-af80-248f9bc7085e',
        2,
        'BOILING'::water_purification_method_type,
        42,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '6fe36877-9065-4677-9240-944ca3235e57',
        2,
        'FILTERING'::water_purification_method_type,
        13,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '789d9a43-a4dd-4931-88a9-c870f0476c56',
        2,
        'NO_ANY_FILTERING'::water_purification_method_type,
        95,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '714dff29-de0c-488e-8a5a-dc6f0aad1c76',
        3,
        'BOILING'::water_purification_method_type,
        192,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '351cdd51-2aa8-4475-8b19-786258c2b239',
        3,
        'CHEMICAL_PIYUSH'::water_purification_method_type,
        63,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'a7d04353-2aae-4da9-b3a9-554d9534a372',
        3,
        'FILTERING'::water_purification_method_type,
        473,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'b5e9d8e1-f959-4007-ae68-839749bbf0d2',
        3,
        'NO_ANY_FILTERING'::water_purification_method_type,
        242,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '4c3acb6b-7083-4539-8b47-5edbf7c3b120',
        3,
        'OTHER'::water_purification_method_type,
        1,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '26be75a7-c1f9-4e79-80fc-a699974d3982',
        4,
        'BOILING'::water_purification_method_type,
        21,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '919948ef-30f8-41f2-a7c8-0f74b3206d5e',
        4,
        'FILTERING'::water_purification_method_type,
        37,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'd4457913-0404-4f84-b0cd-39ebe1a0b4e3',
        4,
        'NO_ANY_FILTERING'::water_purification_method_type,
        265,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '1e0909e2-e4a5-406c-b0a2-98cd4a22df01',
        4,
        'OTHER'::water_purification_method_type,
        21,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '4f3cd01d-7804-4246-8945-710e4c016e7c',
        5,
        'BOILING'::water_purification_method_type,
        173,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'd686c84c-8576-4260-9890-5b249eb781ff',
        5,
        'FILTERING'::water_purification_method_type,
        593,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '37c6999c-06f0-4df7-a4f3-2d608aa2d404',
        5,
        'NO_ANY_FILTERING'::water_purification_method_type,
        286,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'c8798c6e-e033-453b-b37f-83b02cfbe23d',
        6,
        'BOILING'::water_purification_method_type,
        291,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'b00d0496-9c32-4f09-95ff-6c94de5dd25a',
        6,
        'CHEMICAL_PIYUSH'::water_purification_method_type,
        4,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '140b6268-acf3-4293-8207-64e6566d5b75',
        6,
        'FILTERING'::water_purification_method_type,
        438,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '80416ec3-b106-4d9d-ad1a-8fa794f863cb',
        6,
        'NO_ANY_FILTERING'::water_purification_method_type,
        537,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'a2e8d61e-7b15-459a-a35a-8694aab665a3',
        6,
        'OTHER'::water_purification_method_type,
        3,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'ed70b599-e2da-4f31-ae99-6fedd1c39d1c',
        7,
        'BOILING'::water_purification_method_type,
        89,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'c24f3347-59b7-49fb-b1f5-eec431da94df',
        7,
        'FILTERING'::water_purification_method_type,
        602,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'ad211597-0a39-4dc6-aa48-9c1077d26c87',
        7,
        'NO_ANY_FILTERING'::water_purification_method_type,
        216,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '53247346-fc19-47dc-9a29-111c7861a86a',
        8,
        'BOILING'::water_purification_method_type,
        258,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'bece8fe8-3f46-49e3-8057-185982d9399e',
        8,
        'CHEMICAL_PIYUSH'::water_purification_method_type,
        1,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '72815e26-0f62-4c77-a12f-6fd564c2614a',
        8,
        'FILTERING'::water_purification_method_type,
        387,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '377e4783-e716-4a3e-a598-90eeeb0b3375',
        8,
        'NO_ANY_FILTERING'::water_purification_method_type,
        18,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '5d3e5e3d-62b7-4441-bfb5-acb4dd77e93b',
        8,
        'OTHER'::water_purification_method_type,
        1,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '8863e1ae-94fb-4302-9e1b-b8d85fc82178',
        9,
        'BOILING'::water_purification_method_type,
        447,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'ca58f913-26da-4130-be3e-6cc09cf1a913',
        9,
        'FILTERING'::water_purification_method_type,
        566,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '80fca3ca-c64c-4f96-8d14-37972a9be678',
        9,
        'NO_ANY_FILTERING'::water_purification_method_type,
        793,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'f80d1e02-28d5-4c1e-b6e8-796647e6a4c5',
        9,
        'OTHER'::water_purification_method_type,
        14,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        'a673e9ba-84ae-4a70-8afd-3af7d6e8f86a',
        10,
        'BOILING'::water_purification_method_type,
        537,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '5b11eedb-2b52-4285-8c85-66d1c37dd0fd',
        10,
        'CHEMICAL_PIYUSH'::water_purification_method_type,
        9,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '2ce4fb4d-9057-4fdd-b5a1-7e1db6521a22',
        10,
        'FILTERING'::water_purification_method_type,
        769,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '1f9df26a-e15b-43ae-999b-12c95afbf671',
        10,
        'NO_ANY_FILTERING'::water_purification_method_type,
        62,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    INSERT INTO acme_ward_wise_water_purification 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '2d68f21f-d6f2-4ea0-a2c9-915117b395f5',
        10,
        'OTHER'::water_purification_method_type,
        1,
        '2025-06-30 13:05:19',
        '2025-06-30 13:05:19'
    );
    

    END IF;
END
$$;

