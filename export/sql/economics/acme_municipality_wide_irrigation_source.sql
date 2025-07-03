-- Generated SQL script
-- Date: 2025-06-30 12:29:17


-- Check if acme_municipality_wide_irrigation_source table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_municipality_wide_irrigation_source'
    ) THEN
        CREATE TABLE acme_municipality_wide_irrigation_source (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            irrigation_source VARCHAR(100) NOT NULL,
            coverage_in_hectares DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (coverage_in_hectares >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW(),
            UNIQUE(irrigation_source)
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_municipality_wide_irrigation_source) THEN


    INSERT INTO acme_municipality_wide_irrigation_source 
    (id, irrigation_source, coverage_in_hectares, updated_at, created_at)
    VALUES (
        'af541880-f4d4-4ab8-a6f0-7e5576bcd34b',
        'अन्य',
        570813.89,
        '2025-06-30 12:29:17',
        '2025-06-30 12:29:17'
    );
    

    INSERT INTO acme_municipality_wide_irrigation_source 
    (id, irrigation_source, coverage_in_hectares, updated_at, created_at)
    VALUES (
        '19dabe08-2d7e-4c43-bea2-036610d75ba2',
        'पम्पिङ सेट/ मोटर',
        313808.76,
        '2025-06-30 12:29:17',
        '2025-06-30 12:29:17'
    );
    

    INSERT INTO acme_municipality_wide_irrigation_source 
    (id, irrigation_source, coverage_in_hectares, updated_at, created_at)
    VALUES (
        '0f7164ed-883c-46b8-96a2-67b06d7ba3a7',
        'पोखरी/रिजरभ्वायर',
        27259.82,
        '2025-06-30 12:29:17',
        '2025-06-30 12:29:17'
    );
    

    INSERT INTO acme_municipality_wide_irrigation_source 
    (id, irrigation_source, coverage_in_hectares, updated_at, created_at)
    VALUES (
        'f57af9c9-882f-41d0-92e2-346f0065b3a5',
        'भूमिगत सिँचाइ(स्यालो ट्युबवेल, डिपट्युबवेल)',
        60276.17,
        '2025-06-30 12:29:17',
        '2025-06-30 12:29:17'
    );
    

    INSERT INTO acme_municipality_wide_irrigation_source 
    (id, irrigation_source, coverage_in_hectares, updated_at, created_at)
    VALUES (
        'b5ae03cf-bcf0-49e1-8f39-6d0bbb7c0bd7',
        'लिफ्ट सिँचाइ',
        1693.15,
        '2025-06-30 12:29:17',
        '2025-06-30 12:29:17'
    );
    

    INSERT INTO acme_municipality_wide_irrigation_source 
    (id, irrigation_source, coverage_in_hectares, updated_at, created_at)
    VALUES (
        '725d7051-b178-41b2-9280-4ae16639ff17',
        'सिँचाइ कुलो',
        8793266.05,
        '2025-06-30 12:29:17',
        '2025-06-30 12:29:17'
    );
    

    END IF;
END
$$;

