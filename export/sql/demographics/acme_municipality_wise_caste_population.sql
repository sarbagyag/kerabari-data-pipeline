-- Generated SQL script
-- Date: 2025-06-30 11:57:55


-- Check if acme_municipality_wise_caste_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wise_caste_population'
    ) THEN
        CREATE TABLE acme_municipality_wise_caste_population (
            id VARCHAR(36) PRIMARY KEY,
            caste_type VARCHAR(100) NOT NULL,
            population INTEGER,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wise_caste_population) THEN


    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '24822104-0b8d-499c-8a28-6592b9b92d50',
        'अन्य ...',
        193,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'eb45bf43-2829-47b7-ba3f-705523aa44db',
        'उराँव',
        6,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'c92dde03-4eff-4173-a824-baf0a887c872',
        'कथबनियाँ',
        7,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '63012dbb-2fa1-47d3-819d-30102c552209',
        'कामी',
        2538,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'df0b72c3-4438-41b6-b316-00116cdff381',
        'कुमाल',
        115,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'a1762b42-1507-48bb-9b44-97d50c513f4f',
        'क्षेत्री',
        5095,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '2f7a02d1-96a7-434d-a98d-0f1ba78aa53b',
        'खवास',
        13,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'c4cc5f79-4da6-4a44-9dc0-c82425cffe30',
        'गुरुङ',
        399,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '3b83169b-492f-4b64-944e-e891987a04a2',
        'घर्ती/भुजेल',
        287,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'ff267f60-e56e-4332-8f02-d0e0cae9b71a',
        'चमार/हरिजन/राम',
        7,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '377d308c-be14-4229-bc69-b3506c8ca622',
        'चाम्लिङ',
        3,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'b486a323-ea4a-407d-960d-8583ecb30a10',
        'झाँगड/धागर',
        1,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '89353e77-31b6-463a-a73e-4fdfe059a48c',
        'ठकुरी',
        653,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '298bb5c5-6070-4617-893e-d5fee2e5413e',
        'ताजपुरिया',
        4,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '09b7ff93-2890-4eb3-8168-8818df06ac5c',
        'तामाङ',
        2973,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'df06bbe1-64fe-4ec3-b55d-9825df5024ad',
        'तेलि शाहा',
        11,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'a3ee0721-8f87-4ef4-bf18-655d6e708818',
        'तेली',
        10,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '6ba641e5-4b0a-4446-a951-6c7888b817c7',
        'थामी',
        1,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'a0b3005e-da6f-4d14-a799-3bebf88a1d97',
        'थारु',
        63,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '6319882e-4a47-4e8a-a461-e973687a6aab',
        'थुलुङ',
        3,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '99acf8c0-9cd7-4f09-a05a-2ca5b048e244',
        'दमाई/ढोली',
        934,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'f97eb224-0e8a-4c41-9f83-f6c14298d7f2',
        'दराई',
        6,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '9303ad4a-ea89-485b-843b-7ccd890f7d7e',
        'धानुक',
        1,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '20a495e8-6bdf-41e9-94e7-767379f4c5a7',
        'धिमाल',
        22,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '1673d0ea-4615-4189-9257-6ea730b41a1b',
        'नेवार',
        1424,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '57932f50-56b2-4a8b-8a3b-e77604612204',
        'बाँतर/सरदार',
        1,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '12705852-de57-4d8f-b521-7c117ee2fd17',
        'बान्तवा',
        12,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'f959a342-0785-43d1-9836-0b425083d2ce',
        'ब्राह्मण तराई',
        64,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '7d61b553-ff58-45eb-8aec-15549a726be5',
        'ब्राह्मण पहाड',
        3354,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'fe4749c2-ee64-42b9-bc03-50aa98322d6f',
        'मगर',
        4597,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '1c62c5b2-33e7-471f-823b-f8cbbe95be0b',
        'माझी',
        5,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'b6bbe9c0-dd3a-4a41-8b8c-07129137f5f8',
        'मारवाडी',
        1,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '4b9a514d-23f6-4686-8b40-8873d8bcffd5',
        'मुसलमान',
        37,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '7e811214-d969-4fe3-8216-75512ee56231',
        'मुसहर',
        9,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '68b8b346-25d4-436f-885e-719db7df4ef6',
        'याक्खा',
        188,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '1ffb5646-5b12-4133-89be-c500a17d75bb',
        'यादव',
        17,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '407d3c1c-6200-4941-a789-9b3b89e17f7b',
        'याम्फु',
        353,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '2a864e53-faa9-4aae-b6fc-1bc4f9f7e1ed',
        'राई',
        4686,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'cc470a16-0cd0-4078-8a09-546b834cc675',
        'राजवंशी',
        21,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '785cc584-6538-472d-9f3a-be35cbe85c46',
        'लिम्बु',
        7422,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'd57ed00c-4e38-47d0-b4b6-b8ef2a864c96',
        'लोहार',
        4,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'b5f58715-0db1-4438-ab1f-8876732013e1',
        'शेर्पा',
        16,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '8a79f259-92f0-4200-bea7-800c9e8c532e',
        'सार्की',
        594,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'eadcfe5e-280b-436e-9cf5-a75859878eff',
        'सुनुवार',
        10,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        '22f11ac5-7b84-4b96-bf57-ccee3b13e4c1',
        'हजाम/ठाकुर',
        5,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    INSERT INTO acme_municipality_wise_caste_population 
    (id, caste_type, population, updated_at, created_at)
    VALUES (
        'bf3d33fc-c9b0-48bd-befe-76a9d632aee1',
        'हलुवाई',
        17,
        '2025-06-30 11:57:55',
        '2025-06-30 11:57:55'
    );
    

    END IF;
END
$$;

