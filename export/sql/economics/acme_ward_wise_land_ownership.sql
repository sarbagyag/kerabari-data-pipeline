-- Generated SQL script
-- Date: 2025-06-30 12:25:17


-- Check if acme_ward_wise_land_ownership table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_land_ownership'
    ) THEN
        CREATE TABLE public.acme_ward_wise_land_ownership (
            id varchar(36) NOT NULL,
            ward_number int4 NOT NULL,
            land_ownership_type varchar(50) NOT NULL,
            households int4 NOT NULL,
            updated_at timestamp DEFAULT now() NULL,
            created_at timestamp DEFAULT now() NULL,
            CONSTRAINT acme_ward_wise_land_ownership_pkey PRIMARY KEY (id)
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_land_ownership) THEN


    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'fe952d97-56bb-4a6f-a604-cd71ded8b16c',
        1,
        'PRIVATE',
        486,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '2da0954f-d3da-4c82-b671-66698cb9d761',
        1,
        'PUBLIC_EILANI',
        2,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '115c8a20-d453-43da-8046-2445afaf45bb',
        2,
        'PRIVATE',
        572,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'a825cd98-faf6-4d58-b37e-7bbc2c1c11c7',
        2,
        'VILLAGE_BLOCK',
        6,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '5500b370-d19d-4547-98c1-32e20e78f5e1',
        3,
        'GUTHI',
        4,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'dc403dc4-55c9-45e8-9bc5-a9c5a2d0d956',
        3,
        'NOT_STATED',
        2,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '55c48b36-845b-402b-a961-e393611c22f5',
        3,
        'PRIVATE',
        759,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'cacde299-7111-43d9-b90d-2ccc39ea0f8c',
        3,
        'PUBLIC_EILANI',
        47,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '5b85bcc6-5587-4c3b-8ad8-2499dafe5d38',
        4,
        'NOT_STATED',
        2,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'ee54d33f-b6f1-4976-98bb-4dde19296091',
        4,
        'PRIVATE',
        377,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'b7157bb3-6961-47eb-912c-ab8334dfd479',
        4,
        'PUBLIC_EILANI',
        31,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'e9feb878-e02f-414b-a0a5-fa4e40467c66',
        5,
        'GUTHI',
        1,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '86d6a205-2b57-459d-aa31-224c3a910413',
        5,
        'PRIVATE',
        877,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '35f9f529-2dc6-48fe-94c3-e2291b4593b5',
        5,
        'PUBLIC_EILANI',
        100,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '4ec3d883-6a52-433a-aad3-0a218f98fb38',
        5,
        'VILLAGE_BLOCK',
        1,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'aa92daac-bc33-41d5-927d-eb2073f19644',
        6,
        'GUTHI',
        6,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '9a27f475-03f9-4dff-b862-0fc82ce93d8c',
        6,
        'PRIVATE',
        722,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '31d83405-3f1e-465d-bf67-0317499394ef',
        6,
        'PUBLIC_EILANI',
        257,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'a0c7e517-027d-4e50-8f04-13d52bc629bf',
        7,
        'GUTHI',
        44,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'fed56835-821d-430e-9dbf-0266ab2309c5',
        7,
        'PRIVATE',
        774,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '96dff03f-17fc-480a-b601-48fe5749ecfa',
        7,
        'PUBLIC_EILANI',
        245,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '8976c75e-6423-483b-bfae-35c23fe6d062',
        8,
        'GUTHI',
        10,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '26caf330-1830-4341-9301-681d55f0d7a8',
        8,
        'NOT_STATED',
        21,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'f88127ac-41ff-43ce-aea7-5db5221be67f',
        8,
        'PRIVATE',
        885,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '1252d2c2-c5e4-4e79-8b73-183e651a566a',
        8,
        'PUBLIC_EILANI',
        141,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'f5b26a2c-e261-4e93-ab7d-d542d1cf3d91',
        9,
        'GUTHI',
        5,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '3440ea95-20b8-4429-a348-f9f0b7e8c672',
        9,
        'NOT_STATED',
        6,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'bebc8740-db64-409f-8040-5de15b222fc1',
        9,
        'PRIVATE',
        877,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '1fac7dd7-b01f-4cf8-88d3-3df4eaab90ec',
        9,
        'PUBLIC_EILANI',
        526,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '7ada7fa9-48db-4ef3-a5c9-5862cc04a82f',
        10,
        'GUTHI',
        4,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '1a058ee7-bf8c-4dbd-925f-3aff8c44e764',
        10,
        'NOT_STATED',
        1,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '584fce72-83cf-4f60-9ce8-e36133d9c4ff',
        10,
        'PRIVATE',
        830,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    INSERT INTO acme_ward_wise_land_ownership 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        'd494599d-80fe-41e7-a005-23bff07bef6f',
        10,
        'PUBLIC_EILANI',
        79,
        '2025-06-30 12:25:17',
        '2025-06-30 12:25:17'
    );
    

    END IF;
END
$$;

