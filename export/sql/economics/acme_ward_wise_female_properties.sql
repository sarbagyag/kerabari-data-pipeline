-- Generated SQL script
-- Date: 2025-06-30 12:36:31


-- Check if acme_ward_wise_female_properties table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_female_properties'
    ) THEN
        CREATE TABLE acme_ward_wise_female_properties (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            ward_name VARCHAR(100),
            property_type VARCHAR(100) NOT NULL,
            ownership_type VARCHAR(50),
            count INTEGER DEFAULT 0 NOT NULL,
            population INTEGER DEFAULT 0 NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_female_properties) THEN


    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '63077bca-1bb3-4174-ade6-461ca653e3e2',
        1,
        NULL,
        'HOUSE_ONLY',
        NULL,
        3,
        3,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '199d3db1-c1a4-4297-b4a1-071163baef16',
        1,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        400,
        400,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'f0f492da-5f67-433a-88fd-4936a11b25f0',
        1,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        19,
        19,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'ba5f19f7-3cc8-42df-a545-db152c44bde0',
        1,
        NULL,
        'LAND_ONLY',
        NULL,
        67,
        67,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '3817411f-c3b2-48ed-96b9-058778ae377f',
        2,
        NULL,
        'HOUSE_ONLY',
        NULL,
        13,
        13,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '4ec95d98-6ddd-4608-9d98-d308c976f98d',
        2,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        505,
        505,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '2fb16920-cd45-4a22-8f8f-3651f306a85e',
        2,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        22,
        22,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '0008ccdd-f559-4f9c-b4b8-90eed74d51a0',
        2,
        NULL,
        'LAND_ONLY',
        NULL,
        38,
        38,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '495a1f73-ec2d-4c28-ad4d-614cbfecfc42',
        3,
        NULL,
        'HOUSE_ONLY',
        NULL,
        9,
        9,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'e0b1da84-ac09-4106-983d-9a566a064a0b',
        3,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        589,
        589,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '6d848c2b-608b-4271-b2f5-ca609c5905c1',
        3,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        205,
        205,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'fbd67588-1b28-4d0d-9f62-ea21549315bf',
        3,
        NULL,
        'LAND_ONLY',
        NULL,
        33,
        33,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'ec471243-ccd9-44ee-808e-8d1c76078c3b',
        4,
        NULL,
        'HOUSE_ONLY',
        NULL,
        1,
        1,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '317266f0-8e8d-4fa2-8cd1-ff99fefd6f34',
        4,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        352,
        352,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'f00ad0b9-3cd6-499d-b20e-b3f722486efa',
        4,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        50,
        50,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '186b6af7-5b98-4dca-9b98-801fb03cb3af',
        4,
        NULL,
        'LAND_ONLY',
        NULL,
        24,
        24,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'd38f0ca3-bf61-4219-8672-6463d396f692',
        5,
        NULL,
        'HOUSE_ONLY',
        NULL,
        6,
        6,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '99721742-5d11-43fb-b620-1f32a1c42fae',
        5,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        650,
        650,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '51c024c9-53f7-4349-99ff-f99c0c6affbd',
        5,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        281,
        281,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'ef10ad33-a93c-4eb7-b63e-070ae6e3f416',
        5,
        NULL,
        'LAND_ONLY',
        NULL,
        91,
        91,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '3174ceb6-7a9f-4735-9190-fb7239e7ebdd',
        6,
        NULL,
        'HOUSE_ONLY',
        NULL,
        75,
        75,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'bee32cff-beb9-4ac7-9651-3f000103ad24',
        6,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        738,
        738,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '62f8c176-9bbb-4ecb-b36b-bf1d597786b6',
        6,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        141,
        141,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '153c973f-3a76-4ccf-9bb9-24558f5bc5e5',
        6,
        NULL,
        'LAND_ONLY',
        NULL,
        46,
        46,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'b6ec9f2c-e268-4cb2-8b35-fcb91eb401ab',
        7,
        NULL,
        'HOUSE_ONLY',
        NULL,
        4,
        4,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'ceb4e386-d584-4c94-b02f-4b9d08de1711',
        7,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        552,
        552,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '7c607456-1c34-49a2-875f-5a0a0472f9c4',
        7,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        289,
        289,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '7f26569b-eb3b-4a03-ad76-1a1cf7b8c359',
        7,
        NULL,
        'LAND_ONLY',
        NULL,
        141,
        141,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'acdadd1a-d1e6-4f3c-9440-dc8a09284db7',
        8,
        NULL,
        'HOUSE_ONLY',
        NULL,
        120,
        120,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '081bf8eb-92b6-433a-921b-8d1f66c468aa',
        8,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        703,
        703,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '8a11827b-2db2-4f15-8fbb-d69dab140f12',
        8,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        282,
        282,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '69052de5-8051-4361-bbc5-c2cd02504a60',
        8,
        NULL,
        'LAND_ONLY',
        NULL,
        3,
        3,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'e7120a51-7c37-4420-acf9-72f360bdc5fa',
        9,
        NULL,
        'HOUSE_ONLY',
        NULL,
        15,
        15,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'e0bec84f-c65e-49af-9c85-fd1f4d836896',
        9,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        894,
        894,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '7133af0a-f8ac-41f5-8003-2aca08ebbbf2',
        9,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        349,
        349,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'b55e6543-815d-4db2-9a64-92045efa6008',
        9,
        NULL,
        'LAND_ONLY',
        NULL,
        222,
        222,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '60e1686c-bcee-4850-ac0c-411641ef3a11',
        10,
        NULL,
        'HOUSE_ONLY',
        NULL,
        18,
        18,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        'b2aa69df-dbef-4643-b002-b77859847c5a',
        10,
        NULL,
        'NEITHER_HOUSE_NOR_LAND',
        NULL,
        538,
        538,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '8bf59467-44ab-449b-ba24-a1049470ffac',
        10,
        NULL,
        'BOTH_HOUSE_AND_LAND',
        NULL,
        309,
        309,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    INSERT INTO acme_ward_wise_female_properties 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '873cd2ce-01dc-48bc-a89d-600b03d06ff2',
        10,
        NULL,
        'LAND_ONLY',
        NULL,
        67,
        67,
        '2025-06-30 12:36:31',
        '2025-06-30 12:36:31'
    );
    

    END IF;
END
$$;

