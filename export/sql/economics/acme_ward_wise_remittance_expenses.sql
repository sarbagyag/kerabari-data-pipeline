-- Generated SQL script
-- Date: 2025-06-30 12:17:42


-- Check if acme_ward_wise_remittance_expenses table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_remittance_expenses'
    ) THEN
        CREATE TABLE acme_ward_wise_remittance_expenses (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL,
            remittance_expense TEXT NOT NULL,
            households INTEGER NOT NULL DEFAULT 0 CHECK (households >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_remittance_expenses) THEN


    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '0fac8d3d-1eb6-46af-9638-e5f4bece3858',
        1,
        'education',
        58,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'f68c66fe-f295-46da-bd9a-4001d13abe5e',
        1,
        'festivals',
        4,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '8c195c46-76a7-4016-8a67-89d2d2bab522',
        1,
        'health',
        74,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '9cb3e3f7-be27-4c9e-a9b4-18e2e0f3e02c',
        1,
        'house_construction',
        10,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'bae72d85-5851-4550-833f-ccd6af6f777a',
        1,
        'household_use',
        90,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '732e41ac-2a40-47ae-b8a9-3a05a3d91f5b',
        1,
        'jwellery_purchase',
        4,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '004464c7-44cf-41cc-9e1f-00fc498687c1',
        1,
        'land_ownership',
        12,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '3cccc392-739c-4f5d-a446-4e1166a0e25b',
        1,
        'loan_payment',
        83,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '6a43b10a-42aa-4e8a-88c1-bc7938dd52e3',
        1,
        'loaned_others',
        5,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'd6cf0e76-9ee3-41f3-980c-1b22f15b80f4',
        1,
        'saving',
        7,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'f9b384f2-7d1d-4526-a8e2-c79ba0f39d25',
        2,
        'education',
        12,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '3c191ce9-e979-4261-9cff-f010fe706653',
        2,
        'goods_purchase',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '6588661e-f9ec-4f8b-9d9b-6d954206fd7c',
        2,
        'health',
        16,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'c9357ac3-1be6-4f92-95bf-465ac05eb2ea',
        2,
        'household_use',
        36,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'fd9bac33-c498-43b4-92f8-99588d174fce',
        2,
        'land_ownership',
        2,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '6cbe676e-64b9-4918-b043-7c177b985c4f',
        2,
        'loan_payment',
        14,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '1ec7fb23-76d2-49f6-aebe-26d5025e03d6',
        2,
        'loaned_others',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '0c4bc8c9-a478-4260-bba1-36e97a2112ec',
        2,
        'other',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'bd3027f2-376c-4735-8848-babde6f4b16a',
        2,
        'saving',
        9,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'ef48625b-6fcd-4145-93e8-444a548adac8',
        3,
        'business_investment',
        5,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'd66e1d18-75de-4033-9339-afc7d44d0ebf',
        3,
        'education',
        270,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '08012f21-8052-4abb-b230-975e503ea151',
        3,
        'festivals',
        15,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'a2242146-c31f-45f5-b1ef-5cbcef31abd0',
        3,
        'goods_purchase',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'f9c92d97-c7d4-42b5-bcff-cce30e176f86',
        3,
        'health',
        290,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'cf4472f7-d4fe-4634-85bd-f6b959ba1717',
        3,
        'house_construction',
        20,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '64793282-38e8-46d5-932a-925ef2c8cfaf',
        3,
        'household_use',
        304,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '7a022a0a-ef51-45c4-b42d-798e7138333b',
        3,
        'jwellery_purchase',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'c1a48f99-fa31-47d4-8cf0-05c86b0fa872',
        3,
        'land_ownership',
        6,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '8ee87241-3ffb-41d3-ab74-0ae927044941',
        3,
        'loan_payment',
        154,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'd683a6ed-110c-4ac5-9f1c-34cf73887ebe',
        3,
        'loaned_others',
        6,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'b383e39e-3a36-4a9a-9463-13741ebf7c42',
        3,
        'other',
        24,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '3bb339f6-b99e-40ee-a47c-7798b18066a0',
        3,
        'saving',
        127,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'aa138f7c-9795-4fe3-8555-ad9be364304f',
        4,
        'education',
        18,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'f7320dd8-bda4-40c6-a8f1-ef7ca3e9df85',
        4,
        'health',
        10,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '729cd07f-bf68-4bdf-b481-4d401023aed1',
        4,
        'house_construction',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'bcf4580b-c3a9-400d-bc8e-782a7743d498',
        4,
        'household_use',
        45,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'b8b7a497-6ced-45d8-8d8b-5a23c9077e06',
        4,
        'land_ownership',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'd9a41884-8c9d-45c6-9d41-ce86e34efbea',
        4,
        'loan_payment',
        44,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '384668b2-367d-4e16-b9b4-8069aa6d07c2',
        4,
        'saving',
        4,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'b5e19440-6782-407b-af37-5b646989c306',
        5,
        'business_investment',
        3,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'a03ec120-dc25-4e38-860d-76f9c6bafd5a',
        5,
        'education',
        202,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'df8fee17-4e91-4115-bd88-e98982642081',
        5,
        'festivals',
        66,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '322c030f-0a51-4f78-9dc2-2d8f3a871d8d',
        5,
        'goods_purchase',
        41,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '954cfbd2-60a1-485b-a518-70ff92c9872d',
        5,
        'health',
        162,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '38f6848f-cc1c-4821-9ca8-e3e9c46ff135',
        5,
        'house_construction',
        26,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '1402bb25-0bfc-405c-acaf-dd366b527ea4',
        5,
        'household_use',
        336,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '2cf0ccf9-7c49-4a8a-b508-0d7046034cd9',
        5,
        'jwellery_purchase',
        8,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'ca15689a-1ed4-4b71-a941-beb23a8b4139',
        5,
        'land_ownership',
        10,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '4a2c259d-9a26-494d-814a-d210daaf19cd',
        5,
        'loan_payment',
        179,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '0e0738c4-c73e-4a7c-b363-b1bceef7cc9b',
        5,
        'loaned_others',
        5,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '437d6c39-cae4-4157-ac6f-460ccfb99b25',
        5,
        'saving',
        72,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '16316c23-a50f-498b-8c69-c38313332032',
        5,
        'unknown',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '6ca785e7-650e-4013-8472-65c62d7928fc',
        6,
        'education',
        116,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'd38f1aab-4019-48e1-9b90-192b83baca44',
        6,
        'festivals',
        5,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '2fea03a4-4071-474d-a711-51f398cf9848',
        6,
        'goods_purchase',
        4,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '0d9428ee-3748-4872-8eab-4b7c726347dc',
        6,
        'health',
        105,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '0a9abfb0-478b-4c00-bbf6-15034dc4f7bf',
        6,
        'house_construction',
        10,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'cfb38485-34f2-4b1f-9b1b-34197375e9b7',
        6,
        'household_use',
        157,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'd05f89cc-e3a9-402b-8ae9-50f7d4e22550',
        6,
        'land_ownership',
        4,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'be8ab819-9100-4ca2-80cc-5611adb3198f',
        6,
        'loan_payment',
        62,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '80c6ca42-7d56-4594-97b9-d1485521f435',
        6,
        'loaned_others',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'c5e280fa-f25c-4bb6-888d-0627f351fab8',
        6,
        'other',
        17,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'bd4c3c87-8aba-4857-8dff-cee82f4e3d75',
        6,
        'saving',
        17,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'e797acc1-f1db-4112-af3c-db985ec06048',
        6,
        'unknown',
        2,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'f3fa3eeb-df1c-42c6-ad87-f2f095689f33',
        7,
        'business_investment',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'f0a8b1a9-8844-4089-86ef-d370eb7b09db',
        7,
        'education',
        168,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '89580537-7aa1-4f00-a0d7-09ef9f3f8e3b',
        7,
        'festivals',
        33,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '0fd01519-cd8b-4342-a82c-75666f02e2dc',
        7,
        'goods_purchase',
        2,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'c4acd63e-a259-4ccb-b004-4fe680ff4102',
        7,
        'health',
        174,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'dc2108eb-bf24-44f4-85b6-78c038e52c0f',
        7,
        'house_construction',
        6,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '913cb2eb-6f57-477d-9c79-1e0d4824cfea',
        7,
        'household_use',
        234,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '2d0eac52-cdee-4868-ba5b-72631a06aa56',
        7,
        'land_ownership',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'bb6f91c2-0434-485f-b61d-4deb6506ed21',
        7,
        'loan_payment',
        170,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '33a0114d-38e0-4c7a-90ee-1b9f331fc684',
        7,
        'saving',
        11,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '8f9bf090-603e-45fa-aa73-2d77c9d09b06',
        7,
        'unknown',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'a4584a0e-4f44-4a52-8b8c-3ebcef8415b5',
        8,
        'education',
        56,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'e239ab4a-0d7d-4238-b007-b9a1e2f43b37',
        8,
        'health',
        65,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '4fe32055-f744-4941-8c16-fe6dcb48d0ae',
        8,
        'household_use',
        68,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '646db6c5-b084-4715-a959-50a4c7e1e966',
        8,
        'loan_payment',
        9,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '76f9db3b-7e45-455e-b5f5-c074cf92b580',
        8,
        'other',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '0eaa00c9-39ac-4ac4-9b5e-e080af56ad42',
        8,
        'saving',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '53e51619-9fde-417e-b42d-b319467bef7f',
        8,
        'unknown',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '92eed833-14aa-495c-b48b-574a976af19f',
        9,
        'education',
        393,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '5b54ee80-8211-4603-a388-3f3ec9f00733',
        9,
        'festivals',
        25,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '8c640b88-d17b-44a8-9ad2-7100f2bd3e09',
        9,
        'goods_purchase',
        5,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '1320b11a-75ff-4a6b-90cb-7de720b4d78a',
        9,
        'health',
        416,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '829f954c-2efb-4860-958d-052f19f417df',
        9,
        'house_construction',
        25,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '48392ced-aa34-4d0c-aedb-8b962a07b257',
        9,
        'household_use',
        424,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'ff66c973-4647-4bcb-84b7-a97a2481c66a',
        9,
        'land_ownership',
        14,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '70f75b1d-1aa5-43b8-8599-059f8b962728',
        9,
        'loan_payment',
        367,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '5181c03c-5f38-4431-be2b-5d0b4f39f44d',
        9,
        'loaned_others',
        4,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'a53c08a5-2ba8-4625-9f48-1c9c33a1819c',
        9,
        'other',
        3,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '93c5c14a-e545-4093-8ce6-f89df78e0a13',
        9,
        'saving',
        120,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'ce1e8dbe-99ad-49f7-bb9c-4fa01ccae89f',
        10,
        'business_investment',
        4,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'd86ab9a1-a5d6-4b05-8ce7-18ca13d8119e',
        10,
        'education',
        272,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '81c7a8bb-c59b-418f-aaa9-be77eab002ec',
        10,
        'festivals',
        93,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'c147a7dd-ec11-4c64-9a27-61e334c631e4',
        10,
        'goods_purchase',
        1,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'e01cb310-4007-4737-8be7-b8dfc3ee638e',
        10,
        'health',
        339,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '94c3c0fc-fdbe-4f55-af8e-604b6e8aacc8',
        10,
        'house_construction',
        32,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '9b56e069-4305-40bd-84ce-51f8a1e2d5d0',
        10,
        'household_use',
        346,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'e6260f2b-a450-4cea-97e4-047853d421b3',
        10,
        'jwellery_purchase',
        7,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'b2a52d6f-e0fe-411f-b47a-c492b95d4f99',
        10,
        'land_ownership',
        30,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        'de3722dc-cb2f-4ce2-b257-39ce524bc17f',
        10,
        'loan_payment',
        186,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '24ed99ba-a75b-43d0-8e8c-9115cb162ac3',
        10,
        'loaned_others',
        3,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '6705399e-9b92-4f24-81d0-6427e3e053a7',
        10,
        'other',
        3,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    INSERT INTO acme_ward_wise_remittance_expenses 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '1bcde716-e391-4df3-a490-ae2978c5838a',
        10,
        'saving',
        45,
        '2025-06-30 12:17:42',
        '2025-06-30 12:17:42'
    );
    

    END IF;
END
$$;

