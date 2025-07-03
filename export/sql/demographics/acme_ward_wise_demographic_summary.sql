-- Generated SQL script
-- Date: 2025-06-30 12:06:01


DROP TABLE IF EXISTS public.acme_ward_wise_demographic_summary;
CREATE TABLE public.acme_ward_wise_demographic_summary (
    id                     varchar(36) PRIMARY KEY,
    ward_number            int          NOT NULL,
    ward_name              text,
    total_population       int,
    population_male        int,
    population_female      int,
    population_other       int,
    total_households       int,
    average_household_size numeric,
    sex_ratio              numeric,
    updated_at             timestamp    DEFAULT now(),
    created_at             timestamp    DEFAULT now()
);
ALTER TABLE public.acme_ward_wise_demographic_summary
    OWNER TO postgres;


    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        'ead034bc-f630-4e3c-9936-ef3225cc835e',
        1,
        'गोवरडिहा(१,२,३)',
        2136,
        1087,
        1049,
        0,
        489,
        4.368098159509202,
        103.62249761677789,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    

    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        '53928545-6a9b-45e6-b819-70fe45092a4b',
        2,
        'गोवरडिहा(४-६)',
        2253,
        1093,
        1160,
        0,
        578,
        3.897923875432526,
        94.22413793103448,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    

    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        '96533a29-d453-4701-9324-470ba1377eec',
        3,
        'गोवरडिहा(७,८,९)',
        3489,
        1693,
        1792,
        4,
        836,
        4.173444976076555,
        94.47544642857143,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    

    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        '9abf9afc-2284-4a6d-9755-fd8f5483038a',
        4,
        'गँगापरस्पुर(१,२,३,५)',
        1729,
        861,
        868,
        0,
        427,
        4.049180327868853,
        99.19354838709677,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    

    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        '2fd87084-bfcc-41f7-a6cd-d7f3b0dc69b1',
        5,
        'गँगापरस्पुर(४,६,७,८,९)',
        4193,
        2083,
        2110,
        0,
        1028,
        4.078793774319066,
        98.72037914691944,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    

    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        '08e5c343-05c4-44d9-b680-bb82273166d2',
        6,
        'गढवा(१,२,३,४,५)',
        4138,
        2005,
        2125,
        8,
        1000,
        4.138,
        94.35294117647058,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    

    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        '41bd7928-614a-4de7-8480-999f96bdff12',
        7,
        'गढवा(६,७,८,९)',
        4285,
        2022,
        2263,
        0,
        986,
        4.345841784989858,
        89.35041979673001,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    

    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        'b5e9fc50-e931-4970-a527-1cdc2185e690',
        8,
        'कोइलाबास(१ देखि ९)',
        4202,
        1979,
        2223,
        0,
        1108,
        3.792418772563177,
        89.0238416554206,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    

    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        '2208e501-6ec4-4ce1-abca-750d94049d22',
        9,
        NULL,
        5923,
        2847,
        3071,
        5,
        1480,
        4.002027027027027,
        92.70595897101921,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    

    INSERT INTO acme_ward_wise_demographic_summary (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        'c5c63679-4089-42f1-a938-ffea2e2d40bb',
        10,
        NULL,
        3834,
        1903,
        1931,
        0,
        932,
        4.113733905579399,
        98.54997410668047,
        '2025-06-30 12:06:01',
        '2025-06-30 12:06:01'
    );
    
-- End of script

