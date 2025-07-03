-- Generated SQL script
-- Date: 2025-06-30 13:03:23


-- Set UTF-8 encoding for this script
SET client_encoding = 'UTF8';

-- Create base_type enum type if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'base_type') THEN
        CREATE TYPE base_type AS ENUM ('CONCRETE_PILLAR', 'CEMENT_JOINED', 'MUD_JOINED', 'WOOD_POLE', 'OTHER');
    END IF;
END
$$;

-- Create acme_ward_wise_household_base table if not exists
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_household_base'
    ) THEN
        CREATE TABLE acme_ward_wise_household_base (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            base_type base_type NOT NULL,
            households INTEGER NOT NULL DEFAULT 0,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
        
        -- Create index for faster lookups by ward number and base type
        CREATE INDEX idx_acme_ward_wise_household_base_ward_base ON acme_ward_wise_household_base(ward_number, base_type);
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_household_base) THEN


    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '3b46afbd-22b9-4a21-9b31-d99d74d87995',
        1,
        'CEMENT_JOINED',
        15,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '36e0a58b-7295-4ea2-857f-c188d5171b2a',
        1,
        'CONCRETE_PILLAR',
        11,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '7790914b-4a31-408d-b31f-9c6216cda26e',
        1,
        'MUD_JOINED',
        41,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '432b4c7e-885e-4141-b1d2-4704e9fbc780',
        1,
        'OTHER',
        6,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '22fe8043-5df0-49d6-9d9d-9cc29fff78e4',
        1,
        'WOOD_POLE',
        416,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'fb0bcdd6-7801-4c85-b618-f6344247d9a8',
        2,
        'CEMENT_JOINED',
        47,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '969c3995-aba9-4c5c-8175-07795e536a69',
        2,
        'CONCRETE_PILLAR',
        22,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'fbd2c63d-62b8-4f71-bda7-611b89aaa56e',
        2,
        'MUD_JOINED',
        372,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '98458ec3-7983-448e-a59e-7462e4063905',
        2,
        'OTHER',
        47,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'a2125715-1dfc-4b72-b5d3-d41c100ca04b',
        2,
        'WOOD_POLE',
        90,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'a9601b27-4b2f-413a-9b76-7d5660fc1ab9',
        3,
        'CEMENT_JOINED',
        47,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '36d04a72-9cd3-4d79-b7ea-2f46c1a4ce68',
        3,
        'CONCRETE_PILLAR',
        123,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '7bcf2bc1-ff8f-4219-b5fb-a8d8b0bfaec1',
        3,
        'MUD_JOINED',
        2,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '4af337a3-19d4-45b3-b112-86f080841771',
        3,
        'OTHER',
        9,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '265a68a5-7fe4-4125-a432-83ab76dd301b',
        3,
        'WOOD_POLE',
        655,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '5b3c8891-4662-4d96-a3c6-9dbd59ad3712',
        4,
        'CEMENT_JOINED',
        5,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '44eb3b71-027e-4d69-a7db-c4a4b852512c',
        4,
        'CONCRETE_PILLAR',
        9,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'b6a41dfb-b732-4002-8934-1faac31c646a',
        4,
        'MUD_JOINED',
        14,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'd878c4a3-51e8-458c-8f4f-080522932e21',
        4,
        'OTHER',
        1,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '4017a363-67b9-4b9f-82af-1d9ca03e64de',
        4,
        'WOOD_POLE',
        398,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '9b2ac1e8-8e51-4334-ab94-a68314cfec86',
        5,
        'CEMENT_JOINED',
        83,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '2486bf23-1ecc-4045-aaa4-0e092000a4c3',
        5,
        'CONCRETE_PILLAR',
        188,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'c7e9cc1f-8a8b-455d-ae0a-c1955723261a',
        5,
        'MUD_JOINED',
        11,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'c385818b-0361-4c47-83cf-fd2ef2984eed',
        5,
        'OTHER',
        12,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '1566c40e-eccb-44a4-898c-77da26c5195e',
        5,
        'WOOD_POLE',
        720,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'a9d9fca9-fa89-4a3c-8fe2-b6d331fbd968',
        6,
        'CEMENT_JOINED',
        274,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '891165d8-573d-4ab2-a378-426eaa8cc256',
        6,
        'CONCRETE_PILLAR',
        269,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '7ab7ec8e-950b-4dc7-b9bd-e2652993e07b',
        6,
        'MUD_JOINED',
        162,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '0a27628a-0f79-4772-94ee-2308ccca2869',
        6,
        'OTHER',
        10,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'b8404cfa-26cb-491d-95c9-109e723a6dc8',
        6,
        'WOOD_POLE',
        299,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'a413c2d7-dbe0-453f-84ec-771022541e02',
        7,
        'CEMENT_JOINED',
        32,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'bd04689a-f85f-433f-99dc-c9ea643b403f',
        7,
        'CONCRETE_PILLAR',
        332,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'b9784652-9f9e-4fb8-9fe1-b07e6129d25f',
        7,
        'MUD_JOINED',
        3,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'aa82b36b-3205-4011-89fb-0e71481c7c42',
        7,
        'OTHER',
        36,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '39f3415c-debe-4ba2-8be4-d512a8325fbe',
        7,
        'WOOD_POLE',
        660,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '8fe0d65b-9567-42e5-a0fd-fdef9f4a9bfc',
        8,
        'CEMENT_JOINED',
        100,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '22cca82e-e608-4961-990f-005f66408599',
        8,
        'CONCRETE_PILLAR',
        332,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '2987416e-113a-48e2-8994-8c517cb7abb4',
        8,
        'MUD_JOINED',
        15,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '79f70540-fb7b-4e0a-b363-8dd394c85b6f',
        8,
        'OTHER',
        89,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '7c89b2c1-a29d-4137-b349-4627bd4d3f64',
        8,
        'WOOD_POLE',
        533,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '308c3ffc-6c63-466a-a88d-8e7769e1adea',
        9,
        'CEMENT_JOINED',
        91,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '8cebcf3b-f67d-4d11-bd99-536667351583',
        9,
        'CONCRETE_PILLAR',
        479,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '89feabf2-8894-408f-a500-a00d3e6492d5',
        9,
        'MUD_JOINED',
        16,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '168eb340-053c-4562-b3cb-bdc787fae4ea',
        9,
        'OTHER',
        52,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '2fa1283d-e261-48b9-8a5c-523472efb2aa',
        9,
        'WOOD_POLE',
        803,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '1e6c29f3-3903-4f33-a18a-9bc64f0ccc6c',
        10,
        'CEMENT_JOINED',
        83,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'a48bffae-d92e-41e2-acab-3b4765ef9236',
        10,
        'CONCRETE_PILLAR',
        323,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '5635f5ad-5c76-449c-a403-ce0539a7f1ec',
        10,
        'MUD_JOINED',
        9,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        '404fe25b-e2a9-471c-a7b4-4b361de33b67',
        10,
        'OTHER',
        75,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    INSERT INTO acme_ward_wise_household_base 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        'f51b7ec3-d0d9-476d-aaba-9ad76304d043',
        10,
        'WOOD_POLE',
        441,
        '2025-06-30 13:03:23',
        '2025-06-30 13:03:23'
    );
    

    END IF;
END
$$;

