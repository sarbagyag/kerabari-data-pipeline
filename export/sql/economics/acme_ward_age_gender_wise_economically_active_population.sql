-- Generated SQL script
-- Date: 2025-06-30 12:17:04


-- Check if acme_ward_age_gender_wise_economically_active_population table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_age_gender_wise_economically_active_population'
    ) THEN
        CREATE TABLE acme_ward_age_gender_wise_economically_active_population (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            age_group VARCHAR(100) NOT NULL,
            gender VARCHAR(100) NOT NULL,
            population INTEGER NOT NULL CHECK (population >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_age_gender_wise_economically_active_population) THEN


    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'bb395e7d-a593-469e-9098-e6cc07d28cc1',
        1,
        'AGE_0_TO_14',
        'FEMALE',
        229,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2e802f11-eb14-462c-9e52-7dcb30d21332',
        1,
        'AGE_0_TO_14',
        'MALE',
        241,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd6befb8e-39e6-4bfa-ac8b-677e62c0ccb2',
        1,
        'AGE_15_TO_59',
        'FEMALE',
        684,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3b1f01da-acc2-4779-b7ea-3627a9f48c03',
        1,
        'AGE_15_TO_59',
        'MALE',
        722,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'dbc9ddc9-588c-4acc-b7dd-7caa0d8b5fe7',
        1,
        'AGE_60_PLUS',
        'FEMALE',
        136,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7af5c89d-3da3-4e58-b140-4fce0e8a68e4',
        1,
        'AGE_60_PLUS',
        'MALE',
        124,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a624eeba-1c0d-425a-ac73-3d64bacd6636',
        2,
        'AGE_0_TO_14',
        'FEMALE',
        105,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '53bbb850-4e61-4d60-85c8-3c29a7fcac20',
        2,
        'AGE_0_TO_14',
        'MALE',
        335,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1fe020ca-08ef-4b91-a776-9e0d28987428',
        2,
        'AGE_15_TO_59',
        'FEMALE',
        816,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '910db96c-2b3f-40e7-ac2f-b88808a3edd7',
        2,
        'AGE_15_TO_59',
        'MALE',
        705,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4cd74ae9-11c6-417d-8965-9a3d91db2f87',
        2,
        'AGE_60_PLUS',
        'FEMALE',
        239,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a052ef51-0366-4877-9c89-97ca0f8b1a71',
        2,
        'AGE_60_PLUS',
        'MALE',
        53,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1fb74fdc-06b0-47ff-82bb-35561591328c',
        3,
        'AGE_0_TO_14',
        'FEMALE',
        337,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '0a94eb03-1142-4458-93f0-37931c27cceb',
        3,
        'AGE_0_TO_14',
        'MALE',
        415,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '397a51b8-0244-4524-8888-7b7dcc1b44e8',
        3,
        'AGE_0_TO_14',
        'OTHER',
        4,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'f4d545ba-a1eb-4416-8f63-4d4735aea50f',
        3,
        'AGE_15_TO_59',
        'FEMALE',
        1213,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2ecce4fd-dbff-4205-a953-a6c2a1b5ab6e',
        3,
        'AGE_15_TO_59',
        'MALE',
        1124,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '71db9719-b53a-492d-abf7-a0554f62b2d3',
        3,
        'AGE_60_PLUS',
        'FEMALE',
        242,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fa1528aa-2084-4a4b-ba6c-335047a0c21c',
        3,
        'AGE_60_PLUS',
        'MALE',
        154,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '728743d6-2213-4fc0-8906-4c4205f18396',
        4,
        'AGE_0_TO_14',
        'FEMALE',
        209,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6b2f9d31-ecca-42bc-8790-a6cf4179ca13',
        4,
        'AGE_0_TO_14',
        'MALE',
        193,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '9990c234-1f77-4a54-9f3b-2170b5ef2b05',
        4,
        'AGE_15_TO_59',
        'FEMALE',
        563,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '3d7fd1a6-0528-4bf5-825d-bb82b8acee1a',
        4,
        'AGE_15_TO_59',
        'MALE',
        559,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2851d006-276c-46f0-b436-c1e4aa349390',
        4,
        'AGE_60_PLUS',
        'FEMALE',
        96,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2100bab5-9864-4253-b118-bf6b8aff82be',
        4,
        'AGE_60_PLUS',
        'MALE',
        109,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ae9d3e1d-f263-47d6-ac90-b141379c50b0',
        5,
        'AGE_0_TO_14',
        'FEMALE',
        394,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '988823be-a5e0-41b2-9523-4b896580e9ee',
        5,
        'AGE_0_TO_14',
        'MALE',
        409,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6f6d2532-f87e-49f0-9365-27e68dac6f3b',
        5,
        'AGE_15_TO_59',
        'FEMALE',
        1461,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'af19204b-fedc-4799-abfa-7bf2b8fe82f2',
        5,
        'AGE_15_TO_59',
        'MALE',
        1451,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'b9942849-1f36-464a-8bc9-f5e6955a8832',
        5,
        'AGE_60_PLUS',
        'FEMALE',
        255,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a54fd0e7-91da-46ab-afef-7a352c33776b',
        5,
        'AGE_60_PLUS',
        'MALE',
        223,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a1dee6f9-8114-4602-a7ea-463d023a50be',
        6,
        'AGE_0_TO_14',
        'FEMALE',
        455,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'd8888e62-4112-40f2-b61a-9b96ea46d3d9',
        6,
        'AGE_0_TO_14',
        'MALE',
        413,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '88f482d6-4670-466d-b29c-49489ca0c4f3',
        6,
        'AGE_0_TO_14',
        'OTHER',
        8,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '6db1d8fe-b2e1-4fa5-a54c-8d4bc56e3643',
        6,
        'AGE_15_TO_59',
        'FEMALE',
        1401,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ea2bf844-163b-4f46-af05-2adaf4e93d0f',
        6,
        'AGE_15_TO_59',
        'MALE',
        1347,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'ba75ca65-2929-4fcd-9ede-dbbbdc910ac5',
        6,
        'AGE_60_PLUS',
        'FEMALE',
        269,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2a4aef54-5e7d-49cd-815c-26d69f8485a7',
        6,
        'AGE_60_PLUS',
        'MALE',
        245,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8da1f7ba-49ae-4ed6-8924-3167ae383156',
        7,
        'AGE_0_TO_14',
        'FEMALE',
        417,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2cabe86d-4b1a-4faf-9103-c1934e4d1d19',
        7,
        'AGE_0_TO_14',
        'MALE',
        439,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '540a12f8-c8ec-4691-b0d3-88a6f707925c',
        7,
        'AGE_15_TO_59',
        'FEMALE',
        1512,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4bf9a320-f371-4442-b242-3ea904e2da98',
        7,
        'AGE_15_TO_59',
        'MALE',
        1345,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a4f7baa8-150a-4ba5-89ce-ef1cec8ce720',
        7,
        'AGE_60_PLUS',
        'FEMALE',
        334,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '14ae8e6c-4f3e-426c-92bd-6c41622e235e',
        7,
        'AGE_60_PLUS',
        'MALE',
        238,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '489f700a-a73b-423c-a0e4-f988e5b58053',
        8,
        'AGE_0_TO_14',
        'FEMALE',
        351,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '821b4a17-a5ed-4d48-a013-4d807ad4cb1b',
        8,
        'AGE_0_TO_14',
        'MALE',
        392,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '2bf4bf59-0cfd-4c66-abb1-470dbe31f4d1',
        8,
        'AGE_15_TO_59',
        'FEMALE',
        1443,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '287a17f7-be27-435a-9030-044c2e96a31e',
        8,
        'AGE_15_TO_59',
        'MALE',
        1279,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '43052b07-78c9-4f28-97c4-7c2abb1775c1',
        8,
        'AGE_60_PLUS',
        'FEMALE',
        429,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4accc83e-8314-4171-9c16-f13b384865de',
        8,
        'AGE_60_PLUS',
        'MALE',
        308,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '55934bf1-3b81-47c5-bd28-98ef0618687a',
        9,
        'AGE_0_TO_14',
        'FEMALE',
        561,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7f935d0b-8079-4ae1-91e0-65a90be1d13c',
        9,
        'AGE_0_TO_14',
        'MALE',
        618,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '548a3457-1c1c-4717-964c-3e2075f1dc48',
        9,
        'AGE_0_TO_14',
        'OTHER',
        4,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '46455679-5cc0-4909-a091-3859c8bf6779',
        9,
        'AGE_15_TO_59',
        'FEMALE',
        2060,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '35548a57-6adf-4668-90f6-4b4d78702b6d',
        9,
        'AGE_15_TO_59',
        'MALE',
        1918,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '7d9120ff-5be7-4aae-a379-a8cd460d17a6',
        9,
        'AGE_15_TO_59',
        'OTHER',
        1,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '970eae8b-53d3-4d1c-b88b-47971464b074',
        9,
        'AGE_60_PLUS',
        'FEMALE',
        450,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '1b89c55a-0931-49af-9325-319f194cc355',
        9,
        'AGE_60_PLUS',
        'MALE',
        311,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'fe63ec32-013d-42ec-a443-ed9dd4858737',
        10,
        'AGE_0_TO_14',
        'FEMALE',
        351,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '8b49bdfe-fae6-4ce3-b3ce-ff82ce11bd5c',
        10,
        'AGE_0_TO_14',
        'MALE',
        425,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '4fd0f466-c584-4f08-9275-0738f2d49170',
        10,
        'AGE_15_TO_59',
        'FEMALE',
        1350,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'e195e745-25d8-4de8-8b01-7f7f2a7cdd08',
        10,
        'AGE_15_TO_59',
        'MALE',
        1284,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        'a9972438-5a95-4463-9e3f-fc8e01f7c247',
        10,
        'AGE_60_PLUS',
        'FEMALE',
        230,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    INSERT INTO acme_ward_age_gender_wise_economically_active_population 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '635cc52f-d3b5-4b07-8eef-a0572c262f8a',
        10,
        'AGE_60_PLUS',
        'MALE',
        194,
        '2025-06-30 12:17:04',
        '2025-06-30 12:17:04'
    );
    

    END IF;
END
$$;

