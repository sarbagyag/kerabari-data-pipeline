-- Generated SQL script
-- Date: 2025-06-30 12:03:01


-- Check if acme_ward_wise_death_cause table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_death_cause'
    ) THEN
        CREATE TABLE acme_ward_wise_death_cause (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            death_cause VARCHAR(200) NOT NULL,
            population INTEGER NOT NULL DEFAULT 0,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_death_cause) THEN


    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'f0bf4e3c-50b5-445c-a17e-7d6e4cb37b46',
        1,
        'CANCER',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'e2cbed13-d034-4091-a7bb-74c8c5832bff',
        1,
        'NOT_STATED',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'c962c114-87c4-48e3-8ea6-a21a9296572e',
        1,
        'OTHER_ACCIDENTS',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '758f21f5-8534-4190-8705-571575199611',
        1,
        'PNEUMONIA',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'c133b079-60fb-4881-84fa-5310ed5250f7',
        2,
        'LIVER_RELATED_DISEASES',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '43190bc2-bd08-4fce-a235-a478fccd617f',
        3,
        'ASTHMA',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '1dc587d4-9d3b-4edd-8514-571c1e059b44',
        3,
        'BLOOD_PRESSURE_HIGH_AND_LOW_BLOOD_PRESSURE',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '758c31b7-d03f-442a-a1dc-9f1a263ffaf2',
        3,
        'CANCER',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'e4e3fabf-f01c-4985-ba4d-5fe7265f1810',
        3,
        'DEATH_BY_OLD_AGE',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'cf479a31-999e-4ae4-a0bd-615894a85a76',
        3,
        'DIABETES',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '274b901a-3ecb-471f-a490-a3d6bfcbb35a',
        3,
        'HEPATITIS',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '61a59dff-02fb-4100-ab28-950547cf10e3',
        3,
        'LIVER_RELATED_DISEASES',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '58d1d264-3645-40c5-b8f1-64cc48cab97c',
        3,
        'NOT_STATED',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'dde8688b-122a-4983-aab9-003798f8df6d',
        3,
        'SUICIDE',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '2ba62782-5250-4f37-b166-97ca8beb42de',
        3,
        'TRAFFIC_ACCIDENT',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'f1c2e54f-d558-4ad4-ae3d-b506d8032ff1',
        4,
        'ASTHMA',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'a4237067-8fd3-45e1-845a-46e509f871d4',
        4,
        'CANCER',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'bc4d5ec1-5ae6-4835-bdf1-e12a1684e5cf',
        4,
        'TUBERCULOSIS',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'c8b37422-21d4-4900-8e21-17ce14020800',
        5,
        'BLOOD_PRESSURE_HIGH_AND_LOW_BLOOD_PRESSURE',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '8ed118f7-2e10-403a-95da-a089eff4ca3b',
        5,
        'CANCER',
        3,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'f9a9e2ae-d7f9-4b67-8d9e-4999cff14b08',
        5,
        'DEATH_BY_OLD_AGE',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '9c081d1a-3ef6-4ef5-88f6-d0674de695ee',
        5,
        'DIABETES',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '6e395183-40c3-4e99-96a7-4b3132379e55',
        5,
        'HEART_RELATED_DISEASES',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '82b075e2-41ec-499f-b676-789816d2cf87',
        5,
        'JAUNDICE_HEPATITIS',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'fe3e2b0f-fdcf-4002-9ec7-3833ea3bde04',
        5,
        'NATURAL_DISASTER',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'a9082309-24ee-4392-bbb4-9e64c9594849',
        5,
        'NOT_STATED',
        3,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'f432eeec-ee05-4467-9913-032e3d347265',
        5,
        'SUICIDE',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'e4d97604-104d-424d-8a0a-a60c4abc4a6a',
        6,
        'BLOOD_PRESSURE_HIGH_AND_LOW_BLOOD_PRESSURE',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'cc77950e-432e-400b-a0e1-1ad44cc44581',
        6,
        'DEATH_BY_OLD_AGE',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '9c39f443-6791-4c8c-8f51-b4bdec5bf7a3',
        6,
        'HAIJA',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '64438045-cc0a-4576-9084-f7cc1a3cafa0',
        6,
        'JAUNDICE_HEPATITIS',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'd85088a6-7798-462b-ac26-38b3688283bc',
        6,
        'KIDNEY_RELATED_DISEASES',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '2372f97f-05a2-4a0a-a960-1a081174a883',
        6,
        'MALARIA',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '6066b36e-1cff-4b13-8d52-2c0a527a0193',
        6,
        'NOT_STATED',
        4,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'eea4db68-7c45-43fb-b483-234d2428a7b9',
        6,
        'OTHER_ACCIDENTS',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '01562b78-8e35-452e-924e-2a351571e5aa',
        6,
        'PNEUMONIA',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'd19a71db-fc14-4ac8-bd19-3b164e250dde',
        7,
        'BLOOD_PRESSURE_HIGH_AND_LOW_BLOOD_PRESSURE',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '116e10b3-b0fd-4852-9497-aacf1269b14f',
        7,
        'CANCER',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '0d39229f-1638-44dd-aaca-98b9354cde10',
        7,
        'GASTRIC_ULCER_INTESTINAL_DISEASE',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'de3eef95-94ee-44da-b4a7-5d34125e23a3',
        7,
        'HEART_RELATED_DISEASES',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '55a6fc0b-f022-4dd5-a2bf-efe634078c8c',
        7,
        'NOT_STATED',
        6,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '5d698a4c-2039-45b5-892e-7b8617472f77',
        7,
        'PNEUMONIA',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '6b8a2053-da20-4fb7-af52-b718ada36545',
        8,
        'DEATH_BY_OLD_AGE',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'fb3607f1-e5cf-400c-932e-451900fbeefe',
        8,
        'NOT_STATED',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '3033331e-c85f-40eb-a4cb-37265ebc79c2',
        9,
        'BLOOD_PRESSURE_HIGH_AND_LOW_BLOOD_PRESSURE',
        4,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'edee8ec0-77bd-4956-95aa-cf5c69cd9661',
        9,
        'CANCER',
        8,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '8dbeac6b-40b9-4528-9d58-b3bb62447f7f',
        9,
        'DEATH_BY_OLD_AGE',
        16,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '298a68ba-dddc-42f1-b3e6-8543a815236d',
        9,
        'GASTRIC_ULCER_INTESTINAL_DISEASE',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '071e9f94-d91c-45e0-a48b-ab2d8ced176d',
        9,
        'HEART_RELATED_DISEASES',
        3,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '2ffdbb30-1ed8-4fdb-b178-8a6c35f476a7',
        9,
        'KIDNEY_RELATED_DISEASES',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '19f0da58-3c91-4490-828c-b11f7beb56d8',
        9,
        'NOT_STATED',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '1bac9f7a-93a0-4320-b8b0-18c13ffc6a07',
        9,
        'SUICIDE',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'c7b80b2f-20bc-4cc6-9545-537d01bafe0b',
        10,
        'BLOOD_PRESSURE_HIGH_AND_LOW_BLOOD_PRESSURE',
        3,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '2f1f9277-4cf9-4202-88c1-58c6a7a565dc',
        10,
        'DEATH_BY_OLD_AGE',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'ea6a368e-9da6-485d-a0b0-e18686d5b5ac',
        10,
        'HEART_RELATED_DISEASES',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '760152af-5294-4664-aa53-878709ebba65',
        10,
        'JAUNDICE_HEPATITIS',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '52a6af2f-b0d3-4940-aab8-cfa3271053cd',
        10,
        'KALA_AZAR',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '50c780b2-6684-4046-bc54-cfef61eaf1ad',
        10,
        'KIDNEY_RELATED_DISEASES',
        1,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        'bb1b68db-13ec-4ac5-a54b-c2cd78b33057',
        10,
        'LIVER_RELATED_DISEASES',
        3,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '9a89ef41-1824-4638-bc67-cffa4586914a',
        10,
        'NOT_STATED',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '9fa669ed-8135-4374-9800-b42acbcbba20',
        10,
        'OTHER_ACCIDENTS',
        2,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    INSERT INTO acme_ward_wise_death_cause 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '1e1482f8-8b10-46d4-a760-4d0b21e81035',
        10,
        'PNEUMONIA',
        3,
        '2025-06-30 12:03:01',
        '2025-06-30 12:03:01'
    );
    

    END IF;
END
$$;

