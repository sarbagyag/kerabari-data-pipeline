-- Generated SQL script
-- Date: 2025-06-30 12:35:50


-- Check if acme_municipality_wise_foreign_employment_countries table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wise_foreign_employment_countries'
    ) THEN
        -- First create the enum type if it doesn't exist
        IF NOT EXISTS (
            SELECT 1 FROM pg_type WHERE typname = 'country_enum'
        ) THEN
            CREATE TYPE country_enum AS ENUM (
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
                'NAMIBIA', 'OTHER',FRANCE, KUWAIT
            );
        END IF;

        -- Create the table
        CREATE TABLE acme_municipality_wise_foreign_employment_countries (
            id          varchar(36)   not null primary key,
            country     country_enum  not null,
            population  integer       not null,
            created_at  timestamp     default now(),
            updated_at  timestamp     default now()
        );
        
        ALTER TABLE acme_municipality_wise_foreign_employment_countries OWNER TO postgres;
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wise_foreign_employment_countries) THEN


    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'f9ef8995-96d8-41ca-a00f-72576569b4b7',
        'ALBANIA',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '4ff66781-0737-41a8-bc2c-54be40bf4c27',
        'ARMENIA',
        3,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '0bcf1f63-c2a4-4e27-9e30-17d3a3238ed7',
        'AUSTRALIA',
        15,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'd4526ff5-d3a6-4c53-bcee-580118fc66e5',
        'AZERBAIJAN',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'fb3b5836-ab63-4118-9862-e6b8d6f96d38',
        'BAHRAIN',
        83,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'dd89f91c-acd0-4bd9-b203-1264e54daf1e',
        'BELGIUM',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '41013c0e-17c4-40d7-895e-9104f59e90c8',
        'BITE',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '3ee348be-618d-463a-86ee-29831d3d6357',
        'BOLIVIA',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '5d2b67ea-221f-412a-a581-0420ea2e2bb0',
        'BOSNIA',
        3,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '63548942-b82c-489f-99a7-c0db272718f5',
        'BRUNEI',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '7d84e014-2446-41cd-bfae-e24ff9b3e820',
        'BURUNDI',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'eff419c3-4fe8-4cb9-9255-e9efead84b8f',
        'CAMBODIA',
        7,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '162c9009-a359-4b98-8dbb-85bc06ada0f6',
        'CANADA',
        16,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '9fe4e64c-c7f3-4f0f-9e9d-2b8a1b436ee3',
        'CHILE',
        3,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '6e852019-51d3-4f98-b958-f8c3ed0575c3',
        'COLOMBIA',
        3,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'f127ac31-a76b-49c0-9112-bf772db028c9',
        'CROATIA',
        37,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '619f2623-4b16-41f8-baba-8363c7900963',
        'CYPRUS',
        29,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '9bf05bca-b160-46f9-ad6b-57cb1976ff82',
        'DENMARK',
        3,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '918eb784-5a5a-4ea6-91e3-72552d792fb8',
        'DUBAI',
        537,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '98b00438-4dd8-4b3f-b63a-1eac1daacec1',
        'DUNGLAND',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '85556502-4460-490a-8297-a54cd52cc1db',
        'FINLAND',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '0ce9ad4a-b836-49fe-9262-a4ad56f377a9',
        'GERMANY',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '0a231dcb-5002-491d-8a89-a2591cf0452d',
        'GREECE',
        12,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'fe2a1c8f-9626-4292-9417-f8b17d134771',
        'HONG_KONG',
        73,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'c29de5d0-726f-4855-8e69-54a0f8bd92d8',
        'HUNGARY',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '6ccd178a-62a0-4673-a2ec-dd7bba88d37c',
        'ICELAND',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '4e94d3b8-aea4-4a00-acf7-04708fcd77e6',
        'INDIA',
        121,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '87d13bac-5e0c-4b2e-a8b9-c203eafb2956',
        'IRAQ',
        5,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '9afa4820-b76f-4308-a4ce-9033701e7c80',
        'JAPAN',
        77,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '070877f7-016f-4ac8-86b5-9de74ac8458c',
        'JORDAN',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '6ee9438b-086f-4b58-87c5-255a4934421f',
        'KATHMANDU',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '296603b0-9127-4881-9837-a4103321ef4d',
        'KUWAIT',
        162,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'a56a4986-d329-444b-867c-43581c8a7694',
        'LIBYA',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '1451af2a-5439-48bd-9bd3-d120717836c9',
        'MACAU',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '939c58a2-2965-46c2-9955-b770ba19385a',
        'MALAYSIA',
        418,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '03e1d817-3b57-4f9c-9272-30b419d72809',
        'MALDIVES',
        37,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'bdfecfb8-7892-42ed-a9df-b567964e98c9',
        'MALTA',
        8,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'c89c6994-bbfb-4924-953b-da27173d99b0',
        'MAURITIUS',
        19,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'eb1786c7-45a5-4527-b286-edf33b9c7aad',
        'MONGOLIA',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '36e9fee6-0620-47a1-8a04-d4d81b1020b4',
        'MOROCCO',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '7608190a-cab0-49ec-abcc-66fb1602b393',
        'NEW_ZEALAND',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '7c180a68-1197-42c4-b390-4f8b0a8120d6',
        'NIGER',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'd07718ba-7add-4c89-a356-3309911b04e5',
        'NIGERIA',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'cf7cb13a-d1b1-4218-a3a3-49c0474c0b19',
        'NORTH_KOREA',
        7,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '5d1ec688-398c-4b6f-b7e9-7ebdbc610ba7',
        'NORWAY',
        4,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'f540a4fa-9081-4713-a0a6-39eea2e911ea',
        'PERMISSION',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'bb64c00e-bdd3-4e87-a118-86397b56dc1d',
        'POLAND',
        20,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'c5d8f09b-1ea2-419d-aea2-ce5c4c33a129',
        'PORTUGAL',
        38,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '612a80cc-7c2c-4fcc-a795-fbbfa0558c40',
        'QATAR',
        418,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'd4223ad0-ef48-47bb-9a84-aebcfa0bb37c',
        'ROMANIA',
        53,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '4759bb71-2902-4830-b6d1-3008a1ef6ad8',
        'RUSSIA',
        4,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '1a759388-e079-4270-8e0d-434e82998263',
        'SAN_MARINO',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'cf49ce74-c3a0-417b-9e1f-743d447012f1',
        'SAUDI_ARABIA',
        410,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '53270181-3786-45e0-97c9-8e326d55dd45',
        'SINGAPORE',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'b0859a30-2c17-4435-a25c-c720069a690b',
        'SOMALIA',
        4,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '1eb22d2f-022a-4fc2-8d8e-93b170d0057d',
        'SOUTH_AFRICA',
        11,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '54d6bd22-8501-4990-8061-0b484eef7bb8',
        'SOUTH_KOREA',
        46,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'd10d4ae5-4cf8-4f94-a84b-f31610d95453',
        'SPAIN',
        3,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '1a7e0c0d-6457-4a89-9019-ff4dc920e99f',
        'SWEDEN',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '52f4f755-faf2-495a-8730-18b702d3ed1c',
        'SYRIA',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'd8b9f7c5-ff80-44a4-b297-f7cc506c431d',
        'THE_GARDENER',
        1,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'b5c02265-fb3a-404e-8ea2-2c6ad49d21fd',
        'THE_NETHERLANDS',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'b148bf32-8659-4b9a-8bea-5dfe957506f2',
        'UNITED_ARAB_EMIRATES',
        32,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '95f0ac4a-0e30-4bb3-91fb-06f358c20932',
        'UNITED_KINGDOM_OF_GREAT_BRITAIN',
        16,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'd9e480d7-4393-4481-a119-536b19a65679',
        'UNITED_NATIONS',
        2,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        'c5ef3cd7-7d4c-4c3d-b4be-e7e374797148',
        'UNITED_STATES_OF_AMERICA',
        26,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    INSERT INTO acme_municipality_wise_foreign_employment_countries 
    (id, country, population, created_at, updated_at)
    VALUES (
        '999b6fa1-b2d2-4f4b-b797-1a3d56fcdcf1',
        'YEMEN',
        7,
        '2025-06-30 12:35:50',
        '2025-06-30 12:35:50'
    );
    

    END IF;
END
$$;

