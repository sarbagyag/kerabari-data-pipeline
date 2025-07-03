-- Generated SQL script
-- Date: 2025-06-30 13:04:01


-- Check if acme_ward_wise_road_status table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_road_status'
    ) THEN
        CREATE TABLE acme_ward_wise_road_status (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            road_status VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_road_status) THEN


    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'dff2d374-e767-4be0-a285-e5fe90680bf9',
        1,
        'DIRT',
        373,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'd468b52e-b7b5-4d77-86b0-04d34948cb5a',
        1,
        'GORETO',
        62,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'ad51a96f-20f5-4051-bf5f-b263345df154',
        1,
        'GRAVELED',
        54,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '1fc5ef86-8807-4c8e-aa9e-5d182ee03aa2',
        2,
        'DIRT',
        406,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '9e926dc1-abb5-4800-bc00-00265b49d6ed',
        2,
        'GORETO',
        167,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '80b1e5cc-0190-47eb-a97a-7e920cd1a59a',
        2,
        'GRAVELED',
        5,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '708992af-46d8-43f3-a8a2-a7a7ac333dd8',
        3,
        'BLACK_TOPPED',
        140,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '45dbc9d6-2cb7-4f87-882e-e9510816f96e',
        3,
        'DIRT',
        245,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '831ae1a1-8a5f-4a8b-9aeb-05c54d0cf433',
        3,
        'GORETO',
        142,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '4b19af71-9955-4911-bcf9-19e86a0b3af2',
        3,
        'GRAVELED',
        309,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '07aa1354-a0a8-4551-96d3-565f93c347ba',
        4,
        'BLACK_TOPPED',
        2,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '4645d8b6-4a7b-42b9-8713-9036bca165b6',
        4,
        'DIRT',
        239,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'b9b995af-440a-4daa-bbe4-20165b3ff3d5',
        4,
        'GORETO',
        185,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '8236ceab-5c67-40b0-a8f1-b45350dc0e54',
        4,
        'GRAVELED',
        1,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '47ea0e8a-98d8-48ef-bb36-1843e10c9ba8',
        5,
        'BLACK_TOPPED',
        186,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '05c99be0-e820-4a4e-ac63-a19f8919c6b3',
        5,
        'DIRT',
        550,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'd8026aa6-8aca-4324-abc6-d49d2b03d2a5',
        5,
        'GORETO',
        256,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '01a456e5-f107-4b90-b4fb-4d016f5ffdae',
        5,
        'GRAVELED',
        23,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'aa505969-e631-47d8-81f5-c70b6158e8da',
        6,
        'BLACK_TOPPED',
        300,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'd14b149d-bfa5-4e04-b2ea-1b801c76c49c',
        6,
        'DIRT',
        115,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '70b2dbeb-5191-4b68-a834-22fa3bec598b',
        6,
        'GORETO',
        237,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'fc2c7981-6c79-454a-8fcb-662c7f32ecb5',
        6,
        'GRAVELED',
        362,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '6b72ea16-548b-4189-aeca-5489303bfcc8',
        7,
        'BLACK_TOPPED',
        389,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '088e10b4-5fcf-4d03-96c5-f4bb28f19868',
        7,
        'DIRT',
        256,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'ad32bf04-c114-4ead-8af2-3db8ea6d110b',
        7,
        'GORETO',
        246,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '70596c19-54b7-418e-adee-45d0f012f826',
        7,
        'GRAVELED',
        172,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '2616ee07-ba47-4d4a-9940-778073b0a1f7',
        8,
        'BLACK_TOPPED',
        428,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '799b73ec-d3e6-47cc-b7e1-ff7e13496dc8',
        8,
        'DIRT',
        186,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'a389afda-4d9d-4251-84c9-d85304381dca',
        8,
        'GORETO',
        316,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'e6cf2bf9-a2d5-47d5-a1ee-cb272152b40d',
        8,
        'GRAVELED',
        139,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '5940ade6-3e61-475d-8ee7-a95812607624',
        9,
        'BLACK_TOPPED',
        344,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '4d278ce9-7c93-485b-876e-3df6c8b7033a',
        9,
        'DIRT',
        636,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '77f7958f-1f9b-4f9c-be06-140cc063e1a1',
        9,
        'GORETO',
        222,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '0f3d33ef-25d2-40ee-b1e3-a1c2288e576d',
        9,
        'GRAVELED',
        239,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '4e39defa-875b-4149-9e94-85c1b9ffbda6',
        10,
        'BLACK_TOPPED',
        370,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '3bb30ddb-5043-40de-9ae1-f7d06f8d617c',
        10,
        'DIRT',
        241,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '7b6f6055-ca53-4827-801b-9bd1e4f67a6f',
        10,
        'GORETO',
        108,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    INSERT INTO acme_ward_wise_road_status 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        'de0aeec9-e869-4a01-88f9-5f754f4f78d7',
        10,
        'GRAVELED',
        212,
        '2025-06-30 13:04:01',
        '2025-06-30 13:04:01'
    );
    

    END IF;
END
$$;

