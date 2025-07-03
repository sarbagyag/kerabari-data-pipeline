-- Generated SQL script
-- Date: 2025-06-30 13:05:07


-- Check if acme_ward_wise_solid_waste_management table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_solid_waste_management'
    ) THEN
        CREATE TABLE acme_ward_wise_solid_waste_management (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            solid_waste_management VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_solid_waste_management) THEN


    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '0a920f90-24a3-41f6-b5ab-4b099968e013',
        1,
        'BURNING',
        225,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'eb6834db-f4c5-4d5c-b1db-90129485ba94',
        1,
        'COMPOST_MANURE',
        1,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '3fd32366-14c3-40d8-8e0e-8eee0107868c',
        1,
        'DIGGING',
        109,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '122c033b-4621-449b-b25c-865e1bf2064c',
        1,
        'RIVER',
        28,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'c1a50207-1e52-41e2-a9c8-3f64f48b7f70',
        1,
        'WASTE_COLLECTING_PLACE',
        126,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'd231cac8-c7e0-454f-b031-1e4cc87e452b',
        2,
        'BURNING',
        233,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'a103f912-aa87-4d98-bb49-547e780425d7',
        2,
        'COMPOST_MANURE',
        174,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '9311ba2b-f101-4aac-b1de-ac613ef0bae5',
        2,
        'DIGGING',
        89,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '29911140-04e3-4af2-8c16-11c1695d8223',
        2,
        'RIVER',
        4,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'd552051a-0825-4782-9244-d24ca09a79bb',
        2,
        'WASTE_COLLECTING_PLACE',
        78,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '115a4e18-025e-4cfe-b3cc-f2026bbb349b',
        3,
        'BURNING',
        499,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '19a7dabd-3fe4-49b8-95ff-52cbd5c2d44d',
        3,
        'COMPOST_MANURE',
        2,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '6e9b7359-0d30-4968-9a91-0b2614746922',
        3,
        'DIGGING',
        35,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'e6919f76-f56e-45e1-8fbf-ade29acc9636',
        3,
        'HOME_COLLECTION',
        255,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '1b882195-804a-4f5c-9bf2-58167da45cc5',
        3,
        'RIVER',
        11,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '94bafd8b-2724-491b-a94b-d5b4d20f94d9',
        3,
        'ROAD_OR_PUBLIC_PLACE',
        23,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '8130689b-7417-42dc-9ca5-77a6233554d9',
        3,
        'WASTE_COLLECTING_PLACE',
        11,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '91af29ef-6cba-4722-a31d-3726fdf07241',
        4,
        'BURNING',
        350,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '62dbd20b-8baa-4431-9135-2397a096dd57',
        4,
        'DIGGING',
        24,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'f38e0e29-ca05-4b01-9e0f-facd1ff75f9e',
        4,
        'RIVER',
        6,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '07b3490b-f57f-4f3d-a385-9a4e37594f34',
        4,
        'WASTE_COLLECTING_PLACE',
        47,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '8e45aa51-b56d-4e35-a3b6-ffd384e55c78',
        5,
        'BURNING',
        815,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '07fe6a34-cc42-42cd-8302-c172b3ed2547',
        5,
        'COMPOST_MANURE',
        8,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '6021b653-4bfb-450d-9b3d-b16d453c05d9',
        5,
        'DIGGING',
        11,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '2cdf0189-39d7-46b1-8d66-bbb8d818b645',
        5,
        'RIVER',
        39,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '8cafbc73-7514-4c03-9bb8-372ad0285da6',
        5,
        'WASTE_COLLECTING_PLACE',
        155,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '58bdc647-d312-4792-a372-dbf86f45b480',
        6,
        'BURNING',
        791,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'f6ea3313-6500-428f-a9e5-1bc86c4e8fcc',
        6,
        'COMPOST_MANURE',
        13,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '23e78f7f-1243-490d-8718-046a327c5fdc',
        6,
        'DIGGING',
        37,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '71eb0b5a-481b-4a35-87cc-c8f6b672780a',
        6,
        'RIVER',
        136,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'a3eaa6ba-8e1c-40f1-ad11-19f160ce0cd6',
        6,
        'WASTE_COLLECTING_PLACE',
        23,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '08def7e3-cf60-4708-bcc6-73eb3e02b1be',
        7,
        'BURNING',
        845,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'a2bd5f77-655a-4b6d-a468-96abe4ea061e',
        7,
        'COMPOST_MANURE',
        63,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '765a774d-0f4b-4dd4-bec4-e780d9a96e7b',
        7,
        'DIGGING',
        11,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '4a2ef4de-dc12-4dd6-83fd-42e86702c8ba',
        7,
        'RIVER',
        50,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'a7767727-717d-47e3-9adc-47adb5692503',
        7,
        'WASTE_COLLECTING_PLACE',
        17,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '4004b890-d15f-449a-8215-650764c5a3b1',
        8,
        'BURNING',
        495,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '68d6deb9-8b1b-4809-96dd-d29facbde900',
        8,
        'COMPOST_MANURE',
        26,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'fea6b049-fd83-4424-919b-5973a9ccf917',
        8,
        'DIGGING',
        68,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '71ceeb66-f2e0-4961-a7a4-549faf36bb51',
        8,
        'HOME_COLLECTION',
        179,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '9ac80190-bf66-483b-98dd-77353b7e91ab',
        8,
        'RIVER',
        229,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'a8edcff6-d0b1-4130-bb10-64d2d4e4f570',
        8,
        'ROAD_OR_PUBLIC_PLACE',
        14,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'e9ac4747-b0d0-44e8-9847-d450894a8c3c',
        8,
        'WASTE_COLLECTING_PLACE',
        97,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '2001580e-a43b-4008-92c1-198d5526cda0',
        9,
        'BURNING',
        1369,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'a8db004f-3a1e-4e75-a2e4-af04579f3387',
        9,
        'COMPOST_MANURE',
        13,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '6c96a4e1-7200-4278-94c4-be155938eabb',
        9,
        'DIGGING',
        48,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '23bbb17b-2f53-48b2-a120-3db920a14308',
        9,
        'HOME_COLLECTION',
        2,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '4a37e54a-0a16-4218-be37-5538847c306c',
        9,
        'RIVER',
        40,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '0a8a66d3-5c1c-4878-8005-9da53c7e2515',
        9,
        'WASTE_COLLECTING_PLACE',
        8,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '1d39bc5f-51ec-47df-913d-62467ea55e25',
        10,
        'BURNING',
        148,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '3bb21f4a-a89a-42b9-a890-8ea323d584f5',
        10,
        'COMPOST_MANURE',
        1,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'bae40d4c-bf8e-49d6-8bcb-4ab0236f8ff0',
        10,
        'DIGGING',
        3,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '5852c132-13ce-4310-8f45-a7185f767eef',
        10,
        'HOME_COLLECTION',
        715,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '5ea40fa7-447c-4df5-b461-02701a124d99',
        10,
        'RIVER',
        1,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '556bb02b-5fa8-48eb-9211-312e8d8ab014',
        10,
        'ROAD_OR_PUBLIC_PLACE',
        26,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    INSERT INTO acme_ward_wise_solid_waste_management 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        'a9ba7df8-0e60-4508-8b04-15744db7b641',
        10,
        'WASTE_COLLECTING_PLACE',
        38,
        '2025-06-30 13:05:07',
        '2025-06-30 13:05:07'
    );
    

    END IF;
END
$$;

