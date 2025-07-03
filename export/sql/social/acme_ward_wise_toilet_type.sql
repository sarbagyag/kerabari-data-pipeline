-- Generated SQL script
-- Date: 2025-06-30 13:05:27


-- Check if acme_ward_wise_toilet_type table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_toilet_type'
    ) THEN
        CREATE TABLE acme_ward_wise_toilet_type (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            toilet_type VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_toilet_type) THEN


    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '2c185a26-9a2e-4291-a3ce-ad5de69236b2',
        1,
        'FLUSH_WITH_SEPTIC_TANK',
        130,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '894e3365-cc5c-4b43-9cca-2781c6287b04',
        1,
        'NORMAL',
        351,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '15fad0cf-3736-48f5-9ba8-0c77e6975cb0',
        1,
        'NO_TOILET',
        6,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '0849801d-2c12-407a-bd41-e1032adb64c2',
        1,
        'PUBLIC_EILANI',
        2,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '2be55b07-573f-43ae-afbc-b0dd70b8376f',
        2,
        'FLUSH_WITH_SEPTIC_TANK',
        54,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '4ea27a91-526b-4280-ab48-55f2f70c5e1e',
        2,
        'NORMAL',
        515,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '43f1a6ca-c6b6-45e0-a5ce-6bff85b5894e',
        2,
        'NO_TOILET',
        9,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '667e4555-2da9-45a9-ae85-1799172bc186',
        3,
        'FLUSH_WITH_SEPTIC_TANK',
        8,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'ef932692-8be9-4b02-b5e1-90c1ac86a343',
        3,
        'NORMAL',
        808,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'a63f35b3-49e0-4d5c-878e-0565f071a710',
        3,
        'NO_TOILET',
        17,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '08cb50ea-28e4-4e88-972a-2335766d3886',
        3,
        'PUBLIC_EILANI',
        3,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '718468e5-9a79-4dbc-bc86-6719d3d4de9c',
        4,
        'FLUSH_WITH_SEPTIC_TANK',
        265,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '04ebcba7-ac59-4056-85b8-3427782ba3e9',
        4,
        'NORMAL',
        127,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '78062738-2920-4a67-9214-a402cc16780f',
        4,
        'NO_TOILET',
        32,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'ebbace32-04e0-4ee6-acf3-2062b5950620',
        4,
        'PUBLIC_EILANI',
        3,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'e04aab45-e7b6-4f79-a12f-6eefd38b7f62',
        5,
        'FLUSH_WITH_SEPTIC_TANK',
        256,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '11cb7205-0b21-48de-9a90-46393e0bd858',
        5,
        'NORMAL',
        768,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '3db402a8-2590-4f2d-b64c-dcaa61a20370',
        5,
        'NO_TOILET',
        1,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '71dc5fc8-188a-425f-ae89-d864d133b2d2',
        5,
        'PUBLIC_EILANI',
        3,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '3147ce57-2676-41d7-8338-0822c6f99780',
        6,
        'FLUSH_WITH_SEPTIC_TANK',
        124,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '718f824c-11bf-42b5-a90d-4f27e1285dde',
        6,
        'NORMAL',
        859,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '1bd2ea9b-6a05-472d-9e7b-a5aecdc76cce',
        6,
        'NO_TOILET',
        17,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '00c5e0cc-c450-4cb3-a3ad-a68c31605fdd',
        7,
        'FLUSH_WITH_SEPTIC_TANK',
        29,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'cfeb21ff-4118-485b-82b3-35a9e74e6306',
        7,
        'NORMAL',
        949,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'cd051686-6c86-4e91-ba2e-29a344875e06',
        7,
        'NO_TOILET',
        5,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '84dd4678-448d-4aa9-8419-d1e65a4cad5b',
        7,
        'PUBLIC_EILANI',
        3,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'ee2840b5-2834-4530-8215-6bf18dd2ff5c',
        8,
        'FLUSH_WITH_SEPTIC_TANK',
        162,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '4c9f5fe1-5462-469b-9361-5d764fe5614d',
        8,
        'NORMAL',
        939,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '1a1c95ff-2205-49f1-bda9-71eec11960f6',
        8,
        'NO_TOILET',
        7,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'b6faeaea-aae2-46a7-9f08-29e99a5d4c00',
        9,
        'FLUSH_WITH_SEPTIC_TANK',
        47,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'ae791b84-8e43-4aa8-a23a-4a43eaeaf47c',
        9,
        'NORMAL',
        1416,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '0fe0b198-ed7b-4a87-8be3-e60aa04986e2',
        9,
        'NO_TOILET',
        14,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '10161672-8260-43d0-90a7-0cd25fbc141a',
        9,
        'PUBLIC_EILANI',
        3,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '307cd51c-4936-41f7-ab8b-6acbe09c6f08',
        10,
        'FLUSH_WITH_SEPTIC_TANK',
        182,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        'e5898292-fa2a-433d-8b79-863a5291758c',
        10,
        'NORMAL',
        746,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '4d6d0759-0927-49ac-9d91-464754000e29',
        10,
        'NO_TOILET',
        3,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    INSERT INTO acme_ward_wise_toilet_type 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '68a788e6-3bb6-4666-845b-3390d01c9c0c',
        10,
        'PUBLIC_EILANI',
        1,
        '2025-06-30 13:05:27',
        '2025-06-30 13:05:27'
    );
    

    END IF;
END
$$;

