-- Generated SQL script
-- Date: 2025-06-30 13:06:08


-- Check if acme_ward_wise_old_age_population_and_single_women table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_old_age_population_and_single_women'
    ) THEN
        CREATE TABLE acme_ward_wise_old_age_population_and_single_women (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            male_old_age_population INTEGER NOT NULL,
            female_old_age_population INTEGER NOT NULL,
            single_women_population INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_old_age_population_and_single_women) THEN


    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '4da5e914-af36-4cb7-8436-aaa8f4c0d2e1',
        1,
        124,
        136,
        13,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '7ed9469a-6482-486e-bb39-86cfde8204f8',
        2,
        53,
        239,
        47,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        'f64ba437-107d-41f5-a8dd-f84ba642f327',
        3,
        154,
        242,
        28,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '41ff9c56-dc8a-4f1b-a005-1eadd1af68cd',
        4,
        109,
        96,
        0,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '9f6a5c03-c33a-4af4-b1c1-9919d6ed6f4f',
        5,
        223,
        255,
        133,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '3edb8ae2-524b-4060-952b-475339278ff5',
        6,
        245,
        269,
        104,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '1152eade-39c4-488a-96af-efe65d296824',
        7,
        238,
        334,
        83,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '96056d0f-abc9-499e-9d50-59d1f6135244',
        8,
        308,
        429,
        55,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '6fa4b409-bce2-4558-9dbd-6115e26dffc7',
        9,
        311,
        450,
        183,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    INSERT INTO acme_ward_wise_old_age_population_and_single_women 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '08c1049d-3604-4e03-a38d-47492591f7cb',
        10,
        194,
        230,
        78,
        '2025-06-30 13:06:08',
        '2025-06-30 13:06:08'
    );
    

    END IF;
END
$$;

