-- Generated SQL script
-- Date: 2025-06-30 15:07:40


-- Check if acme_ward_wise_time_to_health_organization table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_time_to_health_organization'
    ) THEN
        CREATE TABLE acme_ward_wise_time_to_health_organization (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            time_to_health_organization VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_time_to_health_organization) THEN


    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'e6d630c7-5dab-4a56-832a-6d9cb12130f5',
        1,
        '1_HOUR_OR_MORE',
        169,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'd34386ed-a216-429e-9490-d3e594c9821d',
        1,
        'UNDER_15_MIN',
        47,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '27d8e4a1-92b1-4332-8b4b-ec46d722742c',
        1,
        'UNDER_1_HOUR',
        105,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '4ef8c5dd-6674-4145-86a4-208c320623b6',
        1,
        'UNDER_30_MIN',
        117,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '78c63584-7091-4930-954d-5baa3ad5638c',
        2,
        '1_HOUR_OR_MORE',
        8,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '6678c7cf-5491-4663-b53e-9fbfc452edbb',
        2,
        'UNDER_15_MIN',
        69,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '0dce689c-2404-4f69-b13a-8e1589c12a17',
        2,
        'UNDER_1_HOUR',
        65,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '149d7b63-7115-4c5f-9d10-438d6df49751',
        2,
        'UNDER_30_MIN',
        57,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '86688858-ec6e-4bb1-a84a-aae0cbb51f57',
        3,
        '1_HOUR_OR_MORE',
        30,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'af9dbe4a-1643-426e-a4a8-abe58f49edd5',
        3,
        'UNDER_15_MIN',
        154,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '36f58ddc-bc97-4d7b-a5e9-901055c047b4',
        3,
        'UNDER_1_HOUR',
        143,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'd38119b8-7b74-43d2-aef9-06ff393787eb',
        3,
        'UNDER_30_MIN',
        331,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'f8d609b9-c00c-4095-b150-d366d04aa54d',
        4,
        '1_HOUR_OR_MORE',
        340,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '3eb9c518-2611-445e-a156-d2013f25b48c',
        4,
        'UNDER_1_HOUR',
        4,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'e7ef3542-353d-489e-9c7a-fba0b2820dcd',
        4,
        'UNDER_30_MIN',
        8,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '3457338f-b45e-487d-9765-7748b4ec945d',
        5,
        '1_HOUR_OR_MORE',
        2,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'a4cae700-024f-440c-b9a8-0316938677f7',
        5,
        'UNDER_15_MIN',
        333,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '560eaa3c-6935-44cd-96a4-55048cb28566',
        5,
        'UNDER_1_HOUR',
        104,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '6debb62e-7060-4bfc-b329-654186ba86c1',
        5,
        'UNDER_30_MIN',
        469,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '3b954ddc-6e53-41f3-966b-d02f30552501',
        6,
        '1_HOUR_OR_MORE',
        35,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '35cf39b4-be22-4376-a121-6ea2dfd826f0',
        6,
        'UNDER_15_MIN',
        197,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'c35c8a09-9e61-4bce-b903-b620232e471b',
        6,
        'UNDER_1_HOUR',
        162,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'b18f3ed3-6c7c-4695-a008-573a02b32a65',
        6,
        'UNDER_30_MIN',
        620,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '9063a08f-285c-4336-8f54-d2f919fb5a55',
        7,
        '1_HOUR_OR_MORE',
        61,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'e2340082-360e-4722-9696-abd2cc3b98ae',
        7,
        'UNDER_15_MIN',
        141,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '788229a0-d137-479d-ae91-ed510576b74a',
        7,
        'UNDER_1_HOUR',
        188,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '28a78e53-753f-4533-97f6-df7ebf35fea0',
        7,
        'UNDER_30_MIN',
        464,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'b1952885-f339-4f78-a03a-24d353ac73c5',
        8,
        'UNDER_15_MIN',
        170,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'a1b5ad67-6c76-49f8-92f9-fbad5d581542',
        8,
        'UNDER_1_HOUR',
        210,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '7678f80f-a5df-418a-8ec0-2e97ce8f2c9b',
        8,
        'UNDER_30_MIN',
        96,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'a64b95bd-7133-4e1e-a688-95100afcafae',
        9,
        '1_HOUR_OR_MORE',
        34,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'f15e9558-de0e-437c-8731-243aae61a228',
        9,
        'UNDER_15_MIN',
        650,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '8896ffc6-ab8b-4834-bd04-d1a55223ce1d',
        9,
        'UNDER_1_HOUR',
        84,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '0381b5a4-2791-478f-bf4b-12893566f4c1',
        9,
        'UNDER_30_MIN',
        536,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '4a3ec0d3-ec66-4f79-af80-6de898a52b1f',
        10,
        '1_HOUR_OR_MORE',
        7,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '99751ad3-da40-435b-a458-e3bb81a92f4f',
        10,
        'UNDER_15_MIN',
        715,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        '702d1eb7-748a-47d9-9a9d-80e5ef0c4c5c',
        10,
        'UNDER_1_HOUR',
        94,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    INSERT INTO acme_ward_wise_time_to_health_organization 
    (id, ward_number, time_to_health_organization, households, created_at, updated_at)
    VALUES (
        'c3d9e3b1-826a-4075-823b-56a4fc706ee6',
        10,
        'UNDER_30_MIN',
        92,
        '2025-06-30 15:07:40',
        '2025-06-30 15:07:40'
    );
    

    END IF;
END
$$;

