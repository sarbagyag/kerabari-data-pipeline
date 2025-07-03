-- Generated SQL script
-- Date: 2025-06-29 12:31:21


-- Check if acme_ward_wise_chronic_diseases table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_chronic_diseases'
    ) THEN
        CREATE TABLE acme_ward_wise_chronic_diseases (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            chronic_disease VARCHAR(100) NOT NULL,
            population INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_chronic_diseases) THEN


    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '3b085622-a0db-4aad-9f89-9eacf6e70ae0',
        1,
        'ARTHRITIS_JOINT_PAIN',
        134,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '6b583874-64d9-47a6-84ba-f723d4e1f285',
        1,
        'ASTHMA',
        54,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '3518f566-62fa-4269-9ee0-76a82aeda3f2',
        1,
        'BLOOD_PRESSURE_HIGH_LOW',
        271,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '7ba6c35b-c4fc-4e2a-88e4-030078b67a1d',
        1,
        'DIABETES',
        117,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'df01b74f-91df-4582-bb24-3f01bd38fe59',
        1,
        'EPILEPSY',
        5,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'eff48f7d-c6f9-4c42-8376-5f4de6a57435',
        1,
        'GASTRIC_ULCER_INTESTINE_DISEASE',
        80,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'ca2cb0eb-fed3-4774-be31-0a4490cb500b',
        1,
        'GYNECOLOGICAL_DISEASE',
        23,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'b0457c46-4589-495b-99c4-61988f9bef8c',
        1,
        'HEART_RELATED_DISEASE',
        53,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'e5a01153-606f-4a1c-8e04-41e681317900',
        1,
        'KIDNEY_RELATED',
        15,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '8e346902-998e-4307-b8ee-aac5fdb0ef3a',
        1,
        'LIVER_RELATED',
        2,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '949ce0a2-48a4-4371-ae9c-c74ec4ae0a40',
        1,
        'MIGRAINE',
        31,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '2948070b-ee1f-4bc9-aa97-0bce704459c3',
        1,
        'OTHER',
        95,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '361de94e-0020-42db-b91f-3220bc12d04a',
        1,
        'PARKINSON_ALZHEIMER',
        3,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '7af6ba2e-7554-4560-aa6f-7179e833ed65',
        1,
        'RESPIRATION_RELATED',
        3,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'dfd65a78-1eac-4575-9d13-2b3a7743a075',
        1,
        'TUMOR_CANCER',
        9,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '14aefec5-3839-41a0-8626-f9f3882e64a5',
        2,
        'ARTHRITIS_JOINT_PAIN',
        117,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'bbde4238-c6fe-4396-aa77-d850817ea324',
        2,
        'ASTHMA',
        56,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'aa80d387-1171-48e0-b91b-622f2ea03f0e',
        2,
        'BLOOD_PRESSURE_HIGH_LOW',
        291,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '68df34fe-d6e9-43f9-9a8e-892267387403',
        2,
        'DIABETES',
        114,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '917b8d2d-375f-4fe1-a0cc-eafaf4104e01',
        2,
        'EPILEPSY',
        5,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'b70e3480-fa19-48b0-9b7e-f1a78591a97d',
        2,
        'GASTRIC_ULCER_INTESTINE_DISEASE',
        99,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '91b5ad15-ff3a-4b4b-b791-933f30378a34',
        2,
        'GYNECOLOGICAL_DISEASE',
        8,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '36fdae62-e83a-43fd-b121-fe5f3add10ff',
        2,
        'HEART_RELATED_DISEASE',
        50,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'c92b388b-9450-4e55-bc25-c114849a9f7a',
        2,
        'KIDNEY_RELATED',
        9,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'c2e93730-01f3-48cf-a546-3ec94353c30a',
        2,
        'MIGRAINE',
        30,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'b4625468-7964-4245-bf14-d712e1aab562',
        2,
        'OCCUPATIONAL_DISEASE',
        3,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'c58287c3-6960-4fd7-84eb-0937d20378a1',
        2,
        'OTHER',
        104,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'f073f734-a62e-465e-a5cd-ef60a683a2fd',
        2,
        'PARKINSON_ALZHEIMER',
        4,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '13df2fa1-d35e-4a0c-a92c-59606e9ca1c8',
        2,
        'RESPIRATION_RELATED',
        5,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'eeaeaeae-382e-4b42-a2b9-0183b943fbba',
        2,
        'TUMOR_CANCER',
        16,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'ee5baef7-6658-4281-8814-db1dd5d4b5a6',
        3,
        'ARTHRITIS_JOINT_PAIN',
        140,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '09c31075-08f2-490e-8e71-cc5f0151cbb8',
        3,
        'ASTHMA',
        71,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '4f9cd10e-486e-41a9-9d58-01a79dcef7b5',
        3,
        'BLOOD_PRESSURE_HIGH_LOW',
        367,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'b100cdfc-0bbe-430b-acf1-4de5e444f6a4',
        3,
        'DIABETES',
        168,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '47d37c1c-740c-4c3b-b65f-2a67ab13633b',
        3,
        'EPILEPSY',
        4,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '5f36a5b5-f0b6-4cdb-94a4-934e0ac5ce6b',
        3,
        'GASTRIC_ULCER_INTESTINE_DISEASE',
        76,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '0a971d53-93c7-4d60-8bfe-ece05ab7a0c8',
        3,
        'GYNECOLOGICAL_DISEASE',
        19,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '02c7c10a-009d-4304-99dc-f069165c7abc',
        3,
        'HEART_RELATED_DISEASE',
        63,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'b5e6bf40-ce47-44a8-8882-8f110be7a80e',
        3,
        'KIDNEY_RELATED',
        13,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '0c889fb3-722d-4815-ac83-c92abef3a8d0',
        3,
        'LIVER_RELATED',
        3,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '2f1407f0-c52a-4a2a-9453-f066b0079707',
        3,
        'MIGRAINE',
        16,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '75e5b78f-b5ef-4818-96f6-de2173b6a212',
        3,
        'OTHER',
        133,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'ed595134-1206-4dfd-ad05-2117e688d3c2',
        3,
        'PARKINSON_ALZHEIMER',
        3,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'e97c74d9-9d86-4ae2-9ce3-49bd86eb8ca7',
        3,
        'RESPIRATION_RELATED',
        7,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'c6fd0640-5437-4b4f-b080-ffe4a99a3049',
        3,
        'TUMOR_CANCER',
        20,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'dbb4acda-7bfd-4788-91e6-1599847b71ea',
        4,
        'ARTHRITIS_JOINT_PAIN',
        177,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '98a0cb77-9318-46b6-91ee-ef7a14343f8c',
        4,
        'ASTHMA',
        62,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'e475a42d-ad68-42d8-ae6b-62b3cc49eed5',
        4,
        'BLOOD_PRESSURE_HIGH_LOW',
        333,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '6477b5c4-3ca1-4a6b-8d4c-dc11053d20ce',
        4,
        'DIABETES',
        152,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '91d056f3-f81c-4eca-afff-d259aa650863',
        4,
        'EPILEPSY',
        17,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '4b61a0da-d421-4379-964a-baabfd80a1e5',
        4,
        'GASTRIC_ULCER_INTESTINE_DISEASE',
        111,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'e8f69c6f-1279-47ee-80ab-30beffdaf9c5',
        4,
        'GYNECOLOGICAL_DISEASE',
        14,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'a97f3741-15c9-420f-aacd-857160ec46ea',
        4,
        'HEART_RELATED_DISEASE',
        50,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '7955e08b-9e16-44f2-89af-f334b5b02a78',
        4,
        'KIDNEY_RELATED',
        19,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '1fe0941e-24ab-426d-860a-3eaba5acc313',
        4,
        'LIVER_RELATED',
        6,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'cbb6572b-b46b-43b9-950b-1945329fc837',
        4,
        'MIGRAINE',
        24,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '3ae5e305-37b1-49aa-b088-f1c2fc3ae31a',
        4,
        'OCCUPATIONAL_DISEASE',
        3,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'def34745-2211-44a1-bd5a-15d950a76d7f',
        4,
        'OTHER',
        167,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '4ac53698-d202-4198-b316-563aef5128d1',
        4,
        'PARKINSON_ALZHEIMER',
        5,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '41f3694c-ff90-4612-a17a-7d8485ab318e',
        4,
        'RESPIRATION_RELATED',
        8,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'bd61f321-f100-4424-9498-f4bfc7a71c35',
        4,
        'TUMOR_CANCER',
        18,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '92f9d6b2-105a-4809-8df2-adc5a5d8bbb5',
        5,
        'ARTHRITIS_JOINT_PAIN',
        72,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '597ec40a-4cf6-49c9-8952-16b92b87f325',
        5,
        'ASTHMA',
        37,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '2b38797e-1225-4136-84bd-c9de13ed3b49',
        5,
        'BLOOD_PRESSURE_HIGH_LOW',
        94,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'dfa080b4-6acd-4fa5-83bc-867966f6a3d5',
        5,
        'DIABETES',
        47,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '6b83b3c9-b9e2-4fe7-82ae-3ea1385f66a0',
        5,
        'EPILEPSY',
        1,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '215d7303-cd4b-4408-b289-4600d3687688',
        5,
        'GASTRIC_ULCER_INTESTINE_DISEASE',
        96,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'be1ab698-ec1e-49dd-9094-bb756817c871',
        5,
        'GYNECOLOGICAL_DISEASE',
        11,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '52e558df-ae37-40c0-bf9a-d73d21d1c9de',
        5,
        'HEART_RELATED_DISEASE',
        18,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '8f3f1339-794c-40aa-b6dc-06e801425679',
        5,
        'KIDNEY_RELATED',
        2,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'fa4fb7d9-99ca-449a-9a13-d49b04c28580',
        5,
        'LIVER_RELATED',
        1,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'ecafead6-debe-4660-9e4b-8efea36e650a',
        5,
        'MIGRAINE',
        21,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '3a8d9a41-60e9-46d3-af31-412f9f08db09',
        5,
        'OCCUPATIONAL_DISEASE',
        38,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '296ad5c4-127a-44bc-b459-6ec3889f1898',
        5,
        'OTHER',
        34,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '26bc7732-7e27-40ea-9e71-467fa60c7765',
        5,
        'PARKINSON_ALZHEIMER',
        1,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '7f7211c6-7287-424f-a434-8fe49ace9dc4',
        5,
        'RESPIRATION_RELATED',
        3,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '523b2842-7742-4ce8-a9be-2e9fc29f56b8',
        5,
        'TUMOR_CANCER',
        12,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '22bc2fd9-0ca1-4a0b-8c7d-b3afda82be03',
        6,
        'ARTHRITIS_JOINT_PAIN',
        23,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '0b562224-e967-4517-8329-84dd0982db26',
        6,
        'ASTHMA',
        15,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '43ecaedd-f283-4cdf-aa84-172b3e398d1c',
        6,
        'BLOOD_PRESSURE_HIGH_LOW',
        37,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '9c88471c-5383-4a8e-b7ec-2a4c11fcd506',
        6,
        'DIABETES',
        29,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '6b1b1aa4-ab57-49a6-a3dc-34fb3181812d',
        6,
        'GASTRIC_ULCER_INTESTINE_DISEASE',
        31,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '051a4bdb-39f6-4337-af8c-2f85f44625de',
        6,
        'HEART_RELATED_DISEASE',
        22,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'f584c502-e072-4eb5-986f-6a934e411459',
        6,
        'KIDNEY_RELATED',
        1,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '7f8851a0-6569-4fc4-81dd-794e4ef9dda1',
        6,
        'MIGRAINE',
        4,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '0e7da2f9-2227-4af9-9f8e-913db3c9396f',
        6,
        'OTHER',
        28,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '5f94c49a-13a2-4606-85e2-d27fb811f653',
        6,
        'PARKINSON_ALZHEIMER',
        1,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '6c6c76fc-b181-4fc2-bf37-50481fc1e313',
        6,
        'RESPIRATION_RELATED',
        1,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '3351761d-464b-4d07-8f5d-0c52ed109dec',
        6,
        'TUMOR_CANCER',
        5,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'fba0979e-bf27-4baf-bb92-68b89382dd5b',
        7,
        'ARTHRITIS_JOINT_PAIN',
        36,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'c0366d19-bf0b-42e9-bd7d-e04de0295ae8',
        7,
        'ASTHMA',
        15,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '21e1156f-1447-43f5-81ac-90011fde939a',
        7,
        'BLOOD_PRESSURE_HIGH_LOW',
        76,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'ca7b37cf-e6c5-4a19-81c0-833df36c128c',
        7,
        'DIABETES',
        31,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'dcbf783d-02f0-4078-9780-07674e081c74',
        7,
        'EPILEPSY',
        1,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '984edd71-b07b-4244-9d31-8183af9ef34e',
        7,
        'GASTRIC_ULCER_INTESTINE_DISEASE',
        19,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '2819ed53-459e-47ef-99f2-674f8109568f',
        7,
        'GYNECOLOGICAL_DISEASE',
        2,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '521fe049-5ae6-444c-949b-a296bee20918',
        7,
        'HEART_RELATED_DISEASE',
        13,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'cdabe1c5-2855-414c-a3fb-e51802d19181',
        7,
        'KIDNEY_RELATED',
        5,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '44d1035d-2a67-4b26-aa77-20d7abfcd1e3',
        7,
        'LIVER_RELATED',
        1,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'c5600727-fec3-459e-b21e-0a01bc09ec51',
        7,
        'MIGRAINE',
        7,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '2bde025e-795d-4116-9713-c8ab11b57fec',
        7,
        'OCCUPATIONAL_DISEASE',
        4,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '7edf55b6-bb69-4298-909f-273c64ba0dc9',
        7,
        'OTHER',
        17,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'c291ec38-2cf1-43db-a272-707e9f73e5d6',
        7,
        'PARKINSON_ALZHEIMER',
        1,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '14eef936-402b-4eee-94f5-e720f756738f',
        7,
        'RESPIRATION_RELATED',
        4,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    INSERT INTO acme_ward_wise_chronic_diseases 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        'd42ad831-82e1-4c54-a641-dd03fd1c54f0',
        7,
        'TUMOR_CANCER',
        5,
        '2025-06-29 12:31:21',
        '2025-06-29 12:31:21'
    );
    

    END IF;
END
$$;

