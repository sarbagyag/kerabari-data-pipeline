-- Generated SQL script
-- Date: 2025-06-30 12:59:45


-- Check if acme_ward_wise_household_outer_wall table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_household_outer_wall'
    ) THEN
        CREATE TABLE acme_ward_wise_household_outer_wall (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            wall_type VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_household_outer_wall) THEN


    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '172a4efc-00f0-46de-a69c-0d35b4fc8716',
        1,
        'BAMBOO',
        23,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'b2aab1a9-83cc-41be-97c4-7186ef952ae0',
        1,
        'CEMENT_JOINED',
        24,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'c947cef4-e736-4313-b7dd-74bbcdf34ee3',
        1,
        'MUD_JOINED',
        135,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '3c236d27-8624-4126-8702-add27ae4bf2b',
        1,
        'OTHER',
        6,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'c2c73628-eb26-409f-bca1-f5065c6313c3',
        1,
        'TIN',
        78,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '39ea932e-1902-4587-9b93-6e53ad9246ba',
        1,
        'WOOD',
        223,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '633033e9-e9e7-4d4c-9f73-0d9eef89ddd5',
        2,
        'BAMBOO',
        4,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'ecaf9e63-2224-429c-bee6-4ca9b9418c54',
        2,
        'CEMENT_JOINED',
        61,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '60d31428-94f0-47e8-a5c6-a308f492b90f',
        2,
        'MUD_JOINED',
        381,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '2c30b6ff-ccab-4e69-8a9f-f0ae369353dc',
        2,
        'OTHER',
        36,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'a7840196-d41a-49b4-bb3c-5f00ef4b3d1e',
        2,
        'TIN',
        83,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '0ffb354a-ca86-4b41-a5e8-258526af2732',
        2,
        'WOOD',
        13,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '4f9b8c9c-a45f-4248-9a59-ee02d82bf656',
        3,
        'BAMBOO',
        102,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'ccc4eba7-f5be-4ece-bd68-f5ff14823ec4',
        3,
        'CEMENT_JOINED',
        196,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'cf2e5ca9-8c4c-450a-a22a-3eb68e371a41',
        3,
        'MUD_JOINED',
        1,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'e403994c-0082-461b-9f10-3e17ead74400',
        3,
        'OTHER',
        16,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'f7d1a995-9361-4196-b6c1-bdd8013cc529',
        3,
        'PREFAB',
        16,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '4b7db815-7315-4d70-9ce0-985651f36ef5',
        3,
        'TIN',
        135,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'ccc1be44-b215-4889-b0a2-c7f355b1c286',
        3,
        'WOOD',
        370,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '587dd875-d60f-4186-a1cf-117b8cbd93fd',
        4,
        'BAMBOO',
        107,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'd73a731e-d4ec-4f97-90db-12589052a029',
        4,
        'CEMENT_JOINED',
        7,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '60fddc7c-e1c7-472e-a2fb-ca7135fd661c',
        4,
        'MUD_JOINED',
        14,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '53b86f85-750c-4dd9-be67-7e793bc9bba4',
        4,
        'TIN',
        138,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'ca0a6265-c6fd-4f16-a4a9-9e82079bd56b',
        4,
        'UNBAKED_BRICK',
        1,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'c27d8d16-feec-40e4-95c4-2e89479c88db',
        4,
        'WOOD',
        160,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'ce2ae9a2-0ca0-474a-a339-3ee65158ff52',
        5,
        'BAMBOO',
        160,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'c3bb49b3-1b46-4c15-bb72-1c825b252a02',
        5,
        'CEMENT_JOINED',
        275,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '29c49b47-d23a-4855-ad95-1f8c1c625b07',
        5,
        'MUD_JOINED',
        12,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '37bd5101-e995-4be7-8d43-4534a2db88c7',
        5,
        'OTHER',
        4,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'a0dc0a43-f35c-4bb7-9a07-f4561ed91edf',
        5,
        'PREFAB',
        6,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '52549cac-ab83-43c4-85fd-60ba7ec1e098',
        5,
        'TIN',
        124,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '9fb2a15d-6e37-41c7-9d9f-eec1814d298b',
        5,
        'UNBAKED_BRICK',
        5,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '103dad34-a49e-4138-90d8-26ffa03a9e65',
        5,
        'WOOD',
        428,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '72db8761-def5-4376-8dbb-915210c9bc4c',
        6,
        'BAMBOO',
        198,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '2d951578-bbcf-44de-a787-b3d5ffb94d4d',
        6,
        'CEMENT_JOINED',
        350,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'f37a40f9-8137-414a-8741-dcc472b5f4b4',
        6,
        'MUD_JOINED',
        11,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '274d2168-3600-49e5-93f7-c5d5c3fb4621',
        6,
        'OTHER',
        28,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '533103a3-3a39-4350-8d96-944642e9d886',
        6,
        'PREFAB',
        5,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '00fa7944-3cbb-404a-a929-4842d7c8b979',
        6,
        'TIN',
        133,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '3fcee49a-0c07-4671-8f68-6d716125f854',
        6,
        'UNBAKED_BRICK',
        7,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '61578648-01ba-4cd9-bc86-e46a8ce45608',
        6,
        'WOOD',
        282,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '460a3790-a6ed-4b77-83f8-09a1aded8bee',
        7,
        'BAMBOO',
        199,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '165c7305-68aa-4e45-ad97-8b12e14d56a2',
        7,
        'CEMENT_JOINED',
        353,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '90e9e5ca-7e0c-496a-9a8b-912ec245ff61',
        7,
        'MUD_JOINED',
        9,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '48505717-4107-435f-bab1-7a64b9d5f541',
        7,
        'OTHER',
        46,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'c88485a7-a791-45ee-9603-79b38c76fda3',
        7,
        'PREFAB',
        3,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '16b28c03-da0b-4c35-bb22-6a53e8c3bcbf',
        7,
        'TIN',
        76,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '8378145a-9deb-4a1a-bbc2-fb9058e0d0bf',
        7,
        'UNBAKED_BRICK',
        1,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '52441414-e3d8-4aba-9b4c-14e83204cc89',
        7,
        'WOOD',
        376,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '5d2d255b-ccba-4ee2-9947-04356f4be8b6',
        8,
        'BAMBOO',
        78,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '2a566a7d-e89b-4d5b-b33f-655ea201cca6',
        8,
        'CEMENT_JOINED',
        413,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'b659e426-e077-465a-b164-411ec749bdef',
        8,
        'MUD_JOINED',
        13,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '95c1570c-48a6-4e76-845e-84640c410865',
        8,
        'OTHER',
        96,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'c74ffc29-3956-4669-8497-4fb330e3ed81',
        8,
        'PREFAB',
        9,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '2558d566-2696-4869-a9b9-5aaeaf4ee3d1',
        8,
        'TIN',
        104,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'fd56f881-4d98-4bc0-ad82-2728776f656a',
        8,
        'WOOD',
        356,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '08e5b544-8f3c-4209-b34a-1c97085cd268',
        9,
        'BAMBOO',
        273,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'b6e39b70-82a6-4865-a125-159438a1f2f2',
        9,
        'CEMENT_JOINED',
        534,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '9bfe0e38-f86c-41a4-9766-5c7a5768c13f',
        9,
        'MUD_JOINED',
        16,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '842e3412-5899-4292-a631-17aa551bbda1',
        9,
        'OTHER',
        98,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'a369fe56-eb0f-45f6-912b-69e13643bda9',
        9,
        'PREFAB',
        17,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '0eb3c476-4ef2-4ac5-b3b7-eacfe7a12f3c',
        9,
        'TIN',
        81,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'e3b08c10-bb75-4c8d-8ae6-db857970f960',
        9,
        'UNBAKED_BRICK',
        9,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'bec056db-754f-43c9-b0b4-69f30e2e520c',
        9,
        'WOOD',
        413,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '284cc3a4-5412-41bd-b78a-c7de74a012a9',
        10,
        'BAMBOO',
        57,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '674414cf-8828-4963-8bd0-39f75ce19826',
        10,
        'CEMENT_JOINED',
        428,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '24774eb0-ef8e-44d4-9b71-3fdc23430d24',
        10,
        'MUD_JOINED',
        4,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'a718412b-adfa-491f-8aa7-9f301a956bbd',
        10,
        'OTHER',
        72,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '1957c824-ea70-48c5-b76a-a7434f1be4be',
        10,
        'PREFAB',
        3,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'fcacc6b4-a597-47ac-bfeb-68abd41b7ddd',
        10,
        'TIN',
        88,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        'a72ba952-485b-43f8-b71d-dc1c19cf48e5',
        10,
        'UNBAKED_BRICK',
        4,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    INSERT INTO acme_ward_wise_household_outer_wall 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '88684b0f-2ce2-4c17-a595-5b574a0dbbfa',
        10,
        'WOOD',
        275,
        '2025-06-30 12:59:45',
        '2025-06-30 12:59:45'
    );
    

    END IF;
END
$$;

