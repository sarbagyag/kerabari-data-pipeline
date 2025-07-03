-- Generated SQL script
-- Date: 2025-06-30 12:34:11


-- Check if acme_ward_wise_foreign_employment_countries table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_foreign_employment_countries'
    ) THEN
        -- First create the enum type if it doesn't exist
        IF NOT EXISTS (
            SELECT 1 FROM pg_type WHERE typname = 'foreign_employment_country_enum'
        ) THEN
            CREATE TYPE foreign_employment_country_enum AS ENUM (
                'AZERBAIJAN', 'NIGER', 'NIGERIA', 'NICARAGUA', 'THE_NETHERLANDS',
                'NORWAY', 'NEPAL', 'NEW_ZEALAND', 'PERMISSION', 'PANAMA',
                'PERU', 'BOSNIA', 'PHILIPPINES', 'PAKISTAN', 'POLAND',
                'PORTUGAL', 'PUERTO_RICO', 'PARAGUAY', 'QATAR', 'INTERPOL',
                'ROMANIA', 'BANGLADESH', 'RUSSIA', 'SAUDI_ARABIA', 
                'CECILS', 'SRIDAN', 'SWEDEN', 'SINGAPORE', 'SIERRA_LEONE', 
                'SAN_MARINO', 'SENEGAL', 'SOMALIA', 'BELGIUM', 'SYRIA', 
                'FESTIVAL', 'TOGO', 'THAILAND', 'TAJIKISTAN', 'BITE', 
                'TUNISIA', 'TONGA', 'EAST_TIMOR', 'TURKEY', 'BULGARIA', 
                'TAIWAN', 'TANZANIA', 'DUNGLAND', 'UKRAINE', 'UGANDA', 
                'UNITED_NATIONS', 'UNITED_STATES_OF_AMERICA', 'URUGUAY', 'UZBEKISTAN', 
                'BAHRAIN', 'VATICAN_CITY', 'VENEZUELA', 'VIETNAM', 'FLOUR', 
                'WELLS', 'WESTERN_SAMOA', 'YEMEN', 'TOKYO', 'YUGOSLAVIA', 
                'SOUTH_AFRICA', 'BURUNDI', 'ZAMBIA', 'ZAIRE', 'ZIMBABWE', 
                'KOSOVO', 'BRUNEI', 'BOLIVIA', 'BRAZIL', 'UNITED_ARAB_EMIRATES', 
                'BAHAMAS', 'BHUTAN', 'BOTSWANA', 'BELARUS', 'CANADA', 
                'CAMBODIA', 'CONGO', 'SWITZERLAND', 'CROATIA', 'CHILE', 
                'AFGHANISTAN', 'CAMEROON', 'CHINA', 'COLOMBIA', 'COSTA_RICA', 
                'CUBA', 'CYPRUS', 'CZECHOSLOVAKIA', 'GERMANY', 'DUBAI', 
                'DENMARK', 'ALBANIA', 'DOMINICA', 'ALGERIA', 'ECUADOR', 
                'EGYPT', 'SPAIN', 'ETHIOPIA', 'FINLAND', 'FIJI', 
                'FAWNS', 'UNITED_KINGDOM_OF_GREAT_BRITAIN', 'ARMENIA', 'GHANA', 'GAMBIA', 
                'GUINEA', 'GREECE', 'GUATEMALA', 'HONG_KONG', 'THE_AIR', 
                'HAITI', 'HUNGARY', 'INDONESIA', 'ANGOLA', 'REPUBLIC_OF_IRELAND', 
                'ISRAEL', 'INDIA', 'IRAQ', 'IRAN', 'ICELAND', 
                'ITALY', 'JAMAICA', 'JORDAN', 'JAPAN', 'ARGENTINA', 
                'KENYA', 'NORTH_KOREA', 'SOUTH_KOREA', 'KATHMANDU', 'KRVET', 
                'KAZAKHSTAN', 'ARSHATYA', 'LEBANON', 'HERZEGOVINA', 'AUSTRALIA', 
                'SRI_LANKA', 'LIBERIA', 'LESOTHO', 'LUXEMBOURG', 'LEON', 
                'LIBYA', 'MOROCCO', 'MONACO', 'MADAGASCAR', 'THE_GARDENER', 
                'ARUBA', 'MYANMAR', 'MONGOLIA', 'MACAU', 'MALTA', 
                'MAURITIUS', 'MALDIVES', 'MEXICO', 'MALAYSIA', 'MOZAMBIQUE', 
                'NAMIBIA', 'OTHER'
            );
        END IF;

        -- Create the table
        CREATE TABLE acme_ward_wise_foreign_employment_countries (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            country foreign_employment_country_enum NOT NULL,
            population INTEGER NOT NULL CHECK (population >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_foreign_employment_countries) THEN


    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '94c0b354-a1aa-4676-8682-30561c641bef',
        1,
        'IRAQ',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'e5dc4056-44f3-4b3f-97a8-8524d456b90a',
        1,
        'NORTH_KOREA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '29e1b2ac-d98a-4be1-90ba-51e935d67cd9',
        1,
        'QATAR',
        28,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'bc4beb3d-f6a8-4711-9b7c-e54188bb63c8',
        1,
        'OTHER',
        6,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c339d710-4572-43ec-b03d-ab7fb3c5d5dc',
        1,
        'CANADA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6cd7b279-efae-457e-95b3-733089c47fa5',
        1,
        'GREECE',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c20909e6-cb2d-4139-9095-f61bd9df0f30',
        1,
        'JAPAN',
        11,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd569bfbe-5198-483a-a826-a5059942577a',
        1,
        'SOUTH_KOREA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'aa715867-02e3-4f78-a7cf-b44b93b671fd',
        1,
        'DUBAI',
        49,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'defc3c20-eb4a-488b-a076-81419a8ae1a6',
        1,
        'NIGERIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '682010dc-6f32-4663-9ba8-d9db42e25351',
        1,
        'THE_NETHERLANDS',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'a7b11f2a-1f2d-4106-96a3-3314e8e969f6',
        1,
        'POLAND',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '469035d9-4ca1-421d-ae66-694a00531fd8',
        1,
        'BAHRAIN',
        9,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '89a6e203-e05e-4b13-a131-1060123af56e',
        1,
        'BRUNEI',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '10bd98bb-3807-4687-9493-a0d72a361468',
        1,
        'INDIA',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '324bc6e7-4aaf-418e-8045-1469386e6b5f',
        1,
        'MALAYSIA',
        53,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '06304703-616d-4b0a-9983-60a4d8da3528',
        1,
        'RUSSIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9b3aff24-0b43-4906-a75b-224ef6e83557',
        1,
        'ROMANIA',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '0a2dde78-b0a2-462b-802d-14d1e3a03dff',
        1,
        'UNITED_STATES_OF_AMERICA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '0a6a0fb0-e21d-49a8-84fd-e570c5605ec5',
        1,
        'CYPRUS',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2382ca3b-2f64-43dc-869f-a87d00705fec',
        1,
        'SAUDI_ARABIA',
        29,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'be73b88d-8a5c-4e34-a8d5-305bfb4d2922',
        1,
        'SINGAPORE',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9cc9e606-0253-4c0c-8714-b67d0f99d85d',
        1,
        'SPAIN',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9233d437-b209-4fd2-af28-894577a81c16',
        1,
        'SWEDEN',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '29bbdb21-6e94-4993-86a7-7c9ab05ee815',
        1,
        'HONG_KONG',
        8,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '674fc6f0-58ff-427c-aebd-78e6070daff3',
        2,
        'QATAR',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'bf4da116-717e-4f9d-ac23-ed255ad151ad',
        2,
        'CROATIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c8f6e6fb-a37a-4515-b2aa-98c43f86a349',
        2,
        'JAPAN',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'fede0f24-0fa8-4059-b53e-720752559777',
        2,
        'DUBAI',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '279a6f84-d037-4b76-8c13-300e7657ed07',
        2,
        'INDIA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b9a07a68-998d-49ce-867e-f25038dac97b',
        2,
        'MALAYSIA',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6ad1c889-2831-44fd-a831-9db853866bbe',
        2,
        'THE_GARDENER',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '070cdcf4-66cc-483a-9751-a6786926682e',
        2,
        'MALDIVES',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '724e8e3b-92ba-4cc3-b6a0-0127e10e3d7a',
        2,
        'SAUDI_ARABIA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '3ec6abf2-d726-4d68-ad4c-269c433f29bc',
        3,
        'ALBANIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '4771e7ee-8e88-488d-9291-1181f04f7faa',
        3,
        'AUSTRALIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'f9da84ca-12bf-40b0-9129-9bc41e5b64fe',
        3,
        'QATAR',
        31,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '890b67d7-347e-4015-980c-0aa0502de7e4',
        3,
        'OTHER',
        22,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b0fb4c4d-8ca6-44d0-b1a8-193754aab896',
        3,
        'CROATIA',
        8,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '0e566a93-98e0-4994-8121-37d3e9f00d38',
        3,
        'GREECE',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9aa69128-59b0-422b-88d0-e92858efed51',
        3,
        'GERMANY',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'aea65830-63c9-4e1b-8728-93258157a0c2',
        3,
        'JAPAN',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '10914eff-8a7d-4e69-99ae-6d82212984a2',
        3,
        'SOUTH_AFRICA',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '69e3a7bb-1c77-4857-9b1b-054a45919b20',
        3,
        'SOUTH_KOREA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '64f1cb3d-fd11-49de-a397-ffe7fa82fec9',
        3,
        'DUBAI',
        53,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '3cea5188-3dd4-4026-81d0-9f278b7c5412',
        3,
        'PORTUGAL',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '849c8a4e-47e8-4260-8f17-71d62d3d2e5c',
        3,
        'POLAND',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '179d13da-f54c-416b-b649-23407a6bb605',
        3,
        'BAHRAIN',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '8af0e4d7-959d-4734-8ffd-47b0dba1a29d',
        3,
        'INDIA',
        21,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '5e4ba888-5f11-4161-9a99-b63a25597c16',
        3,
        'MALAYSIA',
        30,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6311906c-f586-4761-9b80-9852e711bced',
        3,
        'MALDIVES',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '65814bbf-9bf0-488a-a971-21700f62271e',
        3,
        'MAURITIUS',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '0d945336-b880-4cb9-bcb3-701c71d49133',
        3,
        'YEMEN',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '098518d9-04fa-4c05-a8d3-da0fa9bd74e5',
        3,
        'RUSSIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6b46baa3-70f6-4b4c-bf8c-e7342eab39f0',
        3,
        'ROMANIA',
        6,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '369747b0-9909-41d3-aa36-c4ed9236cb75',
        3,
        'UNITED_KINGDOM_OF_GREAT_BRITAIN',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '70480e8d-e8b3-49ee-bd3d-7d81ec1933e5',
        3,
        'CYPRUS',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '218e21a6-fa7f-41ce-9aa4-a33f99181c13',
        3,
        'SAUDI_ARABIA',
        60,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd4b3a286-77b6-4716-a277-63ba815c78d9',
        3,
        'HONG_KONG',
        7,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'fde7fa66-d55e-48d3-8b83-b5d153c95c13',
        4,
        'QATAR',
        18,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6ff2448d-e8cc-4705-abdd-82f4dfe9c311',
        4,
        'CROATIA',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b387a222-da46-4d68-84cd-dfbfd6ac47d3',
        4,
        'GREECE',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6c30dd5e-eb6e-4ae5-b25c-f4c1231b0110',
        4,
        'SOUTH_AFRICA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9961af75-d6e9-46ef-8fc2-dd0f32be701a',
        4,
        'SOUTH_KOREA',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '98844aeb-afbc-49fd-b10e-27055441c35f',
        4,
        'DUBAI',
        37,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '92649ba6-287c-4b07-baf2-3acd7bcfa5f5',
        4,
        'PORTUGAL',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b7798e65-aa66-4c82-a5fb-d120b91c478a',
        4,
        'POLAND',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c576bfc1-6056-4aa9-9954-a943181ead9e',
        4,
        'BAHRAIN',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '1e10da17-cb78-464c-ad0f-fab00e3b0a27',
        4,
        'INDIA',
        7,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '37700f76-bd69-4009-bcc5-776bb0b7798a',
        4,
        'MALAYSIA',
        24,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2f957211-d3e6-44a0-9682-7a212df85521',
        4,
        'MAURITIUS',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'bc6413f8-4446-4b6f-b304-94fe93161933',
        4,
        'UNITED_STATES_OF_AMERICA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '88746ef5-fcf6-4b73-94ea-f41583f866ec',
        4,
        'SAUDI_ARABIA',
        18,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'df71d2b0-7910-4a2a-b1b5-1321498df5a8',
        4,
        'HONG_KONG',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'ea0ee86d-fecd-43d1-a061-271288866b71',
        5,
        'ARMENIA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '1a1cda7b-90c2-42f4-a12f-2a2065420cbe',
        5,
        'AUSTRALIA',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6167f8b3-3879-4ff7-956b-f47027c35846',
        5,
        'IRAQ',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '670fb62f-5ead-465b-b5b1-736368a5c2d2',
        5,
        'NORTH_KOREA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '7b4ee23a-2df3-4b39-a973-ed5d94ce097f',
        5,
        'QATAR',
        60,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '00123f16-fd18-4d4f-ab4c-7b3f6bb18aef',
        5,
        'CAMBODIA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '84347757-b8cb-4f52-8642-0fb91f9e15be',
        5,
        'KATHMANDU',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b781e25a-b6ae-4122-a28c-80b2e1a18ed8',
        5,
        'OTHER',
        47,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '82100463-683e-46cf-9ef9-ec1a8a7a7dae',
        5,
        'CANADA',
        7,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '76a08d02-beb8-475b-a905-1bde1757b8ad',
        5,
        'CROATIA',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '10cf3508-0fce-475f-a0b0-d2f6ba64e1fe',
        5,
        'GREECE',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'a0bd36da-9afc-4e66-aa59-e216100c8a44',
        5,
        'JAPAN',
        14,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'bdec2236-931c-48dd-a80c-9c7ca2826195',
        5,
        'SOUTH_KOREA',
        9,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '862953f6-1cda-4f78-a3d1-b85b6674058d',
        5,
        'DUBAI',
        95,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '957435d2-e13c-4fe6-b1cd-b610139ab838',
        5,
        'PORTUGAL',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2a1b5013-bd70-4537-9787-3c3c1f40587a',
        5,
        'POLAND',
        7,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '962ca39a-b890-4246-91a4-415807551b72',
        5,
        'BAHRAIN',
        24,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd85372e8-50a8-4bd1-9311-c7bd4c55b7d9',
        5,
        'BOSNIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd18482f2-47e7-4230-a1de-e1042d7fb02a',
        5,
        'INDIA',
        7,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6c22d03c-91e8-405b-b487-0de226f786f4',
        5,
        'MONGOLIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'abc98a78-f451-4d88-8178-9b828dddfdd4',
        5,
        'MALAYSIA',
        70,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'cbb413dc-c908-49ec-80c3-34429ded0395',
        5,
        'MALTA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '867ec954-3cab-4547-8e13-8e26323fdcb4',
        5,
        'MALDIVES',
        10,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9af16fc9-b406-4711-b6d3-c18110e4c46c',
        5,
        'MAURITIUS',
        8,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b681804c-3787-4baa-83f0-0f268a2bf35f',
        5,
        'YEMEN',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6d3abfe5-e81c-4672-ab8c-34b06192142e',
        5,
        'ROMANIA',
        11,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2caeb689-1142-4c2e-8889-8fc8378e29fb',
        5,
        'UNITED_KINGDOM_OF_GREAT_BRITAIN',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '118426e7-504f-40c0-bb56-3a8c8daafcc1',
        5,
        'UNITED_STATES_OF_AMERICA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'e908cdcd-f2ae-4aaf-8c84-f41224e30959',
        5,
        'CYPRUS',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '7ff42187-a19e-460a-95d4-23515f86e212',
        5,
        'SAUDI_ARABIA',
        55,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'f9d77ad2-9b0e-4228-b28e-56a80820d699',
        5,
        'SAN_MARINO',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'dcf28e46-7436-4f39-b4a0-257592f6b0b5',
        5,
        'SYRIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '3e421bf0-35ae-4281-b187-ef9d3d004016',
        5,
        'HONG_KONG',
        8,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '56661777-5efc-4d04-aa69-2b32f82a020d',
        6,
        'AUSTRALIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '11716958-fd46-4ce9-b5af-f724b7ddf9f4',
        6,
        'NORTH_KOREA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'fe75aede-d4d8-473f-a62b-4ebddc88d91e',
        6,
        'QATAR',
        37,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'ae380267-1b43-418a-8562-2d5419a503cb',
        6,
        'CAMBODIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2da30526-ac53-49fd-b394-47f179153986',
        6,
        'OTHER',
        6,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '7d1d7f47-3c2b-4501-bf21-206a529264cf',
        6,
        'CANADA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '7f861903-f75e-4522-bbb9-ebe9b43dac8f',
        6,
        'CROATIA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '87b5044a-fa2e-466a-ae78-9305ee08d263',
        6,
        'CHILE',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '78eb3f1e-6553-48d4-8ccd-ba24c4edc646',
        6,
        'JAPAN',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'a9cc6c11-0881-42fc-b5df-e148e1084f57',
        6,
        'SOUTH_AFRICA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'ecbf5ef4-bc32-48b2-b540-7531b8218087',
        6,
        'SOUTH_KOREA',
        9,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '47669998-1b6d-4e4f-a0b8-5f31758a67bb',
        6,
        'DUBAI',
        62,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2cc14ed2-4965-441f-a09b-e30c79bb5cff',
        6,
        'PORTUGAL',
        6,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '08f498ce-1c1b-4907-af7d-c855106671d0',
        6,
        'BAHRAIN',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '7cb69804-9397-4e23-86ab-4f8f8d70d772',
        6,
        'BURUNDI',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '39f7a24a-383c-43c1-896c-2635b6baa54f',
        6,
        'BELGIUM',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '1d9c26db-a157-41de-aeed-4af358110dd9',
        6,
        'BRUNEI',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd84a9790-02af-482c-96dc-7f71484218f6',
        6,
        'INDIA',
        28,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '92f30506-2b32-4cdd-98cc-791674af04cb',
        6,
        'MALAYSIA',
        41,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'bb86b719-6a0d-46ab-9c2e-621b346b13ad',
        6,
        'MALDIVES',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'e726db49-7802-49e6-9965-a56c8e4e7f26',
        6,
        'MAURITIUS',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '88f3bf96-99b0-4635-a4b2-5b56292f42cd',
        6,
        'ROMANIA',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '0b29a8db-a59d-49a6-90d9-704328bf2986',
        6,
        'UNITED_STATES_OF_AMERICA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '5fbd4cb6-1f6b-4691-88c0-a49ced8620fd',
        6,
        'CYPRUS',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'de17dae9-121c-479e-8029-b5997cfdf3f5',
        6,
        'SAUDI_ARABIA',
        49,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b2372516-c31d-4609-a7ee-7d9031510a0c',
        6,
        'SOMALIA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'badd1455-63ee-459f-9235-8886e4195a6f',
        6,
        'HONG_KONG',
        6,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '006ea181-52fd-4848-b0fc-c2147fb94c28',
        7,
        'NORTH_KOREA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd4ac04f9-32f4-4565-9f4f-dd71b85e8784',
        7,
        'QATAR',
        20,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'e266a274-e711-4530-be1a-1a9ff9e84bf2',
        7,
        'OTHER',
        10,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '4387c4bf-eff1-4fe3-81ed-b0536f2b55f3',
        7,
        'CROATIA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c1e6d963-7db8-4b1b-bfb8-56f2bcbc1604',
        7,
        'JAPAN',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'f437435c-98a4-4635-90a3-f7a8c5b9f601',
        7,
        'SOUTH_KOREA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'a91bb39b-6d65-4c51-bc3d-fa168ef2bbe6',
        7,
        'DUBAI',
        11,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '673e8dee-78db-4490-bd19-b7b9d05cc311',
        7,
        'PORTUGAL',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2d76efac-f3dd-43ad-9e0c-55436b373dca',
        7,
        'FINLAND',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'cf2aa910-01c1-4c90-9cda-e715e5112f43',
        7,
        'BAHRAIN',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '3509b9ae-d339-436e-834a-112c6ff37854',
        7,
        'INDIA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '88e7a2ce-1d09-4646-9282-e5cbe499ec1e',
        7,
        'MALAYSIA',
        10,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'cc404692-5fbd-4af7-8425-b1fe615c1690',
        7,
        'MALTA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd6f10324-ba04-4b15-9901-973bc56b0be7',
        7,
        'MAURITIUS',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2c5c04db-6466-4e69-8d55-f3c31842b316',
        7,
        'RUSSIA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '90312278-7633-4a73-9e97-11ede41e84c1',
        7,
        'UNITED_STATES_OF_AMERICA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6a8885b9-db8c-482f-bad6-3d336469ff69',
        7,
        'CYPRUS',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6d89c9dc-4487-48b3-8afd-7445ef898826',
        7,
        'SAUDI_ARABIA',
        11,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '4b2cc26a-3002-48a3-80a5-dc80d41637c6',
        8,
        'AZERBAIJAN',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd36a8d02-f8fa-4e3b-b370-9025e78ec397',
        8,
        'QATAR',
        36,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'da77b47a-36ae-4059-bcc4-a9530111cb34',
        8,
        'OTHER',
        21,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b8a7868f-d0fb-43b3-b697-7d027f634572',
        8,
        'COLOMBIA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '44a54a86-b413-464d-aeff-45c1b19d23a4',
        8,
        'CANADA',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '55177ce7-acc1-4e54-9f9c-93968cd96a7b',
        8,
        'CROATIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'f4fa114a-e29e-4bbb-abae-514b83dfe282',
        8,
        'GREECE',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '0d26c0f4-6aeb-4cb8-a58f-efbebefecbd4',
        8,
        'JAPAN',
        21,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '718ca3fe-9102-41e9-9ff5-5ff3ce7b8600',
        8,
        'BITE',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '08913b95-d78e-4c0a-b413-6a71c8701acd',
        8,
        'SOUTH_KOREA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'dacb9450-7463-4804-b038-d6a0e8c18a5f',
        8,
        'DUBAI',
        46,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '954d08aa-4e12-435e-b220-4c4f8aa2c473',
        8,
        'NIGER',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9d104191-f4c9-48e0-8f90-1fedda563803',
        8,
        'THE_NETHERLANDS',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9810a418-f0d7-4922-844a-2d30478f03db',
        8,
        'NEW_ZEALAND',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9f56d228-a03d-4d73-b647-615f2590723d',
        8,
        'BAHRAIN',
        6,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '14d34e42-cca9-4ce2-b89a-f4b0e873a40f',
        8,
        'INDIA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'a880a8c4-153e-4871-9d71-135b0ac07768',
        8,
        'MALAYSIA',
        44,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd21a5e3a-a3a1-45a4-94c3-9eb3eda9c154',
        8,
        'MALTA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'aaee0fde-6cec-4e4a-9b16-f9d45a7ab7e4',
        8,
        'MALDIVES',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd2ae7406-8103-4d37-9061-cf0ab36e7dcc',
        8,
        'ROMANIA',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'cc892f5b-4cbd-4467-a555-4f3ea97b072b',
        8,
        'LIBYA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '22c1c92e-a641-4b97-b9e5-4b3fc4698d3b',
        8,
        'UNITED_ARAB_EMIRATES',
        6,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '43172c09-b8a4-4fc6-97ba-b6627c080c2d',
        8,
        'UNITED_STATES_OF_AMERICA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '5606780d-9d35-442d-bce0-5ef05fcd4b94',
        8,
        'CYPRUS',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'ba5acab3-5b52-41bb-8567-ac26b6e3c89e',
        8,
        'SAUDI_ARABIA',
        51,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '7a431ddd-2652-4706-ba6a-0a4e42f92bf5',
        8,
        'HONG_KONG',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '0e0da872-ae7a-4f68-b8da-8e635b2c3297',
        9,
        'AUSTRALIA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '7ab3c01b-6961-4b55-8a83-8231c7d9f843',
        9,
        'IRAQ',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'f846c52b-aaa7-4488-93b6-bb82670a0e30',
        9,
        'QATAR',
        116,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c9c4ce97-21e4-43c5-822e-86b56dd269da',
        9,
        'CAMBODIA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'bcafa349-ff7e-4117-80cb-028404f5541e',
        9,
        'OTHER',
        7,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '4f498055-6b60-460d-bce9-c21cc9f7bcf6',
        9,
        'CANADA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9dbaf9b3-7de7-47a3-8ba3-7fd9b0797ecb',
        9,
        'CROATIA',
        9,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '3b38bb5e-aca1-46fb-9269-c5bc5e1b1aeb',
        9,
        'GREECE',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c7fdce01-241d-4a61-aeed-82836eadbcd1',
        9,
        'JAPAN',
        14,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '87f6d62d-dada-4348-bafe-aa0e393c46fa',
        9,
        'DENMARK',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '0e850e9d-1f85-4f4c-a112-5abeda375748',
        9,
        'SOUTH_AFRICA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2ce40251-f190-4f65-9647-00fa05cff7f8',
        9,
        'SOUTH_KOREA',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '250365c8-31ba-455a-b438-72d3f3bc43cf',
        9,
        'DUBAI',
        111,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'a20a8b5e-88ad-416b-b00d-530ea3d0c2e0',
        9,
        'NORWAY',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'a268945a-ba10-4a7f-89cd-4b8bd783b2c5',
        9,
        'PORTUGAL',
        14,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2811da3f-0823-4d90-bd83-6a320e29a538',
        9,
        'POLAND',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '1d7e16b9-7d13-457a-b317-90ee288bbf13',
        9,
        'FINLAND',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '1207d025-af4d-411e-80d9-79dd52602373',
        9,
        'BAHRAIN',
        15,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9a0fc1f4-51f5-40df-ae5a-7d4bdb38d12a',
        9,
        'BELGIUM',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '8eed3da2-7f54-47b9-b3bd-0656f950b717',
        9,
        'BOLIVIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '4e070a44-13c0-4b28-a7df-828f06e7958f',
        9,
        'BOSNIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '540b7353-90e2-46de-a0ea-c7bd096f7c84',
        9,
        'INDIA',
        34,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'e6ca5eda-2ee9-4d41-8b8a-e7d6f4eea6fe',
        9,
        'MALAYSIA',
        84,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b0b4e43b-4af9-413c-b2a6-57fa34c5bdda',
        9,
        'MALTA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'd41259dd-e893-4abd-9721-af17d9abd2ac',
        9,
        'MALDIVES',
        16,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '5e2a9f44-ae2a-41de-a1f7-dc7878f1d9ab',
        9,
        'MAURITIUS',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'a63d2f35-67ba-4473-9abd-e6480f2f4653',
        9,
        'YEMEN',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '490712c7-fe35-4e15-86db-268ecb7cda03',
        9,
        'ROMANIA',
        17,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2bd10294-c342-4108-8066-5cb9d48efd7f',
        9,
        'UNITED_KINGDOM_OF_GREAT_BRITAIN',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c32677af-1d72-47d3-afbf-c7191aadacbf',
        9,
        'UNITED_ARAB_EMIRATES',
        13,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '163256a1-3540-4637-b224-287741333c3d',
        9,
        'UNITED_STATES_OF_AMERICA',
        13,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '976f11cd-8f77-4b02-b0ae-14c16f60a6e9',
        9,
        'UNITED_NATIONS',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '2e055af3-e109-4c61-aa37-c39f2ef97218',
        9,
        'CYPRUS',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '034ba9a2-c9e6-4319-b382-120d7fb39979',
        9,
        'SAUDI_ARABIA',
        82,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '04ded15a-403a-421d-bf1f-4c19f04c00e3',
        9,
        'HONG_KONG',
        7,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b0b8d2ae-6c5b-42a4-9438-ffe8f45b2be9',
        10,
        'PERMISSION',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c613de10-9901-4988-bf45-83b037a40943',
        10,
        'AUSTRALIA',
        7,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '4d77782a-3a58-4b49-8553-43f55add989a',
        10,
        'ICELAND',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'eb786066-32c3-4955-af66-039b79b95f6b',
        10,
        'QATAR',
        69,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'f45e99e6-64b2-4de9-b19f-1cc9e3103b32',
        10,
        'CAMBODIA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '77f49312-6f67-4857-94cb-c6b0e91b85d7',
        10,
        'OTHER',
        43,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '02d3e265-e401-4014-a5bb-7b6cee560524',
        10,
        'CROATIA',
        3,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c7bc0bac-6c7f-4681-8260-a36510c7b4fc',
        10,
        'GREECE',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '17f391a8-1db1-4ccb-bd52-efd4afaad55c',
        10,
        'GERMANY',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'e871e5e1-f5c1-4adf-8240-161f77af758a',
        10,
        'JAPAN',
        9,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'aa4d9322-227f-46a6-b988-1e3ba07c79da',
        10,
        'JORDAN',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '9e20476e-68fe-406b-a3b6-ab32d5a7801f',
        10,
        'DUNGLAND',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '8d3d9ece-7d2f-4aa4-ba9a-333ab45900fb',
        10,
        'SOUTH_AFRICA',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '06e8c826-03a5-41bc-a102-6afed97c659b',
        10,
        'SOUTH_KOREA',
        14,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '1a761a33-cbce-4875-83a9-a889c564504f',
        10,
        'DUBAI',
        68,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'da36de63-19ab-4e9c-ad7a-9e60dd5fe282',
        10,
        'PORTUGAL',
        9,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '6e8ae018-e35d-4424-85a4-ecea107c37e9',
        10,
        'POLAND',
        6,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '418cfd9a-8d75-4727-a25a-b95c2e19fae4',
        10,
        'BAHRAIN',
        19,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '55eb5ada-71e8-41ac-b521-ebaa9dd817d3',
        10,
        'BOSNIA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'a4c75dd5-268d-49a1-be64-e85dfff9bc31',
        10,
        'INDIA',
        12,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '671976e5-9113-4b08-87fc-d581b9a34b3d',
        10,
        'MACAU',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '544d3fce-b645-4788-a0f3-3cb66c925a68',
        10,
        'MALAYSIA',
        58,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b8242df2-d3b2-4988-af78-0c01770ec164',
        10,
        'MALTA',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '36f66d51-095f-459a-8725-eaba3a8092dd',
        10,
        'MALDIVES',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'fe3b6388-f3a2-4188-bfc1-82ae24f16248',
        10,
        'MOROCCO',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '43cb369a-a128-4098-b4f9-854ff45b3eee',
        10,
        'MAURITIUS',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'b77c2eda-9afb-4a92-a3b2-a5ebf117ed53',
        10,
        'ROMANIA',
        5,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '85e7ec58-21d5-4bbb-84f5-014ff0a0e453',
        10,
        'UNITED_KINGDOM_OF_GREAT_BRITAIN',
        6,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'e9776217-6147-4de9-a00e-e7d65098b5d6',
        10,
        'UNITED_ARAB_EMIRATES',
        13,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'bef6a3f7-6da9-4cb7-8bcd-5ddcb724597d',
        10,
        'UNITED_STATES_OF_AMERICA',
        4,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '130348c9-cadd-4ab9-8854-286b75dec402',
        10,
        'CYPRUS',
        9,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '5cab350e-cd80-442b-93ab-822bff5223f5',
        10,
        'SAUDI_ARABIA',
        53,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'f8b9c9be-8bbb-405b-be79-458fa9008ac4',
        10,
        'SOMALIA',
        2,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '87b88299-dc8f-492c-925f-23a8c9eff25d',
        10,
        'SPAIN',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        '941e0f95-9ace-44f6-bea7-5c4e390418cd',
        10,
        'HONG_KONG',
        32,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    INSERT INTO acme_ward_wise_foreign_employment_countries 
    (id, ward_number, country, population, updated_at, created_at)
    VALUES (
        'c505494d-a285-46ef-ad18-e7e962a1938f',
        10,
        'HUNGARY',
        1,
        '2025-06-30 12:34:11',
        '2025-06-30 12:34:11'
    );
    

    END IF;
END
$$;

