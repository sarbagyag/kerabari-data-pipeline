-- Generated SQL script
-- Date: 2025-06-30 11:45:45


-- Check if acme_ward_wise_caste_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_caste_population'
    ) THEN
        CREATE TABLE acme_ward_wise_caste_population (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_caste_population) THEN


    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '2df53e4f-78be-469b-8c10-7a05fe210b5e',
        1,
        'कामी',
        87,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '230d3fb3-fcdc-4127-ba94-973c984420cf',
        1,
        'क्षेत्री',
        5,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '84610ae5-60db-41f0-9f03-d3ae321c52ed',
        1,
        'गुरुङ',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '1addf07c-07b3-4426-ab42-c8ddf5d5033d',
        1,
        'घर्ती/भुजेल',
        9,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '2d9cb68e-12fa-4c2a-b41e-0d276243bee5',
        1,
        'तामाङ',
        93,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '4b572250-dafa-4724-8ef4-8514b5ef4b99',
        1,
        'दमाई/ढोली',
        16,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '70ac41c7-cc43-4f3b-837e-ebc552a906b5',
        1,
        'नेवार',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'a02bc974-1f92-466b-8b93-343a5d8a8b0b',
        1,
        'ब्राह्मण पहाड',
        33,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'ba709660-847b-4c3b-9742-960647e6efd3',
        1,
        'मगर',
        574,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f968cdcd-8330-4e93-a9a0-9ff0885cc507',
        1,
        'राई',
        488,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'a9bb68f2-1fe9-4075-9fde-b05377710a30',
        1,
        'लिम्बु',
        826,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '1772f0b0-5fbd-40c2-a220-84b1604eec7e',
        1,
        'शेर्पा',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '8beb3517-37b9-4100-b632-5e4e5485db18',
        2,
        'कामी',
        27,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '325c2499-c605-48dd-8343-491e673ec06e',
        2,
        'क्षेत्री',
        198,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '6369b0e9-4f7c-4821-9302-3265de23f1da',
        2,
        'गुरुङ',
        33,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '2ea2b43d-baee-4733-a1bf-51f394f8a43b',
        2,
        'ठकुरी',
        402,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '43aaf659-8c23-4ff7-84b1-5712566da978',
        2,
        'दमाई/ढोली',
        13,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '909d48ed-1fdb-4ee1-8608-922cd9bdf7cd',
        2,
        'नेवार',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd04a5237-1eba-4c48-ba21-ed61ae91a7d7',
        2,
        'ब्राह्मण पहाड',
        96,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'e320e442-9d46-4ebe-9074-a8b8738e9351',
        2,
        'मगर',
        7,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'efd1b7f5-de95-44e4-b689-5a743859add7',
        2,
        'राई',
        148,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '6d4acedd-e514-4169-b3ab-ed2f863b7dd8',
        2,
        'लिम्बु',
        1326,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '0cc3025f-1049-43a7-92fc-521bc468ab07',
        3,
        'अन्य ...',
        25,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '9931e78d-c371-4ba9-adc6-d32f2b8ccf33',
        3,
        'कथबनियाँ',
        7,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'a7ce0dce-5381-4245-a3c1-73fc2e465206',
        3,
        'कामी',
        335,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '160302be-05f3-48a5-99ad-2c2a67575cfd',
        3,
        'क्षेत्री',
        77,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f5542456-5fcd-4c9b-833d-1f89cb8f9c5d',
        3,
        'घर्ती/भुजेल',
        23,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'e33c05ae-e83f-45c5-8615-a8f6145d2200',
        3,
        'ठकुरी',
        38,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '71ad4bea-71be-4c6e-80fa-f955ac71cf58',
        3,
        'तामाङ',
        396,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '1c2919ba-f7b7-4c83-adaf-287fd9a1828a',
        3,
        'थारु',
        4,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '481dd0c2-afb5-459d-9bdf-52f34adbeeed',
        3,
        'दमाई/ढोली',
        23,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '26973b16-493d-428c-9f4b-6b0443f2e66d',
        3,
        'नेवार',
        588,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '4aecf542-5891-47fc-9b7e-fa5d6ffb72fe',
        3,
        'ब्राह्मण तराई',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'a3229223-3a70-4107-a7de-8c08c993a592',
        3,
        'ब्राह्मण पहाड',
        161,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '51a9d10e-2ab9-4f52-9549-dc08d3141e3d',
        3,
        'मगर',
        577,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '11b29ba7-f4d3-47b2-a26a-bc502b7ff8e7',
        3,
        'राई',
        234,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '0adb9173-d937-4807-b1af-0396210acc8c',
        3,
        'लिम्बु',
        652,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'b1de149e-646a-4ff5-bdf7-125ecb48563d',
        3,
        'सार्की',
        348,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '8555c70b-fe49-42b0-a56c-6427efb1e93b',
        4,
        'कामी',
        38,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd4d93104-90c2-4bda-91b0-b4a4ef7a61ad',
        4,
        'क्षेत्री',
        105,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '32cf0c78-8e09-465c-b566-2803f8d03228',
        4,
        'तामाङ',
        329,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'fda17ec5-77a0-44b0-bd22-1c2de01bd961',
        4,
        'नेवार',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '43c5abe5-dab8-4161-b328-c9a17a2ededf',
        4,
        'मगर',
        323,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '9d98464b-5847-42a0-8881-a4abfcea77bd',
        4,
        'याम्फु',
        353,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f1cf0182-7b48-4a5e-9ebe-b1fbc60a5a7b',
        4,
        'राई',
        414,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'c6a7f884-5ed3-472a-b676-c339a35f4c39',
        4,
        'लिम्बु',
        166,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd9914cf7-8a2c-4a44-884a-457b36a747b9',
        5,
        'अन्य ...',
        5,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f0f474ef-0cfb-4c9f-86d1-89dff57bcb8e',
        5,
        'कामी',
        512,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '18c76eca-bde2-441d-89e1-870d35006b91',
        5,
        'क्षेत्री',
        494,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '6e20849f-024f-43a4-971b-e4670657dfc4',
        5,
        'गुरुङ',
        10,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '83ad11cf-10bd-417c-8b28-d4832399f45e',
        5,
        'घर्ती/भुजेल',
        23,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f806f246-d32d-4ed3-906f-d3c5f093d13e',
        5,
        'तामाङ',
        226,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '0448e1f0-79e6-4d7c-804e-e7c683e4b713',
        5,
        'दमाई/ढोली',
        94,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '1453f7cd-39ad-48dc-8d83-cc5ec350ea05',
        5,
        'धिमाल',
        8,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'fb986582-64f9-47d0-b718-c3fd1392fa55',
        5,
        'नेवार',
        39,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '93ce3eae-2a3f-4648-a67e-48e5ca3ee704',
        5,
        'ब्राह्मण तराई',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'b13d7276-094c-4bfc-9a94-a32a192d005a',
        5,
        'ब्राह्मण पहाड',
        145,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'e0eb1421-a62e-44d3-9c3d-d1980ef944e8',
        5,
        'मगर',
        779,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '7988ecc9-7e03-49be-8c25-b96220a5cc79',
        5,
        'याक्खा',
        22,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '352c0d7b-7c1e-47b2-86b3-22101fc2a2c0',
        5,
        'राई',
        970,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '6c681dac-4066-47eb-b4af-927a8642459e',
        5,
        'राजवंशी',
        2,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '5c16da90-0557-436d-9bb3-b5acb45d22ca',
        5,
        'लिम्बु',
        799,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'feb21650-dee1-4803-bb25-a0780a3a6a10',
        5,
        'शेर्पा',
        2,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '4549d8a1-cb34-4872-b8d5-7cba64b92289',
        5,
        'सार्की',
        51,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f0aa3e83-fc5a-49d4-9d65-f25aa3268630',
        5,
        'सुनुवार',
        9,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '69db5d7a-9714-48eb-8251-295ddcb8ed50',
        6,
        'अन्य ...',
        17,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '02dfb8b5-9240-4556-a38f-349ac5a78e98',
        6,
        'कामी',
        410,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '2371fc50-1c81-4ff1-a61b-9d647c4e064a',
        6,
        'क्षेत्री',
        394,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '9fc772ab-6a5d-4f72-b0cd-0541eecb2185',
        6,
        'खवास',
        7,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '033f451a-f41f-47f0-9084-8be6af19aa6d',
        6,
        'गुरुङ',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '724aacb5-6fa3-4979-860e-d08bb7202d8a',
        6,
        'घर्ती/भुजेल',
        108,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '46c01dea-6876-4b88-a5a7-5ccf17ee2dd2',
        6,
        'ठकुरी',
        8,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '51a958eb-375c-41e1-a05d-47a2fbfafd1f',
        6,
        'ताजपुरिया',
        4,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '0e4a0322-50f8-4d89-bc4a-fef70609efc8',
        6,
        'तामाङ',
        610,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '45b8aab1-d632-414b-ad02-3ba82775b0f5',
        6,
        'तेलि शाहा',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '85103b3c-3001-4ea4-9573-8702a76ac0b0',
        6,
        'तेली',
        2,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd511a3f7-fb03-4c52-93ec-7eb532d9d0db',
        6,
        'थारु',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '2066446a-5a89-4460-a6ba-318816de0e3e',
        6,
        'दमाई/ढोली',
        279,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '48bee2d5-ccc3-467a-9495-2bbcca8cc5bf',
        6,
        'दराई',
        6,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '278020ee-9e02-434b-89ec-649924c7a697',
        6,
        'नेवार',
        164,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd528f471-a867-4316-a918-d09dd0766944',
        6,
        'ब्राह्मण पहाड',
        120,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '59cf461c-a67a-4f16-9cc3-4339f7e1ab37',
        6,
        'मगर',
        759,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'ba45e750-3e1e-425e-b4b4-9ab93fc6fe3b',
        6,
        'मुसहर',
        4,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'fc3276b0-1403-485e-9917-6baa26201248',
        6,
        'याक्खा',
        23,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'dd3a6ba9-484d-4403-90ee-6927ea9e52b1',
        6,
        'राई',
        554,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '72ef63e0-d553-4048-8079-44ba59e21625',
        6,
        'लिम्बु',
        632,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '65569869-2156-4603-ba7f-cf811f67a1e9',
        6,
        'शेर्पा',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'c368099c-aa93-433f-a328-267b7dbc2c13',
        6,
        'सार्की',
        24,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'bf5b62e6-146a-4ef3-b750-c593fadac836',
        6,
        'सुनुवार',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '6f373078-a614-4133-b612-13db83ae4650',
        7,
        'अन्य ...',
        49,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '0c7c8690-895a-47a7-98c3-893994ed9eb7',
        7,
        'कामी',
        256,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'ad13270d-c288-40af-8002-f08bceb40636',
        7,
        'क्षेत्री',
        358,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'de923482-713e-4c7e-bca4-b338b7c0cb79',
        7,
        'गुरुङ',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd4f85e79-968c-4fe7-8796-0262c41c48fb',
        7,
        'घर्ती/भुजेल',
        9,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '92ceeb60-8d52-4fc4-a40c-ef0eb4c939cb',
        7,
        'तामाङ',
        201,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '17850cb1-c1f8-4d49-b15a-1b72db2d3c64',
        7,
        'दमाई/ढोली',
        63,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f967c1ab-ee97-4044-88a9-c08d9baae598',
        7,
        'धिमाल',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'eda2cf56-562b-4024-82c1-8d1a2b303f32',
        7,
        'नेवार',
        11,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '070d266b-bf9b-4f32-a7f0-3844f669a7cf',
        7,
        'ब्राह्मण तराई',
        10,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'e044adf9-0a95-46df-8d82-7b9c8f9ed2e6',
        7,
        'ब्राह्मण पहाड',
        701,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '21903792-4e37-4107-85ac-ebefc53ded9a',
        7,
        'मगर',
        458,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '58e24a63-7ac8-4dfe-9fc2-a96510753fa3',
        7,
        'याक्खा',
        76,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '39953ec0-a5bc-42a0-b3d8-79d7fbbc4571',
        7,
        'राई',
        713,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '6fff0fc8-a93b-4a7c-947c-339786126522',
        7,
        'लिम्बु',
        1373,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'bc10d496-a3c0-47b6-9698-34e01f841b13',
        7,
        'शेर्पा',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd3e74b03-c132-4fd7-8448-468adfcd5118',
        8,
        'अन्य ...',
        20,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '250a333b-83ae-4c0c-92f9-da1acc1cac08',
        8,
        'कामी',
        256,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f60322ed-289f-40cf-84eb-b909b38a1668',
        8,
        'क्षेत्री',
        1653,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'b5605be5-4608-412a-bf69-c23d4dfaab38',
        8,
        'घर्ती/भुजेल',
        49,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'e59ea366-bc06-4cf6-b46a-21f4768a26a1',
        8,
        'चमार/हरिजन/राम',
        7,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '78f4d639-499d-46b6-9e7a-fd7b5488686b',
        8,
        'ठकुरी',
        12,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f56ee359-7feb-4e95-a290-6175c6420923',
        8,
        'तामाङ',
        344,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'fb6d821e-2ba2-486f-a67e-068edd2b2d49',
        8,
        'तेली',
        8,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '950f16c3-672e-482d-9adf-75b9b499d56b',
        8,
        'थारु',
        17,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '34d2a771-cabf-422b-8265-074ccb0cb01f',
        8,
        'दमाई/ढोली',
        180,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '6067d3f9-1d65-420b-ac0e-105c47d03635',
        8,
        'धिमाल',
        10,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '628da5da-6bae-431e-b984-13f6da5c9754',
        8,
        'नेवार',
        361,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '9c68c4b0-a4d3-4b63-865b-1b6cdeac84fb',
        8,
        'ब्राह्मण पहाड',
        652,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '0f0cbb7f-2c94-4fdd-a535-f6041fae0792',
        8,
        'मगर',
        99,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'e1363e7d-76b3-4ea0-bd0d-41fb1a5dc994',
        8,
        'मुसलमान',
        37,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '049d47ee-6bb0-4c61-9d0e-973aa25772b2',
        8,
        'याक्खा',
        35,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'dd78a44b-435e-446b-903d-a1a350706a06',
        8,
        'राई',
        164,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '7bb6a927-9b6d-4e45-946a-d680953a06bd',
        8,
        'राजवंशी',
        8,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '91cf4109-043e-4428-8a46-d3cd2136fd24',
        8,
        'लिम्बु',
        243,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '1b4e19ed-e41f-4605-a083-e5ed571c8d2a',
        8,
        'सार्की',
        37,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'a23432ae-0044-4890-8de7-88abca294915',
        8,
        'हजाम/ठाकुर',
        5,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '42d71928-2be0-4cd8-8d5e-cf79f2aa92b5',
        8,
        'हलुवाई',
        5,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '4315cc0e-d311-4e73-94b7-bcc7e5e42a21',
        9,
        'अन्य ...',
        23,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '5fa846a3-30dd-4139-bebb-f1302301e76b',
        9,
        'कामी',
        205,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '57153a73-cc7a-4453-935a-4b1716904e3f',
        9,
        'कुमाल',
        115,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'df64eef0-1708-416d-923c-6ff4e4753f7f',
        9,
        'क्षेत्री',
        1509,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '89638730-5899-4ac7-9878-0cea40fba593',
        9,
        'खवास',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd7e31c2f-3187-4a20-9448-af123ca2fadf',
        9,
        'गुरुङ',
        343,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '555747a1-b32f-48f0-b35b-b1ec04c2b315',
        9,
        'घर्ती/भुजेल',
        20,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'c3f31efd-c244-4e5e-b7a4-8e4df2a5f1d8',
        9,
        'चाम्लिङ',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '7c6c303f-519e-40c8-88aa-1c22bb6d63bf',
        9,
        'ठकुरी',
        107,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '49ce5700-524d-4214-87eb-ad3e49e03562',
        9,
        'तामाङ',
        383,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '2d92d362-6cae-4b4c-bdb8-8a6adbd40602',
        9,
        'थामी',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'b6d29461-ca64-4044-91a1-492ac74bedf9',
        9,
        'थारु',
        31,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'c513d53b-3502-45a6-8293-edb57e96db57',
        9,
        'थुलुङ',
        3,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'b7845ab0-79a6-4ca9-9a79-7432eee7664a',
        9,
        'दमाई/ढोली',
        148,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '67351d18-087b-42b9-9313-2a8cc16397a2',
        9,
        'धानुक',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'aff1b740-e2b5-42b6-972b-8a4d98e1a04c',
        9,
        'धिमाल',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '17588b6d-af79-4eeb-9378-e8cefda5f8cf',
        9,
        'नेवार',
        163,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd5390322-7197-4364-a406-4f09fdc0bf92',
        9,
        'बान्तवा',
        12,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'bc14a083-2647-4fb4-b0c2-04d3227ae95e',
        9,
        'ब्राह्मण तराई',
        49,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '408bc3be-5d1d-4813-b908-5362aee62bb4',
        9,
        'ब्राह्मण पहाड',
        1171,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd432c730-c23e-429a-a948-e5bd84630896',
        9,
        'मगर',
        425,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '02f941c5-34dc-4468-8c4d-ea11566c8e15',
        9,
        'माझी',
        5,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'e8d175f7-9fa4-4bda-9d5e-39b9b8b8b015',
        9,
        'मारवाडी',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'ae105d95-80b6-4981-8d5b-dc0847324e12',
        9,
        'मुसहर',
        5,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'b606f20c-205e-4de9-afef-47c8d17f146e',
        9,
        'याक्खा',
        11,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'eb49a079-4cf8-4a52-baeb-77bf54d06a28',
        9,
        'यादव',
        2,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '61c3b8f9-0178-4975-9e2f-33ee9ad280c9',
        9,
        'राई',
        732,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'e9493009-5c9b-4db9-becb-d6a6b0ddb337',
        9,
        'राजवंशी',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '4398b571-75b0-47c7-9e7e-dc8bbff8e993',
        9,
        'लिम्बु',
        429,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd985bbe5-200e-427f-862b-dd018dd74750',
        9,
        'लोहार',
        4,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '61e5042d-608b-447b-b2fc-ffc741baeb26',
        9,
        'शेर्पा',
        2,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'ed746dc5-fd37-4190-a3c9-60d64d709ff8',
        9,
        'सार्की',
        5,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '4900ff61-3848-4838-a4d8-51400180f218',
        9,
        'हलुवाई',
        12,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'c34b6952-472d-410e-8510-f44ddc04e938',
        10,
        'अन्य ...',
        54,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '1b35c15e-f085-48c3-93be-52917610de37',
        10,
        'उराँव',
        6,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '4010e612-5f44-4c74-b85a-5cdd90387b31',
        10,
        'कामी',
        412,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '01ff8032-2036-448a-b55e-2434136013e0',
        10,
        'क्षेत्री',
        302,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'f436f048-07bb-4997-920d-2a5d968483e5',
        10,
        'खवास',
        5,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '83ec0b47-c169-4441-b180-ef61925108aa',
        10,
        'गुरुङ',
        8,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'c803a855-771d-4d3f-9535-6fade3197784',
        10,
        'घर्ती/भुजेल',
        46,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'a305452d-27a1-4510-8e37-d79f9ed8a844',
        10,
        'झाँगड/धागर',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '4a2062ab-75f2-42e4-b56c-98a3839c3b70',
        10,
        'ठकुरी',
        86,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'ee058905-b298-4e0d-a40c-447fd9ca0e1b',
        10,
        'तामाङ',
        391,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '68eac483-eec3-47d3-9c6c-afb16e561c92',
        10,
        'तेलि शाहा',
        8,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '75e08d26-ea8f-4654-8817-88114285dba4',
        10,
        'थारु',
        8,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '3088880d-5096-4185-9605-64fefca48aa6',
        10,
        'दमाई/ढोली',
        118,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'd9edab40-0a30-427e-8b42-ec82bb172afd',
        10,
        'नेवार',
        91,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '41d29a81-d847-4af7-9077-f98aa5d548db',
        10,
        'बाँतर/सरदार',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '03ffce1e-3ade-492c-b0dd-7492ecd559c8',
        10,
        'ब्राह्मण तराई',
        1,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '91eef3c9-9886-4ac3-8fd8-71efcfa4b022',
        10,
        'ब्राह्मण पहाड',
        275,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'af524194-c2a5-4404-b9fd-ae0bcf0e9d37',
        10,
        'मगर',
        596,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '45e8c29d-8668-4ec9-8f10-d1507000e138',
        10,
        'याक्खा',
        21,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'c6e48375-16d8-48cf-9e2f-40c23d8cf52f',
        10,
        'यादव',
        15,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'e1905f87-c1bd-4bde-bb7c-6d6111bcd6c6',
        10,
        'राई',
        269,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        'ddc89623-8828-40ca-9f5d-60f0b91c17b0',
        10,
        'राजवंशी',
        10,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '27f40ab7-2c5b-44a5-a4b3-14c8a95116bc',
        10,
        'लिम्बु',
        976,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '2ceaa2ae-ee58-4ece-be16-667eb0654890',
        10,
        'शेर्पा',
        5,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    INSERT INTO acme_ward_wise_caste_population 
    (id, ward_number, caste_type, population, updated_at, created_at)
    VALUES (
        '4c6ecf48-4d55-4dd3-9838-af605278d331',
        10,
        'सार्की',
        129,
        '2025-06-30 11:45:45',
        '2025-06-30 11:45:45'
    );
    

    END IF;
END
$$;

