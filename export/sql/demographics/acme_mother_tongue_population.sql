-- Generated SQL script
-- Date: 2025-06-23 19:15:58


-- Check if acme_mother_tongue_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_mother_tongue_population'
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

        CREATE TABLE acme_mother_tongue_population (
            id VARCHAR(36) PRIMARY KEY,
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
    IF NOT EXISTS (SELECT 1 FROM acme_mother_tongue_population) THEN


    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'e35c216b-0cbf-4e8b-baf3-f7186222b1d5',
        'ARABI',
        3,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'd2954e80-fa67-4f8d-9f43-03af495def1a',
        'AWADI',
        4425,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '0d811f15-8211-42f1-a874-4274b1b1ce12',
        'BAJJIKA',
        4,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '1b69b671-c635-4ae7-b8ec-82a00fbd1ff5',
        'BHOJPURI',
        10,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '39765c27-4c40-440a-8eab-22457ba5752f',
        'BOTE',
        95,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '388efe41-59b9-4b84-a99c-b6aef8919e23',
        'DOTELI',
        9,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '902c7c49-1158-4786-8517-381a62ac7e89',
        'GURUNG',
        67,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '00cda3e0-db1e-480e-aac3-fc3458842060',
        'HINDI',
        440,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '60fcbe16-e079-44be-967e-9f405b3affef',
        'KHAM',
        162,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '866517d1-9489-4c59-8d90-e657345e9627',
        'KHARIYA',
        4,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '975fac29-0dab-4d17-8f45-de252223cab6',
        'KUMAL',
        1263,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '52be522b-a79b-40b5-a275-881fec0912da',
        'MAGAR',
        1165,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'b16f091b-a340-4805-8450-509daa0bcb67',
        'MAITHILI',
        10,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'cd09785c-7449-4ea0-9dac-28b89d09cdd1',
        'MAJHI',
        21,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '24414367-718b-407e-8bde-5f6144574a9e',
        'MUSALMAN',
        116,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'e7885201-e8c8-4312-b754-e928008deae3',
        'NEPALI',
        20143,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '3fec333c-6622-4355-bc5b-1a025d9a7250',
        'NEWARI',
        8,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '286c7e0b-93bd-40d4-abcb-bf1388a2a365',
        'RAI',
        13,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '355a9218-777e-47e0-a8b9-990482656a01',
        'SUNUWAR',
        66,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '50831a52-4229-43f5-9ea3-82b2d90e1a3a',
        'SYMBOLIC_LANGUAGE',
        4,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'd0b834cc-5b75-4f9d-835a-f50f0ffa1ad1',
        'TAMANG',
        25,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '40113db9-24e8-405b-a51d-97bd5d308a87',
        'THARU',
        19819,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    INSERT INTO acme_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '74b5caa0-b79c-448f-89b4-e65e6c44359b',
        'URDU',
        57,
        '2025-06-23 19:15:58',
        '2025-06-23 19:15:58'
    );
    

    END IF;
END
$$;

