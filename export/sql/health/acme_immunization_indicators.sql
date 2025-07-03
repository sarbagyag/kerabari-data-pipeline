-- Generated SQL script
-- Date: 2025-06-29 12:31:58


-- Check if acme_immunization_indicators table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_immunization_indicators'
    ) THEN
        CREATE TABLE acme_immunization_indicators (
            id VARCHAR(36) PRIMARY KEY,
            fiscal_year VARCHAR(20) NOT NULL,
            indicator VARCHAR(100) NOT NULL,
            value DOUBLE PRECISION,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_immunization_indicators) THEN


    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '4f22dea6-8475-4292-a6e6-b8d2e0ff0f7a',
        'FY_2079_2080',
        'BCG_COVERAGE',
        88.9,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '1550a95d-33c2-42f7-88e6-ca276e6bda05',
        'FY_2080_2081',
        'BCG_COVERAGE',
        98.6,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '3962ce0f-8b56-4e1e-8332-6dfddfaae64c',
        'FY_2081_2082',
        'BCG_COVERAGE',
        72.27,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '58c3e610-919a-4cb5-abb3-9dfee92b91ec',
        'FY_2079_2080',
        'DPT_HEPB_HIB1_COVERAGE',
        90.7,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        'a8f1a0eb-3932-479b-882c-79dd2baf9b5d',
        'FY_2080_2081',
        'DPT_HEPB_HIB1_COVERAGE',
        102.1,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        'e44deaf6-3817-49a1-9f59-7d364c62e17c',
        'FY_2081_2082',
        'DPT_HEPB_HIB1_COVERAGE',
        61.14,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '400bd224-87ed-4e4f-ae78-ac3434b046a7',
        'FY_2079_2080',
        'ROTA2_COVERAGE',
        88.9,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        'ac68f85d-4482-418a-b095-e0042807e6de',
        'FY_2080_2081',
        'ROTA2_COVERAGE',
        100.3,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        'cd057f8f-7a66-40f1-bcbc-401dc8dcd914',
        'FY_2081_2082',
        'ROTA2_COVERAGE',
        59.66,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '4c2fc71e-fea9-499a-8f19-8356291e5509',
        'FY_2079_2080',
        'FIPV2_COVERAGE',
        65.7,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '83b6e6bc-3cc5-4629-9ab4-e3f8cb7c3844',
        'FY_2080_2081',
        'FIPV2_COVERAGE',
        103.8,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '2d5a282e-672f-4afd-a46a-7b6892aef3bd',
        'FY_2081_2082',
        'FIPV2_COVERAGE',
        60.7,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '3edb2f85-8672-41f1-8f8b-519ba66a6c00',
        'FY_2079_2080',
        'PCV3_COVERAGE',
        77.6,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '6a41d838-90cd-47dc-815f-c4fe23eb308f',
        'FY_2080_2081',
        'PCV3_COVERAGE',
        103.3,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '0bdc83fc-dd2f-418d-854c-007e328f6fe5',
        'FY_2081_2082',
        'PCV3_COVERAGE',
        60.7,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        'b6b09d58-c644-40b2-a54b-32f25003d76f',
        'FY_2079_2080',
        'MEASLES_RUBELLA2_COVERAGE',
        90.2,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '056e9660-33b5-4bfa-8d11-7ed75927fd37',
        'FY_2080_2081',
        'MEASLES_RUBELLA2_COVERAGE',
        103.5,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        'e377c31f-eb1a-4bec-9d74-a5f243fea9e0',
        'FY_2081_2082',
        'MEASLES_RUBELLA2_COVERAGE',
        45.32,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '404dcff6-dd04-49a7-96c2-18274cb62681',
        'FY_2079_2080',
        'JE_COVERAGE',
        87.7,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        'b8f549f7-fea5-4faa-9140-66836b159943',
        'FY_2080_2081',
        'JE_COVERAGE',
        105.0,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '13e0b638-a66e-4c18-a28b-87b02c281468',
        'FY_2081_2082',
        'JE_COVERAGE',
        40.3,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '4353ad30-d0c7-473a-b102-0acb787684b9',
        'FY_2079_2080',
        'TD2_TD2PLUS_COMPLETED_PREGNANT_WOMEN',
        69.2,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '66c2f36c-ee6b-4b7b-a22f-0327bc81d0ed',
        'FY_2080_2081',
        'TD2_TD2PLUS_COMPLETED_PREGNANT_WOMEN',
        92.6,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    INSERT INTO acme_immunization_indicators 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        'e65f86d9-2910-47cc-b149-23f394f7b136',
        'FY_2081_2082',
        'TD2_TD2PLUS_COMPLETED_PREGNANT_WOMEN',
        54.42,
        '2025-06-29 12:31:58',
        '2025-06-29 12:31:58'
    );
    

    END IF;
END
$$;

