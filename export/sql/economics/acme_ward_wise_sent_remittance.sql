-- Generated SQL script
-- Date: 2025-06-30 12:20:23


-- Check if acme_ward_wise_sent_remittance table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_sent_remittance'
    ) THEN
        CREATE TABLE acme_ward_wise_sent_remittance (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL CHECK (ward_number >= 1 AND ward_number <= 9),
            amount_group VARCHAR(25) NOT NULL,
            sending_population INTEGER NOT NULL DEFAULT 0 CHECK (sending_population >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_sent_remittance) THEN


    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'b997939e-100f-47b7-9072-144a7e12ca62',
        1,
        'no_remittance',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '8c27a8c8-81cb-46fa-84f7-5b2c1f50d300',
        1,
        'below_50k',
        16,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'ce15d5b9-b6a0-45f5-bd40-3e28576a1b75',
        1,
        '50k_to_100k',
        27,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '9a1f31e4-94db-46f7-b683-2653db782fc5',
        1,
        '100k_to_200k',
        45,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'b1b9f55c-16d6-4b09-a502-ae4b06d7bde5',
        1,
        '200k_to_500k',
        47,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '23da8355-cdb5-4d78-a679-7071f8918b9c',
        1,
        'above_500k',
        33,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'd985f7c6-6c10-49d0-8880-29ae53c8dc94',
        2,
        'no_remittance',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '7623a4f0-b3cb-464a-bb10-738b9e3aa36b',
        2,
        'below_50k',
        3,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'febae07a-87f8-46ea-9501-2fce52a8c2f5',
        2,
        '50k_to_100k',
        9,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'f1ce21bb-d089-464f-b1ea-c4be423d20c7',
        2,
        '100k_to_200k',
        7,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'b480107d-d37c-4e5e-910d-6ff6543587c8',
        2,
        '200k_to_500k',
        1,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '03236e2c-6de2-42fc-af78-c339ae1454c5',
        2,
        'above_500k',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'dbba4fae-82b4-4211-84e3-c18dc28ba95e',
        3,
        'no_remittance',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'f50d5daf-1e4a-4af4-bc75-3500b0b93073',
        3,
        'below_50k',
        11,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '1628f689-b5d2-4009-8286-686c2c5ec47d',
        3,
        '50k_to_100k',
        11,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '058962ef-2ab8-471b-b8c8-c1ed13151438',
        3,
        '100k_to_200k',
        42,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '5c504d4f-7d04-4843-824c-61648cc9eac1',
        3,
        '200k_to_500k',
        151,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'a513f0ea-65a7-457e-a543-ee415b31d22d',
        3,
        'above_500k',
        11,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'e2fd1aa0-2573-4b6a-9365-a1c7a6d75084',
        4,
        'no_remittance',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '3f516bd8-81e3-4d5e-8af0-907ac7103b7c',
        4,
        'below_50k',
        10,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'b076e62a-89f2-4058-b4ba-9c1b63bf0fec',
        4,
        '50k_to_100k',
        17,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'dfae459b-565a-4bf6-9429-d56edb9aba9b',
        4,
        '100k_to_200k',
        18,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '711cfd19-2ba7-48c0-806d-6224e0b36d3a',
        4,
        '200k_to_500k',
        30,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '60c18f57-f464-4fa0-a059-50b02297026f',
        4,
        'above_500k',
        5,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'a717073f-8bbf-494b-aa40-53599ca17bd7',
        5,
        'no_remittance',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '7d197e6e-7a1c-4bc6-afc7-aa20e494be66',
        5,
        'below_50k',
        12,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'c4d9dc11-6204-4b6b-88be-1ae268a03447',
        5,
        '50k_to_100k',
        33,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'dea37338-87a7-4766-a497-804af470626d',
        5,
        '100k_to_200k',
        76,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '0203fd27-77ce-496b-b17c-3028232fad0b',
        5,
        '200k_to_500k',
        175,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'e528780d-b42a-422d-8154-7fd6bba8c443',
        5,
        'above_500k',
        82,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '1f106c83-0fad-4ff7-995e-bda2f23f2fe5',
        6,
        'no_remittance',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '53c65205-d958-4838-93ca-c6bc56a14f8b',
        6,
        'below_50k',
        39,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '5c46abd9-596a-40dd-83a9-123a34ab60f2',
        6,
        '50k_to_100k',
        30,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'b9d7b7d8-4d68-4bbf-b545-f98c85404baf',
        6,
        '100k_to_200k',
        34,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '06cd01dd-ea77-4fa1-ac11-ad20eefe10b8',
        6,
        '200k_to_500k',
        54,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '5353c897-3720-45e8-b0a9-2eee00cce048',
        6,
        'above_500k',
        41,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'c7ab021b-9f57-4bd6-affb-9732f6c3dd97',
        7,
        'no_remittance',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '5357ff90-3fcf-40f1-8556-690bdcee2f08',
        7,
        'below_50k',
        19,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'ff32cec0-6250-4482-9873-730d372b12ae',
        7,
        '50k_to_100k',
        6,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'ce0f0012-2bff-4f56-8512-017db924ccae',
        7,
        '100k_to_200k',
        14,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '47f0560b-a56a-4e21-af4a-a774afc56270',
        7,
        '200k_to_500k',
        14,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '1acc7ec3-49f2-49f9-b9f9-89d983e89152',
        7,
        'above_500k',
        12,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '978fed9b-d041-493d-8637-6c93828e4924',
        8,
        'no_remittance',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '279e110f-db38-439e-82c2-c7bad59642f8',
        8,
        'below_50k',
        26,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '528c9aa8-108b-4872-82f7-32b5efa4232b',
        8,
        '50k_to_100k',
        17,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '53bf458a-d2a2-44a1-ad45-4d5be6f3e4b1',
        8,
        '100k_to_200k',
        22,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'abd4d912-31bc-4e17-b34f-f05e744a68a4',
        8,
        '200k_to_500k',
        80,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'dacd74d1-5727-4c4b-9e87-430544c45980',
        8,
        'above_500k',
        30,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'a383eb74-5ef4-43ed-a8a2-0a53602f8014',
        9,
        'no_remittance',
        0,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'e44efeef-51d6-487a-afa8-30c5ed7e58c1',
        9,
        'below_50k',
        39,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'cae5ccf3-5abe-4d81-8a57-e6d0851e8351',
        9,
        '50k_to_100k',
        40,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'd58f6f49-289c-4b0f-976e-f321667ac3ae',
        9,
        '100k_to_200k',
        105,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'f6308208-dd27-4632-846e-866e761550c3',
        9,
        '200k_to_500k',
        216,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    INSERT INTO acme_ward_wise_sent_remittance 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        'b5200e59-e06c-42f5-bffb-9601a7ad1928',
        9,
        'above_500k',
        65,
        '2025-06-30 12:20:23',
        '2025-06-30 12:20:23'
    );
    

    END IF;
END
$$;

