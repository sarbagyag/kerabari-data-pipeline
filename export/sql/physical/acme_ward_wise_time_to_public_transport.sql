-- Generated SQL script
-- Date: 2025-06-30 15:07:27


-- Check if acme_ward_wise_time_to_public_transport table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'time_to_public_transport_type'
    ) THEN
        CREATE TYPE time_to_public_transport_type AS ENUM (
            'UNDER_15_MIN', 
            'UNDER_30_MIN', 
            'UNDER_1_HOUR', 
            '1_HOUR_OR_MORE'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_time_to_public_transport'
    ) THEN
        CREATE TABLE acme_ward_wise_time_to_public_transport (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            time_to_public_transport time_to_public_transport_type NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_time_to_public_transport) THEN


    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '2a30be4b-af04-4f99-8c73-17281ce4f6b6',
        1,
        '1_HOUR_OR_MORE',
        197,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '723e5801-704e-4ef8-8a54-3f48d97abf37',
        1,
        'UNDER_15_MIN',
        89,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '1e331c82-7615-4961-a646-9b8f5db92f11',
        1,
        'UNDER_1_HOUR',
        62,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '376c753c-2452-4976-b2a3-6c606b9efc64',
        1,
        'UNDER_30_MIN',
        90,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '9c013880-6747-4a51-aef4-58984c6ec5ba',
        2,
        '1_HOUR_OR_MORE',
        80,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '124d2f6c-02f7-4816-9e06-6037bd9306d0',
        2,
        'UNDER_15_MIN',
        90,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'b7fde33c-33da-4757-ba78-160ddbfc3988',
        2,
        'UNDER_1_HOUR',
        5,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '78b00a86-9f94-4911-b9be-9c00616aa513',
        2,
        'UNDER_30_MIN',
        24,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '37e69ac5-4bc3-443c-b32e-050e0bf755d8',
        3,
        '1_HOUR_OR_MORE',
        25,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '4b8358b6-f2c0-4ebd-bff2-d7b3f75c0674',
        3,
        'UNDER_15_MIN',
        268,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '528830e3-a91f-4113-9ecd-8cd89bb03db3',
        3,
        'UNDER_1_HOUR',
        31,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'df7dab88-1e97-4f4e-a131-80781fe384a0',
        3,
        'UNDER_30_MIN',
        333,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'fde86ace-66e8-42bb-8cfa-235066c65435',
        4,
        '1_HOUR_OR_MORE',
        347,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '35fc991b-7883-4418-ba9a-752171a10e7a',
        4,
        'UNDER_15_MIN',
        2,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'e655b0c6-e616-4dba-bda4-9938d601be96',
        4,
        'UNDER_1_HOUR',
        4,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'a50f3a76-dd70-45a3-bb9d-705cd6d149da',
        4,
        'UNDER_30_MIN',
        2,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'f5661300-08bb-40ac-9c6d-2c55258afd84',
        5,
        '1_HOUR_OR_MORE',
        4,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'bafa5bb4-b305-49c5-b695-1deec2a7c184',
        5,
        'UNDER_15_MIN',
        374,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '9dce7b7c-a774-4a6e-a478-e9148055b988',
        5,
        'UNDER_1_HOUR',
        75,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '147c417a-a378-488e-b50a-42aa5ff737b8',
        5,
        'UNDER_30_MIN',
        455,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'b1df95d5-a679-45be-aa28-bb535e47f739',
        6,
        'UNDER_15_MIN',
        588,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'b24837c6-820b-4270-9272-fff75a974ae2',
        6,
        'UNDER_1_HOUR',
        5,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'a896bb4e-04a7-48ef-aab0-1dcf080e3bbf',
        6,
        'UNDER_30_MIN',
        421,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '46609c7d-9734-483b-9c11-0db39453aa67',
        7,
        '1_HOUR_OR_MORE',
        22,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '70db7802-fd93-40db-9fa2-86386e6fe578',
        7,
        'UNDER_15_MIN',
        388,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'b69dabb1-89c5-4625-91d9-f275e003e15a',
        7,
        'UNDER_1_HOUR',
        188,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '7f7446b5-47a2-4339-8e1e-2a738a9d8b11',
        7,
        'UNDER_30_MIN',
        256,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '40d5630e-16e1-49b6-96d6-1b77141dcb37',
        8,
        'UNDER_15_MIN',
        367,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '904eb535-1bd7-48c7-9142-8cfb0cd26022',
        8,
        'UNDER_1_HOUR',
        20,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '84383fd5-77ef-424a-b7e3-b71786f4aef6',
        8,
        'UNDER_30_MIN',
        89,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '0b83106a-d28b-4ba1-89a7-c8f1a5fe71a0',
        9,
        '1_HOUR_OR_MORE',
        1,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '51b929bf-cc95-44c2-ae79-542664108453',
        9,
        'UNDER_15_MIN',
        783,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'a5d7eff0-d6a2-4a23-9bf1-2f3181529ee1',
        9,
        'UNDER_1_HOUR',
        61,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '84764e4c-7df2-47d0-84e1-242f208d111f',
        9,
        'UNDER_30_MIN',
        459,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '25164b76-cf46-4cad-9874-58bab4c9508c',
        10,
        '1_HOUR_OR_MORE',
        7,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        '26b3c79f-db96-4caf-b8f4-aebbb4f37f37',
        10,
        'UNDER_15_MIN',
        723,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'bb8840a1-e352-40db-a929-70fc0561f7c8',
        10,
        'UNDER_1_HOUR',
        94,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    INSERT INTO acme_ward_wise_time_to_public_transport 
    (id, ward_number, time_to_public_transport, households, updated_at, created_at)
    VALUES (
        'f6a82b27-b259-44b7-9c83-eedb2604adc5',
        10,
        'UNDER_30_MIN',
        84,
        '2025-06-30 15:07:26',
        '2025-06-30 15:07:26'
    );
    

    END IF;
END
$$;

