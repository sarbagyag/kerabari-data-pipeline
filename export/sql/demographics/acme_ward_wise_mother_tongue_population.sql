-- Generated SQL script
-- Date: 2025-06-30 11:55:43


-- Check if acme_ward_wise_mother_tongue_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_mother_tongue_population'
    ) THEN
        -- Create enum type for language types if not exists
        IF NOT EXISTS (
            SELECT 1 FROM pg_type WHERE typname = 'language_type_enum'
        ) THEN
            CREATE TYPE language_type_enum AS ENUM (
                'NEPALI', 'LIMBU', 'RAI', 'HINDI', 'NEWARI', 'SHERPA', 'TAMANG', 
                'MAITHILI', 'BHOJPURI', 'THARU', 'BAJJIKA', 'MAGAR', 'DOTELI', 
                'URDU', 'AWADI', 'GURUNG', 'BAITADELI', 'AACHAMI', 'BANTAWA', 
                'RAJBANSHI', 'CHAMLING', 'BAJHANGI', 'SANTHALI', 'CHEPANG', 
                'DANUWAR', 'SUNUWAR', 'MAGAHI', 'URAUN', 'KULUNG', 'KHAM', 
                'RAJASTHANI', 'MAJHI', 'THAMI', 'BHUJEL', 'BANGALA', 'THULUNG', 
                'YAKKHA', 'DHIMAL', 'TAJPURIYA', 'ANGIKA', 'SAMPANG', 'KHALING', 
                'YAMBULE', 'KUMAL', 'DARAI', 'BAHING', 'BAJURELI', 'HYOLMO', 
                'NACHIRING', 'YAMPHU', 'BOTE', 'GHALE', 'DUMI', 'LAPCHA', 'PUMA', 
                'DUMANGLI', 'DARCHULELI', 'AATHPAHARIYA', 'THAKALI', 'JIREL', 
                'MEWAHANG', 'SYMBOLIC_LANGUAGE', 'TIBETIAN', 'MECHE', 'CHANTYAL', 
                'RAJI', 'LOHARUNG', 'CHINTANG', 'GANGAI', 'PAHARI', 'DAILEKHI', 
                'LHOPA', 'DURA', 'KOCHE', 'CHILING', 'ENGLISH', 'JERO', 'KHAS', 
                'SANSKRIT', 'DOLPALI', 'HAYU', 'TILUNG', 'KOYI', 'KISAN', 'WALING', 
                'MUSALMAN', 'HIRAYANWI', 'JUMLI', 'PUNJABI', 'LHOMI', 'BELHARI', 
                'ORIYA', 'SONAHA', 'SINDHI', 'DADELDHURI', 'BYANSI', 'AASAMI', 
                'KAHMCHI', 'SAAM', 'MANAGE', 'DHULELI', 'PHANGDUWALI', 'SUREL', 
                'MALPANDE', 'CHINESE', 'KHARIYA', 'KURMALI', 'BARAM', 'LINGKHIM', 
                'SADHANI', 'KAGATE', 'JONGKHA', 'BANKARIYA', 'KAIKE', 'GADHWALI', 
                'FRENCH', 'MIJO', 'KUKI', 'KUSUNDA', 'RUSSIAN', 'SPANISH', 
                'NAGAMIJ', 'ARABI', 'OTHER'
            );
        END IF;

        CREATE TABLE acme_ward_wise_mother_tongue_population (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            language_type language_type_enum NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_mother_tongue_population) THEN


    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'fe49ea24-7464-4a8b-855c-d29b8d5f703f',
        1,
        'GURUNG',
        1,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '5b033ce1-210f-4e27-bc48-88b9e0b78f9e',
        1,
        'LIMBU',
        737,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '338b2db1-8f0d-4c7e-aacb-84879e388670',
        1,
        'MAGAR',
        579,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '79250f69-a820-4e35-9d6a-62e958b86308',
        1,
        'NEPALI',
        522,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '2d9ba27f-d041-4d8e-97d4-f3cbf70397d4',
        1,
        'RAI',
        206,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'b0b39140-00e7-4a5c-8ce0-a394e5000811',
        1,
        'TAMANG',
        91,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'a9a9345e-f0e5-4409-a1af-947d44733afd',
        2,
        'GURUNG',
        54,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '85be11e0-9504-419a-a33d-5fa9836b4d43',
        2,
        'LIMBU',
        1196,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '17a45635-10fe-422a-bb61-c78a7e408a09',
        2,
        'MAGAR',
        15,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '9facdbee-431b-4fa0-861d-ffb4b0408947',
        2,
        'NEPALI',
        777,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '5b82c992-74f4-40f9-824c-24308d732972',
        2,
        'NEWARI',
        1,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'a36b297b-2d05-46ce-8d55-a2b257630a26',
        2,
        'RAI',
        210,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '8cb8a570-38e8-40f8-abf1-6c5db0117494',
        3,
        'BHUJEL',
        9,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '1cb8540a-c2da-4e38-99f2-c57aae24374a',
        3,
        'LIMBU',
        640,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '4d6811cf-3134-4090-9c00-cee934df8ea5',
        3,
        'MAGAR',
        596,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '00838ec7-ebc2-4140-8194-433ad7a624e4',
        3,
        'NEPALI',
        1118,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'efc0ee06-4683-4d6f-94ef-0e814c395f8a',
        3,
        'NEWARI',
        494,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'f7008e44-6896-4eff-a39e-65e9abce7bd9',
        3,
        'OTHER',
        16,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'd8106c6b-b2d7-4079-b7c4-abab29f09224',
        3,
        'RAI',
        232,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '5300fa53-e250-454b-b934-550da37c8ef1',
        3,
        'TAMANG',
        379,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '94c08612-b461-46bf-8462-295efec6a21c',
        3,
        'THARU',
        5,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'a4d004bb-969c-454b-855a-aba36d63595e',
        4,
        'NEPALI',
        1725,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '4ac0a90c-fd77-414d-82ff-c2e98a2b80d0',
        4,
        'RAI',
        4,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'e6c7daee-cd7d-4f24-a46f-404b30b8424b',
        5,
        'BAJJIKA',
        1,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '143aa5db-d0a9-4224-bc13-9cc9fdcd3a03',
        5,
        'KOYI',
        2,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '74434784-3e38-403e-a1b2-76616ab13918',
        5,
        'LIMBU',
        358,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '82273e20-766a-47b9-8aac-03e2c18cfc6e',
        5,
        'MAGAR',
        291,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '440202f9-49e0-4dc2-a0d0-4a35b5452097',
        5,
        'MAITHILI',
        1,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '930dfb00-d86e-47ee-b447-1eaf2a54b4e9',
        5,
        'NEPALI',
        3117,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'fe035bc1-423d-4d69-9170-8cf717f5cea0',
        5,
        'RAI',
        386,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'e0007343-b0df-4156-9c94-ce50145762b7',
        5,
        'SHERPA',
        1,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '331875e7-474d-41d4-97fa-fab76c7c2196',
        5,
        'TAMANG',
        36,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '39f124d6-3537-4746-bb1c-6d931ce0ea95',
        6,
        'GURUNG',
        2,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '8bb7b67d-bd37-415c-9e32-d6fa22485284',
        6,
        'LIMBU',
        309,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '0902abfc-a89b-4d24-a81e-8b7823768956',
        6,
        'MAGAR',
        361,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '03fb11de-e450-498a-9bcc-85a03af16947',
        6,
        'MAITHILI',
        2,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '289ef453-f30e-4423-aaaa-ffc79dd7e920',
        6,
        'NEPALI',
        3092,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '4c1d8061-5392-40a8-96a5-096aa55b6cc3',
        6,
        'NEWARI',
        71,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'b28de623-51ef-4bbc-b06a-87391e2a04ec',
        6,
        'OTHER',
        4,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'e34ec2dd-48fe-4d91-b19d-16136d24bc64',
        6,
        'RAI',
        262,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '4b1d82bc-082e-4863-96e2-89a8f48a7880',
        6,
        'SHERPA',
        5,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '66537f10-98d9-48f8-aed6-300e208e4b9c',
        6,
        'TAMANG',
        26,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'cafe1fb2-1c5f-471b-b1ef-c1cfa6372425',
        6,
        'THARU',
        4,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'a6e1a359-eea2-4889-88be-f0078a41809b',
        7,
        'BANTAWA',
        8,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '82e8f003-1c0c-4548-a34d-73d1cd58636f',
        7,
        'CHAMLING',
        5,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '6a37ed8c-ae1e-45fa-8282-caccd0bed1e7',
        7,
        'KHALING',
        3,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'cead19f3-c199-4a80-9727-43a361eee612',
        7,
        'LIMBU',
        1043,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '57820ee5-2613-4d65-9837-92e39ca96762',
        7,
        'MAGAR',
        28,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '24795c6f-c5f2-4998-aedf-f21ff3d60f45',
        7,
        'NEPALI',
        2662,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'a52aacec-d761-4b92-a5d5-b8961ed02d16',
        7,
        'RAI',
        437,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'b342c2bf-015b-46f2-b299-59e354c8adb6',
        7,
        'TAMANG',
        22,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '77de8aa9-94b7-4fbb-b412-9d49c33cb414',
        7,
        'YAKKHA',
        55,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '26a7749e-bbfb-4ae9-b32e-aabe717e0004',
        7,
        'YAMPHU',
        22,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '12e7db6d-0f00-4acf-826a-5e6efd492e93',
        8,
        'DANUWAR',
        12,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'c290de5d-26fe-4414-8072-992a9a637452',
        8,
        'LIMBU',
        127,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '212e42fa-09d7-44ef-9524-e06389bcd8ca',
        8,
        'MAGAR',
        29,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '01e4ca7e-0e2b-4d9d-890c-1b15fd6d76b0',
        8,
        'MAITHILI',
        19,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'e52ce339-7177-4cd4-8350-48be9dbaff50',
        8,
        'MUSALMAN',
        5,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'd9804d92-67dc-4d75-8679-6089b4cabf9e',
        8,
        'NEPALI',
        3698,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '9001566e-559f-4059-946b-0494ea240d16',
        8,
        'NEWARI',
        73,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'b91ccaae-af54-48eb-bd36-bb5746955e16',
        8,
        'OTHER',
        35,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '6e74a266-bb03-4794-b403-be0cb994404c',
        8,
        'RAI',
        89,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'a2b6ae3e-140c-492c-aaf3-ad90ce0ae032',
        8,
        'RAJBANSHI',
        8,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '1d1764a7-639e-4e51-8dfc-7529dcc245e5',
        8,
        'TAMANG',
        90,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '2002a6c7-c5bc-4b31-9138-077f286b5b4b',
        8,
        'URDU',
        17,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '9b365de9-2878-4f3d-9eae-746bc65bf8a0',
        9,
        'BANTAWA',
        10,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '254021c1-117b-4db9-8e3d-0571e86b1fe1',
        9,
        'CHAMLING',
        4,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '8c7a73a2-f8fb-4003-bfa9-34797d84df1e',
        9,
        'GURUNG',
        29,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '910a8432-8c94-4f18-9367-4179e8ea1c50',
        9,
        'KUMAL',
        10,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '8b8d3da8-907d-4364-9262-1c126ba0a900',
        9,
        'LIMBU',
        342,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'a5936a94-7b60-4e83-98ac-d68e14a35724',
        9,
        'MAGAR',
        322,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'fc34bf6f-9e57-497d-aeef-9abef93c4227',
        9,
        'MAITHILI',
        32,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '40b67284-b6a9-4cda-bca1-a7df65a12244',
        9,
        'NEPALI',
        4497,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '3d130c28-78f8-48f4-840e-3a28cb43cac7',
        9,
        'NEWARI',
        5,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'ef28387f-b31b-400d-ab92-f3bf7c42447d',
        9,
        'RAI',
        421,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '67277838-ad27-4a2c-a276-57ff8a6fab8d',
        9,
        'RAJBANSHI',
        1,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '1a832cb5-d23a-4a04-8dbb-5783996d713a',
        9,
        'SYMBOLIC_LANGUAGE',
        4,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '7e4f87ce-3e49-4624-91ec-7ed17a25df6b',
        9,
        'TAMANG',
        207,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '4b25fea3-6ef2-4168-879c-6b78a8603140',
        9,
        'THARU',
        23,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '587d8b75-881b-46aa-a3f8-cb10e83d28b8',
        9,
        'THULUNG',
        5,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'e218b746-172c-4c47-810f-12073df49e42',
        9,
        'YAKKHA',
        5,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '5b3fc9a4-12ce-4196-a908-37c1a8740908',
        9,
        'YAMPHU',
        6,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '3a4606cd-76ea-402b-bf4b-b3085ffea944',
        10,
        'BHOJPURI',
        4,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '11720639-7f16-4fb4-9c64-902a233457d2',
        10,
        'GURUNG',
        8,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '97320a12-61f6-499f-befe-527e26550f7b',
        10,
        'LIMBU',
        381,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'd3b7c7c7-f17c-4325-9911-f127815e9768',
        10,
        'MAGAR',
        272,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '3e29f351-f14d-4750-9d52-19b4b06bc8e4',
        10,
        'MAITHILI',
        6,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'b9905370-fad2-459d-9a6a-1235d57c9c09',
        10,
        'NEPALI',
        2807,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'd1b7672d-957f-4d06-9e65-4b9e5626d4f3',
        10,
        'NEWARI',
        9,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'bd82fa09-d312-4777-8501-38eeedfcc37e',
        10,
        'RAI',
        105,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '926f2130-08da-4770-adc5-68e160597517',
        10,
        'RAJBANSHI',
        9,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'b9a59abd-2d94-4285-b1f7-2d328a2f6ff2',
        10,
        'SHERPA',
        5,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        'dda510ed-9415-48fd-ae6e-319b51fdc8db',
        10,
        'TAMANG',
        210,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '43bff0c9-c481-4bf0-bc5d-d9089b03f563',
        10,
        'THARU',
        6,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '5d637d6e-3607-425a-9e3c-3a7db3eef0f0',
        10,
        'URAUN',
        5,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    INSERT INTO acme_ward_wise_mother_tongue_population 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '7c473c6f-5199-421a-8895-828de1c8b7f0',
        10,
        'YAKKHA',
        7,
        '2025-06-30 11:55:43',
        '2025-06-30 11:55:43'
    );
    

    END IF;
END
$$;

