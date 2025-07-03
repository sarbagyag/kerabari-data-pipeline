-- Generated SQL script
-- Date: 2025-06-30 11:57:29


-- Check if acme_municipality_wise_mother_tongue_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wise_mother_tongue_population'
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

        CREATE TABLE acme_municipality_wise_mother_tongue_population (
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
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wise_mother_tongue_population) THEN


    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '76fc6642-0a0e-4f01-9fbf-9b28f0208f5f',
        'BAJJIKA',
        1,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '3de73252-23d5-4cc1-bcda-9a5a25356c67',
        'BANTAWA',
        18,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '5183e7c7-6e76-42ee-967c-0ce50826a55b',
        'BHOJPURI',
        4,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '058f7612-83e7-40d9-ab22-6871d11e098c',
        'BHUJEL',
        9,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '39f20cbb-97ef-40c8-90eb-5cfdfe5ab79b',
        'CHAMLING',
        9,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '5d0f5338-1a7f-4cef-81fe-056bb45685f1',
        'DANUWAR',
        12,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '71a2f5e8-b202-4817-a141-6b3e2bb8518e',
        'GURUNG',
        94,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '525476ee-93d6-4695-bc26-192f1a758532',
        'KHALING',
        3,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '351b8ddd-dc86-4f7c-9bd2-1febba9cae19',
        'KOYI',
        2,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'a8d5d143-1a17-4243-90b7-3bf73da42130',
        'KUMAL',
        10,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '272af177-3b65-4955-bd11-ef7feae38ad2',
        'LIMBU',
        5133,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'a033a2a4-4405-4b14-a76c-2161fa8848bc',
        'MAGAR',
        2493,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'f0cd8f94-595d-4547-ab27-2080b378c77b',
        'MAITHILI',
        60,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'b448376c-f6ff-4947-8fb7-dfa93be27f46',
        'MUSALMAN',
        5,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '038de76b-2820-42fd-bbec-e03c13dbbad2',
        'NEPALI',
        24015,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '43f2d0a9-d594-4200-95a9-e272feab856b',
        'NEWARI',
        653,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'cc3a088d-4f10-4d65-843b-4024ee8e01c7',
        'OTHER',
        55,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '2c2ed077-7ce3-4af1-a468-722aa8186304',
        'RAI',
        2352,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '075e2a4a-8e3e-459a-98ca-a0e843c197dd',
        'RAJBANSHI',
        18,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        'a4434fd2-6f65-47c3-8bef-99654ae4ca84',
        'SHERPA',
        11,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '080df87f-22e0-4fda-8e05-afe40679fbda',
        'SYMBOLIC_LANGUAGE',
        4,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '1fbf5dec-c346-4480-a43c-6042a176f917',
        'TAMANG',
        1061,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '0eb6667f-0e97-4236-a91d-9c1994a1210c',
        'THARU',
        38,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '4724ac86-fbf9-4a14-8d77-a96185218db3',
        'THULUNG',
        5,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '0be9a160-4ed9-4c42-849e-4e16df4e1846',
        'URAUN',
        5,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '981e68a6-da30-4399-b428-99f6f4f3e9b3',
        'URDU',
        17,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '12a01391-f3b4-4db0-818a-00f1e0acafba',
        'YAKKHA',
        67,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    INSERT INTO acme_municipality_wise_mother_tongue_population 
    (id, language_type, population, updated_at, created_at)
    VALUES (
        '4f83db6b-4c67-4ec8-886e-600cc3d0f400',
        'YAMPHU',
        28,
        '2025-06-30 11:57:29',
        '2025-06-30 11:57:29'
    );
    

    END IF;
END
$$;

