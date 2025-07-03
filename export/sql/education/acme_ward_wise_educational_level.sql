-- Generated SQL script
-- Date: 2025-06-30 12:44:47


-- Check if acme_ward_wise_educational_level table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_educational_level'
    ) THEN
        CREATE TABLE acme_ward_wise_educational_level (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            educational_level_type VARCHAR(100) NOT NULL,
            population INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_educational_level) THEN


    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'ffc88f12-6dd9-43cd-aac3-821abc0e228d',
        1,
        '1',
        57,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a7375cfc-a641-46e6-a1eb-40596d5008c4',
        1,
        '10',
        228,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e9e5649a-8e01-49f7-95e2-93f1903f5ea1',
        1,
        '2',
        81,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd8cae529-f268-4362-aa76-3a0813643791',
        1,
        '3',
        93,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '3fe82d77-34f2-42ac-9fa0-a651a3bb6419',
        1,
        '4',
        85,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'fe1bc5e5-cb07-49cd-b176-b852018e8eea',
        1,
        '5',
        125,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '2cd50834-e1fb-4625-a553-863def8f39d6',
        1,
        '6',
        126,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '5d5619ef-6299-4d2d-ab76-895a50cd25db',
        1,
        '7',
        142,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'dd627f79-ec43-42e1-a093-2f5edb10f4e0',
        1,
        '8',
        135,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '4e6d5cbf-8c52-4a21-9ac9-e0979066896d',
        1,
        '9',
        92,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'ec410ec0-eb14-4dac-bd56-780eabf00253',
        1,
        'BACHELOR_LEVEL',
        29,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '0556ad99-dde7-45ff-9429-a48aa2bef164',
        1,
        'CHILD_DEVELOPMENT_CENTER',
        2,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '8bd30297-1555-496f-8fcf-37e2935813a1',
        1,
        'CLASS_12_LEVEL',
        218,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b25e6dc0-c1f7-435f-94f4-fbf9f6df268e',
        1,
        'EDUCATED',
        35,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'bfacd601-2a3e-44a9-bcd9-c805a5b1ab1c',
        1,
        'MASTERS_LEVEL',
        9,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd49af154-8614-4ad1-8624-6e24dbb02be5',
        1,
        'NURSERY',
        16,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '6347791b-ad0e-4c50-8674-28181bce1c52',
        1,
        'OTHER',
        4,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e2f7417b-1d63-4ca8-b68e-fae8ec767eda',
        1,
        'PHD_LEVEL',
        1,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '41b3a830-b422-4f46-91b8-659d44907131',
        1,
        'SLC_LEVEL',
        95,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '28a0807d-8f14-4665-aeba-79bb2c32978f',
        1,
        'UNKNOWN',
        32,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd38a26d1-c528-43a9-85bc-70e15719a2ea',
        2,
        '1',
        66,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd6d5db55-5cf0-4e1a-bb08-a199847fd707',
        2,
        '10',
        214,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '185b3236-08b4-4642-897e-a6fe11170814',
        2,
        '2',
        59,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b6e88f6e-ebea-4fd3-8e0c-1e01a8b38393',
        2,
        '3',
        60,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '04188e0a-140e-41ef-a5f7-ee86cda709e8',
        2,
        '4',
        70,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'c7633783-2086-46fd-b9b7-e45f20081df5',
        2,
        '5',
        137,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '866ec9b1-df55-4221-91c8-356a12363c7a',
        2,
        '6',
        71,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '6d43634a-ac81-4ea8-a14b-613f9417bc3e',
        2,
        '7',
        80,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '8ff7e479-e052-47ea-ae63-eb0bb2cd109a',
        2,
        '8',
        199,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'aa75d9fc-d1b7-4d89-a8fe-5c7a09e28a5a',
        2,
        '9',
        98,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '794a464c-82e1-4d29-afde-03cd09ac2391',
        2,
        'BACHELOR_LEVEL',
        54,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '871b6b54-de36-42a0-b727-892e99d84d55',
        2,
        'CLASS_12_LEVEL',
        231,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'ffd7de73-6bb5-4ff7-a9d6-3827ca5f0c2a',
        2,
        'EDUCATED',
        44,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '064ff712-d112-4d5a-bb5d-975f8afda621',
        2,
        'INFORMAL_EDUCATION',
        15,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '207339ed-9df9-4a96-9989-0eb15cce3b50',
        2,
        'MASTERS_LEVEL',
        32,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a82786d0-0cb7-45f3-9754-d2a7990577cd',
        2,
        'NURSERY',
        9,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b5343f26-00bd-4d26-8271-d53bbdb0625e',
        2,
        'SLC_LEVEL',
        242,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '62d3ba23-5cee-4377-99c4-83e9bd1340d4',
        2,
        'UNKNOWN',
        433,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '28346358-5e5e-46f3-b0eb-54a23d3e7d32',
        3,
        '1',
        69,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '5f550058-9741-468b-a819-be924878d75b',
        3,
        '10',
        260,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '107cb798-45ca-44ed-9cf6-3ce26c620e18',
        3,
        '2',
        82,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '2053cf94-af89-453b-975b-c7770c43b73c',
        3,
        '3',
        108,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'f8f6f8d9-8a4b-41cb-8993-ae7c62765147',
        3,
        '4',
        131,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a3a1795f-0f2c-4a3e-99b2-35ce2dd18ce9',
        3,
        '5',
        239,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '8716eacd-e67e-4735-9712-9348e4f094dc',
        3,
        '6',
        143,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '80047255-d87c-49c4-be21-b05385e8948c',
        3,
        '7',
        185,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b76384a3-0e10-4542-8dfc-5e800714315f',
        3,
        '8',
        186,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '4f33ef5a-d698-41d4-a8eb-2042e66bbf7d',
        3,
        '9',
        170,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '564483f2-9102-48fc-8a22-b6f8f9494132',
        3,
        'BACHELOR_LEVEL',
        72,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '7a1c9dec-fc31-49e0-8100-df4c0d1552ee',
        3,
        'CHILD_DEVELOPMENT_CENTER',
        7,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '409d4d33-8b8a-4d93-81d5-140246923179',
        3,
        'CLASS_12_LEVEL',
        356,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a4a97fb2-7da5-43c2-8092-5c97e2cbeedb',
        3,
        'EDUCATED',
        236,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a1815ab4-ed2c-4f9f-967f-9c0b8521d921',
        3,
        'INFORMAL_EDUCATION',
        24,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '7d8e3388-649f-4dae-bbaa-bfdb64178253',
        3,
        'MASTERS_LEVEL',
        24,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd91b036e-8bb0-47d5-88cc-87c4129251e6',
        3,
        'NURSERY',
        77,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '7c522b71-0c53-40e1-9e40-7f6cbe82fd60',
        3,
        'OTHER',
        3,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '7a1f8313-efc8-4b90-87a3-6db00735a18b',
        3,
        'PHD_LEVEL',
        8,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e49c9e1f-dab7-48bb-9813-ccc53b580b64',
        3,
        'SLC_LEVEL',
        319,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '8d8d0893-9603-49b7-a1fa-30e1850496be',
        3,
        'UNKNOWN',
        137,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b69b5703-75cb-42e6-ad71-aaa179bcf515',
        4,
        '1',
        42,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '4c3b8cb7-a1f8-4f5a-98b0-b82660f5e105',
        4,
        '10',
        168,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '42fb05d5-0ef4-415f-acf5-5837fe7a2457',
        4,
        '2',
        39,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '4ae5d5ba-80f4-4a03-a576-700d67d15e4b',
        4,
        '3',
        68,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '308edff5-057f-42f5-9a9c-50d3eaf777f6',
        4,
        '4',
        80,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '4f549e42-2afe-4434-af6b-6a01203ecb75',
        4,
        '5',
        138,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd0b7b9b0-854f-47f0-a3f6-5ee418cf6c22',
        4,
        '6',
        100,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '3c633a7e-075b-4a6c-b8cf-bd155da5b41d',
        4,
        '7',
        110,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '0b46fe67-799c-4cc0-bc59-721670e9e509',
        4,
        '8',
        146,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd0507e65-e97c-4c72-9766-17728c5bebf8',
        4,
        '9',
        72,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '803821f9-dd80-4c3c-9df6-2eb812af286e',
        4,
        'BACHELOR_LEVEL',
        3,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '55845f44-5946-42c8-b477-1f33c9e92dce',
        4,
        'CHILD_DEVELOPMENT_CENTER',
        10,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e9dc20a3-82f1-4f72-8866-626cedaa8231',
        4,
        'CLASS_12_LEVEL',
        141,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd2fffa66-5829-4dfe-8895-c2a95baab0cc',
        4,
        'EDUCATED',
        2,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a3c964ce-3422-4bba-aa08-91ab0fe2ea79',
        4,
        'NURSERY',
        11,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '8342199b-7e9e-4f34-a9cb-f4f93edb9bcb',
        4,
        'PHD_LEVEL',
        3,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a2e6f9db-8871-48aa-ba55-2d1876c32f2d',
        4,
        'SLC_LEVEL',
        22,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '233ca107-43d6-4765-a9c0-642bd6190dbc',
        4,
        'UNKNOWN',
        79,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '6a46c64f-0670-4331-99d8-0da77dcf4fe5',
        5,
        '1',
        67,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'c8a8886e-c365-48f8-bb5c-070176500cac',
        5,
        '10',
        388,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '6bffbcb7-e257-4291-8425-9bb1da8a5e58',
        5,
        '2',
        82,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e2fbd403-5730-4cd6-97e8-e6426e8779df',
        5,
        '3',
        107,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '7806019f-bc4b-46c0-b9af-9122f3429eb3',
        5,
        '4',
        139,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '944309c7-4c4b-4bce-8481-7ef947b35be4',
        5,
        '5',
        256,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '3ba931ce-f87d-4a74-85ec-0e5aec3244f5',
        5,
        '6',
        194,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '1e16f45f-6881-4af7-9ca8-a1abbf2db003',
        5,
        '7',
        224,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '6372234d-21d3-4596-9072-4bc31deae01f',
        5,
        '8',
        307,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a2d43892-efe8-4b2a-8d5a-b0a7cab66fd0',
        5,
        '9',
        219,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b0b1cb59-7ec9-408a-bf9d-f4e2f010d27b',
        5,
        'BACHELOR_LEVEL',
        53,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'f2b520be-f7e7-457f-b3a4-5c62eeb02a58',
        5,
        'CHILD_DEVELOPMENT_CENTER',
        7,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '487211de-bdb4-464d-b334-92410eda1425',
        5,
        'CLASS_12_LEVEL',
        432,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '24ef5827-be83-4a16-a3b2-3803ddeb543a',
        5,
        'EDUCATED',
        434,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd9ee6993-99f8-4884-832c-35c41e1788e4',
        5,
        'MASTERS_LEVEL',
        17,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'caa13ad3-ba33-42e5-8883-7302c012fcba',
        5,
        'NURSERY',
        96,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '7e338156-a737-4a97-a0df-d57ca911e441',
        5,
        'OTHER',
        1,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a7fdd878-7b3a-4bf5-af9b-6889c59b3e36',
        5,
        'PHD_LEVEL',
        1,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '9c27ca04-29b5-4fb7-9cc2-2958dbb89b9b',
        5,
        'SLC_LEVEL',
        432,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '603c501a-11d3-4bb8-b838-7059d8424284',
        5,
        'UNKNOWN',
        18,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e310ceb8-5d9f-440f-87ed-438e26186d81',
        6,
        '1',
        78,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '30f59053-4320-4aff-8878-17b692096992',
        6,
        '10',
        359,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '90aebe2d-5d82-493b-8450-faa2616a5ceb',
        6,
        '2',
        97,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '66d1fcfc-ce41-49cc-9a66-f758830d230a',
        6,
        '3',
        91,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '5556e7ef-ed27-4c6a-87d6-47562e63a0f8',
        6,
        '4',
        96,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'dea7d496-13ac-4b59-9e18-eba620a78f9d',
        6,
        '5',
        224,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '9e76d282-1522-4d8a-9b6e-cac90e1918e5',
        6,
        '6',
        174,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '977c090b-e528-49b4-8639-c3360f9aa791',
        6,
        '7',
        193,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'f933ef26-2370-4073-800e-03876e879182',
        6,
        '8',
        295,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'da1325fa-23ad-44ad-a72e-53393f9872dc',
        6,
        '9',
        179,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '1c4546ab-96f1-46c3-9c4a-780645141f16',
        6,
        'BACHELOR_LEVEL',
        86,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e248ed02-263c-4eab-988c-8d7038ef2695',
        6,
        'CHILD_DEVELOPMENT_CENTER',
        3,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'db565bc0-81f7-4f33-942d-bdfe9b495385',
        6,
        'CLASS_12_LEVEL',
        453,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'ae550e7a-6e91-452e-8b0c-a560e09fb8f5',
        6,
        'EDUCATED',
        40,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'cd654bfb-d267-4988-97e7-fc7aa99c5616',
        6,
        'MASTERS_LEVEL',
        7,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a4769a35-83f5-49d2-a9f2-16c858a9fb4f',
        6,
        'NURSERY',
        95,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'c8a44e69-5af0-42c9-8c1f-e03cb6ac8230',
        6,
        'OTHER',
        2,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'f849d601-0e81-4684-83ab-2c43ff75a373',
        6,
        'PHD_LEVEL',
        9,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e6ded3e7-9415-422b-ac6b-c7d76ec16cc3',
        6,
        'SLC_LEVEL',
        310,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '9cc58dd2-a377-4460-a6c1-2f430e3ecc1c',
        6,
        'UNKNOWN',
        95,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '3d10ee24-3984-4c42-bf35-cc04e546710d',
        7,
        '1',
        69,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '5357d46d-beac-4a59-b955-00b65532e686',
        7,
        '10',
        392,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b2e9db40-c81b-47c3-a2f1-4250b108fea3',
        7,
        '2',
        101,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '0abc3189-3d8c-47ba-906c-acb3356c4a7d',
        7,
        '3',
        109,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'c88e0211-f26c-4c20-8928-e8aaa1ebfc99',
        7,
        '4',
        117,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '0a68a293-ba73-4276-8780-2b0b52b08329',
        7,
        '5',
        207,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '538c7b8f-870e-4581-8a94-4ee7a618822e',
        7,
        '6',
        201,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e4822be5-41f5-468f-bd50-0356c73501cd',
        7,
        '7',
        239,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '9ee40bda-3b5a-42f8-8377-8b2a45f0b4fa',
        7,
        '8',
        341,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '0ac29699-5990-4ea0-9cf0-685c4ac01258',
        7,
        '9',
        221,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '5212c5ab-d024-478d-af7d-04435777e162',
        7,
        'BACHELOR_LEVEL',
        76,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '5c157ddf-30b9-4f6c-92fb-26e1b590bae1',
        7,
        'CHILD_DEVELOPMENT_CENTER',
        1,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd26ba9cc-606f-4c67-b771-20f290699377',
        7,
        'CLASS_12_LEVEL',
        566,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'cbbb1d1c-1949-43d4-9134-76aa6e234442',
        7,
        'EDUCATED',
        153,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '34b5e225-1e42-4596-919a-72d4f4f11242',
        7,
        'MASTERS_LEVEL',
        21,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b10cb6a6-5d5d-42c8-9af2-ad17b4a277e0',
        7,
        'NURSERY',
        95,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '7a80795c-d3f3-40b9-83b0-990f5f5b9c38',
        7,
        'OTHER',
        2,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'df2c5810-2cb8-409a-884d-aaa980362785',
        7,
        'PHD_LEVEL',
        7,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b6222492-ff6e-41b4-af50-b17ea87d2c54',
        7,
        'SLC_LEVEL',
        395,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '9706c845-80f8-49f0-ad20-d3a2701887fb',
        7,
        'UNKNOWN',
        154,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '4c22d3d0-4b50-4d64-8611-0dbba6dde300',
        8,
        '1',
        87,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '9d107860-5666-4c08-8dd6-a32a5e4788ea',
        8,
        '10',
        404,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '30aa9a9e-f0aa-4aa7-afe9-df296c425854',
        8,
        '2',
        93,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b7e33c6c-e279-482a-8c36-3ae98c536914',
        8,
        '3',
        85,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '07e9f7d0-17d7-47b6-89c0-edf52606d169',
        8,
        '4',
        160,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '12a329c1-7a89-49e2-8cea-6d781d7acd78',
        8,
        '5',
        201,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '34c018be-f3a4-453f-96ef-6005fc303b19',
        8,
        '6',
        140,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '2f6b6dd2-6ab2-43e4-8457-518e1b5953fc',
        8,
        '7',
        181,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '47f5c50e-ec63-48f3-87dc-51c04b1d7e5b',
        8,
        '8',
        313,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '08676bed-823f-4ee2-a0df-fc817cdc21ea',
        8,
        '9',
        220,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'a638011d-0c77-4e9f-8473-1918a9ca9e95',
        8,
        'BACHELOR_LEVEL',
        121,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '2e8f0586-9a57-4b3b-8a48-ebb7acc63c8d',
        8,
        'CHILD_DEVELOPMENT_CENTER',
        1,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'add3b7e0-c1ee-4c84-90ae-90eb4c249663',
        8,
        'CLASS_12_LEVEL',
        425,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b4e5d664-a99a-4bbe-9cc8-e9e314cfeccb',
        8,
        'EDUCATED',
        193,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '756c2afa-4c0f-42b0-be48-ce3e05ff17d3',
        8,
        'INFORMAL_EDUCATION',
        7,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd6b58ba9-3b37-40c9-81cc-cc071b65ae29',
        8,
        'MASTERS_LEVEL',
        29,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '5a08660b-6d29-4366-9fff-241492ffa718',
        8,
        'NURSERY',
        104,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '96f02712-3083-413c-9850-1fcb53b1a939',
        8,
        'OTHER',
        8,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'f0d8b4fc-ac10-4df4-b1e5-d01ae18ab6f6',
        8,
        'PHD_LEVEL',
        12,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '6ebcd20a-8501-43a4-9f04-2d42ce28c26a',
        8,
        'SLC_LEVEL',
        357,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '439f9c95-5f63-4b05-ac74-f5b248254f76',
        8,
        'UNKNOWN',
        436,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'bc79db8b-bbcf-458f-99c8-ab40f181d214',
        9,
        '1',
        103,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '0e52d6d7-6ebb-45b4-91ad-a698f3114d6c',
        9,
        '10',
        579,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'e0bfceb9-0441-4698-8702-867b330f3f3f',
        9,
        '2',
        114,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '3ca866a3-aee8-4b1a-8a7a-9e9bd770c668',
        9,
        '3',
        155,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '15e69578-389a-4b18-93dc-1d59a1cc0470',
        9,
        '4',
        150,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'f580c1d6-b588-4c9c-a9d3-b8dcf17c3b36',
        9,
        '5',
        297,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '50f28636-6668-4c27-a096-a826309e632d',
        9,
        '6',
        206,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '8f86a5a2-d497-4323-876e-b65ae261088c',
        9,
        '7',
        260,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'd4739c75-8a85-4935-b87c-deb131deddd8',
        9,
        '8',
        470,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '8e1f96b1-209c-42d5-b42f-c6bd6d8f588b',
        9,
        '9',
        269,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '17b7ba15-496d-401c-85b8-7a51e19b6cac',
        9,
        'BACHELOR_LEVEL',
        246,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'fd6f021d-4366-4367-987a-fe55ed822387',
        9,
        'CHILD_DEVELOPMENT_CENTER',
        4,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'ed898732-1cd4-47c2-b93b-558f3f086615',
        9,
        'CLASS_12_LEVEL',
        770,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '5fa46a09-f200-4751-99d5-2ddf4c2fe124',
        9,
        'EDUCATED',
        282,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'bd42d44d-2533-43fb-b723-cccb3be01894',
        9,
        'INFORMAL_EDUCATION',
        58,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '4cb94e9d-7ab6-4599-b099-d6003f61b6a8',
        9,
        'MASTERS_LEVEL',
        57,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '00a2b411-01de-4969-9343-292addc841ca',
        9,
        'NURSERY',
        121,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '42477add-e98e-4ea2-a30c-f19c7cb0c751',
        9,
        'OTHER',
        7,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'f755f1ed-c039-476a-981c-49c90bd27c5c',
        9,
        'PHD_LEVEL',
        9,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '89c437c2-00ff-474a-b025-65427182de01',
        9,
        'SLC_LEVEL',
        627,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '96400b8a-2bbe-4ce7-b9c8-c851ee391b83',
        9,
        'UNKNOWN',
        56,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b3820425-50e3-424d-a068-0d6aa214190d',
        10,
        '1',
        55,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '9bf59ba8-75ef-415f-85fb-13522cfc2496',
        10,
        '10',
        384,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '763f9ff4-f7ea-49e2-966d-063326451b4b',
        10,
        '2',
        75,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '2670e5cf-7a44-41f0-93f4-64418e0b115d',
        10,
        '3',
        134,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '3fbdacfe-bd06-4172-82df-4bfca8b83589',
        10,
        '4',
        133,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '46ba1811-e8f6-4c8c-bb5e-7377a7f9a6fb',
        10,
        '5',
        219,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '63a0200e-d3d3-423d-b56f-c1f4bd8665c9',
        10,
        '6',
        156,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '8497b69c-0c2b-45dd-a9ef-bf39ca826cc9',
        10,
        '7',
        213,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'b5c76931-ce57-4d19-9b32-3291f9635fe5',
        10,
        '8',
        268,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'db69b8e5-f313-43ef-9a11-3aba91ecf1fa',
        10,
        '9',
        200,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'efb83d71-3ee1-4b5f-9a09-691b24fcb1a2',
        10,
        'BACHELOR_LEVEL',
        131,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '34338aad-392d-4fb3-91d6-dbedbc2d49cd',
        10,
        'CHILD_DEVELOPMENT_CENTER',
        7,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '59e76d76-453d-4948-8cb8-0b1aaaa31aad',
        10,
        'CLASS_12_LEVEL',
        533,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '9043597b-52bf-4019-bf6a-ccbaf8252f38',
        10,
        'EDUCATED',
        146,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '2f5cd51a-c0ec-423f-8611-0bce37b37b3f',
        10,
        'INFORMAL_EDUCATION',
        48,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'f3b8fb37-8c50-4448-a236-c2627d6149d7',
        10,
        'MASTERS_LEVEL',
        53,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '8798ff14-73a3-4bb4-9c3a-b8ff07b3151c',
        10,
        'NURSERY',
        80,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'bc0ca2f3-3d57-4793-8936-3c20e0863515',
        10,
        'OTHER',
        11,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '78a224dc-7afb-48c9-8906-e6070284e659',
        10,
        'PHD_LEVEL',
        8,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        'f49b1a9e-58e7-4a25-829b-ec0d071b8697',
        10,
        'SLC_LEVEL',
        304,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    INSERT INTO acme_ward_wise_educational_level 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '1d064df8-3d5a-4919-85b9-2214df7bd632',
        10,
        'UNKNOWN',
        24,
        '2025-06-30 12:44:47',
        '2025-06-30 12:44:47'
    );
    

    END IF;
END
$$;

