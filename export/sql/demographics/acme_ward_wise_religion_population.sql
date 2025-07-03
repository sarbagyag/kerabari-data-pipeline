-- Generated SQL script
-- Date: 2025-06-30 11:49:06


-- Check if acme_ward_wise_religion_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_religion_population'
    ) THEN
        CREATE TABLE acme_ward_wise_religion_population (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            religion_type VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_religion_population) THEN


    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'ca59656b-76f5-4808-8eee-34e65a499bbc',
        1,
        'BUDDHIST',
        360,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'e8ea33d8-45e3-473d-b012-9ddc6064ce6e',
        1,
        'CHRISTIAN',
        343,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '0099df29-a98a-43c0-9968-4aabeff2501d',
        1,
        'HINDU',
        1140,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '824b5879-6ea0-4e8b-80a7-b0a7a1d5304a',
        1,
        'KIRANT',
        293,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '5f1f6b77-2ee1-4b05-8545-7a3c61ba9483',
        2,
        'CHRISTIAN',
        516,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '1eb4a629-c267-43e4-9b7f-8366fbbfe51e',
        2,
        'HINDU',
        1058,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '021f681e-3d52-4e69-8987-dcc10525e2ff',
        2,
        'KIRANT',
        579,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'e56f4bda-7889-4784-b046-272cd9c0a8cc',
        2,
        'NATURE',
        100,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '3ce7e07c-5277-45a8-ad18-9ebac1e667b4',
        3,
        'BUDDHIST',
        359,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'eac29068-aef6-4cae-ae8c-01686dbce571',
        3,
        'CHRISTIAN',
        469,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '929c728e-e339-4a0c-b6bd-2f0ca9c98e4c',
        3,
        'HINDU',
        2282,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '1c839ac9-80b3-484d-9f02-1e81c376cd4e',
        3,
        'KIRANT',
        329,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '94733e05-181a-4da4-86bf-8843d5ae3b50',
        3,
        'OTHER',
        25,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '8337ecfb-ab1a-49f6-bfce-872bc08db38c',
        3,
        'SIKH',
        22,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '2f152911-9f35-4432-9990-3d2f30d93c48',
        4,
        'BAHAI',
        7,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '2ed8cdfd-58a8-4da0-8bf7-b54153a35cd7',
        4,
        'BUDDHIST',
        328,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '60649206-07cb-4f26-ac01-b71ca0b72f86',
        4,
        'CHRISTIAN',
        82,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'e665717f-0288-458b-8979-e6bcbe2535ea',
        4,
        'HINDU',
        981,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '2723785a-a260-4b90-88c1-ee9f1ec6f046',
        4,
        'KIRANT',
        331,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'c80e5d3b-6fe7-47c0-928b-b5374afafe09',
        5,
        'BUDDHIST',
        268,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '11094964-f980-4ced-8938-e9e3cd39a868',
        5,
        'CHRISTIAN',
        162,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '22446f62-6cb1-4411-b3d7-9272ca355905',
        5,
        'HINDU',
        2345,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'a6b69338-b56b-46d8-97d3-551a567d9dc2',
        5,
        'KIRANT',
        1371,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'dc83c142-44a1-4f78-83cb-8d74e6afdb6b',
        5,
        'NATURE',
        27,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'f1b20a9f-d2cd-41f8-a455-dd614799f282',
        5,
        'OTHER',
        19,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '6e4fb748-b497-49c1-ad94-96393b33ccba',
        5,
        'SIKH',
        1,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '21998a61-f034-43cc-b2e2-35645d7c0211',
        6,
        'BUDDHIST',
        544,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '87112aa9-7aec-4a8b-bb0d-a2f117853aa9',
        6,
        'CHRISTIAN',
        149,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '61bfe7e5-dcd4-42b5-b731-86d7b3473584',
        6,
        'HINDU',
        2614,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'f96ae687-0b08-4a45-9934-516029062d94',
        6,
        'KIRANT',
        803,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '28f6623d-2790-4948-a74a-18878ddd37f4',
        6,
        'OTHER',
        20,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'fc1bc272-0dd3-46d7-9d63-294a92c4a1d0',
        6,
        'SIKH',
        5,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'a120f779-7321-40f4-8c7d-4f374269698a',
        7,
        'BAHAI',
        1,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '9883a5b8-0c80-401d-8d00-b1fd1088cf26',
        7,
        'BUDDHIST',
        261,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '36014954-3b7c-4248-a133-6080680ed28a',
        7,
        'CHRISTIAN',
        219,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '6f74294d-e406-4083-829e-9467cf14da2f',
        7,
        'HINDU',
        2058,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '69cff632-5630-4a9e-97b5-cfce6553e8d9',
        7,
        'ISLAM',
        6,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '85039b11-0f9f-40f1-89c6-efdfb9a1c550',
        7,
        'KIRANT',
        1677,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '39915e32-bf7a-4d7e-9f5d-e113481ef564',
        7,
        'NATURE',
        6,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'a128bfe4-a0de-43be-9171-f790c8f7dabc',
        7,
        'OTHER',
        52,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'da076b5c-9209-4aea-bb8e-42c278c28d27',
        8,
        'BUDDHIST',
        191,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'eb69ff7a-b6e1-490d-84e0-22116e803d8e',
        8,
        'CHRISTIAN',
        134,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '092ac599-a985-44dd-8188-5f0258c01629',
        8,
        'HINDU',
        3599,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'f2dc1871-0a46-47cb-9116-0962a14ab876',
        8,
        'ISLAM',
        20,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '6bb605b8-f1a7-4e0d-9c1c-fcbfca90a7cf',
        8,
        'KIRANT',
        210,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '90db54eb-6416-4a7e-9c50-89da71b7e785',
        8,
        'OTHER',
        17,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'a1bdfaa0-51ed-492a-8cd3-b801744ed9d4',
        8,
        'SIKH',
        27,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '127a9b4d-f6ac-419a-8c9f-6669fd134d7a',
        9,
        'BON',
        12,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'b93f5ebc-3681-4f7b-bf93-0a775ab145b6',
        9,
        'BUDDHIST',
        809,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'c0ac9db0-a63b-4c6b-9b8b-c69a4d8a5590',
        9,
        'CHRISTIAN',
        283,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '75f94f36-ab14-4736-a4b6-ce62f626592c',
        9,
        'HINDU',
        4064,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '70f6f406-6e55-4b8f-a80f-834123d2f90f',
        9,
        'KIRANT',
        747,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        'b9eae57f-0230-4088-ad86-fa86c3fce8eb',
        9,
        'OTHER',
        3,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '9a572513-3276-4a53-a014-9881ac291b49',
        10,
        'BUDDHIST',
        270,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '20beb62b-14f9-4896-b485-871de26ee4dd',
        10,
        'CHRISTIAN',
        448,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '26353645-6c87-4c48-889a-6704f95984e8',
        10,
        'HINDU',
        2431,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '91aebca6-4f88-4cea-95cb-b962d39aca8d',
        10,
        'KIRANT',
        644,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '8c051a04-63ed-4a9f-acd6-6781c2c0271f',
        10,
        'NATURE',
        5,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    INSERT INTO acme_ward_wise_religion_population 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '41bef51e-14bd-4433-8485-96b9392029e4',
        10,
        'OTHER',
        26,
        '2025-06-30 11:49:06',
        '2025-06-30 11:49:06'
    );
    

    END IF;
END
$$;

