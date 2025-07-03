-- Generated SQL script
-- Date: 2025-06-30 11:38:50


-- Check if acme_demographic_summary table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_demographic_summary'
    ) THEN
        CREATE TABLE acme_demographic_summary (
            id VARCHAR(36) PRIMARY KEY DEFAULT 'singleton',
            total_population INTEGER,
            population_male INTEGER,
            population_female INTEGER,
            population_other INTEGER,
            population_absentee_total INTEGER,
            population_male_absentee INTEGER,
            population_female_absentee INTEGER,
            population_other_absentee INTEGER,
            sex_ratio DECIMAL,
            total_households INTEGER,
            average_household_size DECIMAL,
            population_density DECIMAL,
            population_0_to_14 INTEGER,
            population_15_to_59 INTEGER,
            population_60_and_above INTEGER,
            growth_rate DECIMAL,
            literacy_rate_above_15 DECIMAL,
            literacy_rate_15_to_24 DECIMAL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Check if data already exists before inserting
DO $$
BEGIN
    -- Only insert if the singleton record doesn't exist
    IF NOT EXISTS (SELECT 1 FROM acme_demographic_summary WHERE id = 'singleton') THEN


    INSERT INTO acme_demographic_summary (
        id,
        total_population,
        population_male,
        population_female,
        population_other,
        population_absentee_total,
        population_male_absentee,
        population_female_absentee,
        population_other_absentee,
        sex_ratio,
        total_households,
        average_household_size,
        population_density,
        population_0_to_14,
        population_15_to_59,
        population_60_and_above,
        growth_rate,
        literacy_rate_above_15,
        literacy_rate_15_to_24,
        updated_at,
        created_at
    ) VALUES (
        'singleton',
        36182,
        17573,
        18592,
        17,
        0,
        0,
        0,
        0,
        94.52,
        8864,
        4.08,
        636.91,
        0,
        0,
        0,
        2.74,
        0,
        0,
        '2025-06-30 11:38:50',
        '2025-06-30 11:38:50'
    );
    

        RAISE NOTICE 'Demographic summary data inserted successfully';
    ELSE
        RAISE NOTICE 'Demographic summary data already exists, skipping insertion';
    END IF;
END
$$;

