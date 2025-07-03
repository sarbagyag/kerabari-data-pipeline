-- Generated SQL script
-- Date: 2025-06-30 12:24:54


-- Check if acme_ward_wise_irrigated_area table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_irrigated_area'
    ) THEN
        CREATE TABLE acme_ward_wise_irrigated_area (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL CHECK (ward_number >= 1 AND ward_number <= 9),
            irrigated_area_hectares DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (irrigated_area_hectares >= 0),
            unirrigated_area_hectares DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (unirrigated_area_hectares >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW(),
            UNIQUE(ward_number)
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_irrigated_area) THEN


    INSERT INTO acme_ward_wise_irrigated_area 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        '19cc4e2a-5303-483c-bdce-814919904ec2',
        1,
        39586006.0,
        99999999.99,
        '2025-06-30 12:24:54',
        '2025-06-30 12:24:54'
    );
    

    INSERT INTO acme_ward_wise_irrigated_area 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        '7580e9fd-c4ff-48a6-b07b-a17e2b5f2c0e',
        2,
        99999999.99,
        99999999.99,
        '2025-06-30 12:24:54',
        '2025-06-30 12:24:54'
    );
    

    INSERT INTO acme_ward_wise_irrigated_area 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        '7836f91a-2fe4-47b5-8aba-96799d7ed78a',
        3,
        47010315.0,
        99999999.99,
        '2025-06-30 12:24:54',
        '2025-06-30 12:24:54'
    );
    

    INSERT INTO acme_ward_wise_irrigated_area 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        'cd3096fb-25ae-4475-ac57-0f647b9d8f7c',
        4,
        11814822.0,
        99999999.99,
        '2025-06-30 12:24:54',
        '2025-06-30 12:24:54'
    );
    

    INSERT INTO acme_ward_wise_irrigated_area 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        '3678a4b9-fadc-4204-adbe-aced1c8a648f',
        5,
        76877511.0,
        58625399.0,
        '2025-06-30 12:24:54',
        '2025-06-30 12:24:54'
    );
    

    INSERT INTO acme_ward_wise_irrigated_area 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        '641b1b08-918d-4f2b-ae29-19ae37df3531',
        6,
        92046466.0,
        12007830.0,
        '2025-06-30 12:24:54',
        '2025-06-30 12:24:54'
    );
    

    INSERT INTO acme_ward_wise_irrigated_area 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        '2fab7619-768b-4073-ae1b-681f018c251c',
        7,
        99999999.99,
        62184427.0,
        '2025-06-30 12:24:54',
        '2025-06-30 12:24:54'
    );
    

    INSERT INTO acme_ward_wise_irrigated_area 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        '64722ff3-3316-4a04-b8f4-00de48c96ccf',
        8,
        96824601.0,
        54504400.0,
        '2025-06-30 12:24:54',
        '2025-06-30 12:24:54'
    );
    

    INSERT INTO acme_ward_wise_irrigated_area 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        '19e3bd71-5a88-4400-84f5-a63dff588aa3',
        9,
        99999999.99,
        35439414.0,
        '2025-06-30 12:24:54',
        '2025-06-30 12:24:54'
    );
    

    END IF;
END
$$;

