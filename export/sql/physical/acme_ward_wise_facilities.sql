-- Generated SQL script
-- Date: 2025-06-30 13:01:30


-- Check if acme_ward_wise_facilities table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'facility_type'
    ) THEN
        CREATE TYPE facility_type AS ENUM (
            'RADIO',
            'TELEVISION',
            'COMPUTER',
            'INTERNET',
            'MOBILE_PHONE',
            'CAR_JEEP',
            'MOTORCYCLE',
            'BICYCLE',
            'REFRIGERATOR',
            'WASHING_MACHINE',
            'AIR_CONDITIONER',
            'ELECTRICAL_FAN',
            'MICROWAVE_OVEN',
            'DAILY_NATIONAL_NEWSPAPER_ACCESS',
            'NONE'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_facilities'
    ) THEN
        CREATE TABLE acme_ward_wise_facilities (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            facility facility_type NOT NULL,
            households INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_facilities) THEN


    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '21494b1b-7246-487f-9953-05df74bad109',
        1,
        'COMPUTER',
        12,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '3f9110cf-ad2b-43c3-945e-b3f7f78e3cfa',
        1,
        'ELECTRICAL_FAN',
        1,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '30ed7738-27ae-4b24-9ad0-5726304e6116',
        1,
        'INTERNET',
        57,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '101daeea-0b31-42fe-9fae-7894c003e9a0',
        1,
        'MOBILE_PHONE',
        404,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'cf432e2f-93fa-4cfe-ae87-0efeb5bcd785',
        1,
        'MOTORCYCLE',
        55,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '0bec0488-fff4-4db2-80b3-f93099f52a79',
        1,
        'NONE',
        15,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'bf272c24-3cf9-4c3f-8341-d65d23ed0b1b',
        1,
        'RADIO',
        103,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'ee7f9c8e-829b-425d-9275-86b987ebbb41',
        1,
        'TELEVISION',
        119,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'f8469269-d902-48bb-b14f-92ebbb65b2ad',
        2,
        'CAR_JEEP',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '9ecf1a39-746a-4a37-bb9f-877a6d324a35',
        2,
        'COMPUTER',
        7,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'd7cd1e19-29fe-4467-823d-5113b61d3b54',
        2,
        'INTERNET',
        68,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'c078da69-83e3-4f21-86b2-bf90158cd0b7',
        2,
        'MOBILE_PHONE',
        143,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'af0366a9-3d09-4a82-ad24-34d8f961d319',
        2,
        'MOTORCYCLE',
        39,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '9b37b153-1587-484f-92d8-9d9b6d21abfb',
        2,
        'NONE',
        1,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'df751be8-097d-439e-b0e3-a24af84c3b7f',
        2,
        'RADIO',
        36,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '0f6811b4-17a7-429d-be5c-855f19287a5e',
        2,
        'REFRIGERATOR',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '01a073f8-9897-4c6c-9881-f89484ad4c23',
        2,
        'TELEVISION',
        39,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '9f62ef9f-5e85-4f43-80c3-5286c7aa2ba3',
        3,
        'AIR_CONDITIONER',
        1,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '19ad2fa2-0e72-4f89-bb36-029bc19ff2fd',
        3,
        'BICYCLE',
        178,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'c276ebdb-8730-4c60-85da-fb77ff340528',
        3,
        'CAR_JEEP',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'ec690484-8f1b-49ec-b643-2dfcb1eed925',
        3,
        'COMPUTER',
        31,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '0cdde149-17f1-4b09-9bf4-5d21fde3a3d5',
        3,
        'ELECTRICAL_FAN',
        388,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '14314e64-271a-4236-a567-05aeffd69592',
        3,
        'INTERNET',
        338,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'f12eca71-4e71-416f-9c16-16bbe9290cc5',
        3,
        'MICROWAVE_OVEN',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '57370d00-4909-4bfc-b699-af222d7f08f9',
        3,
        'MOBILE_PHONE',
        590,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'bf8b1c20-d0c3-40c1-b1a6-c1b6fb2ba350',
        3,
        'MOTORCYCLE',
        121,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '001ddb30-7c2f-49e3-95cc-4626b3146488',
        3,
        'NONE',
        20,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'ac749b88-2264-4a77-be20-90bb6d29ad78',
        3,
        'RADIO',
        20,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '6dde42f5-a11e-4c3a-bafb-9fd8759dee35',
        3,
        'REFRIGERATOR',
        200,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'c2fb5717-e0cb-406c-ada6-47403c50a4d6',
        3,
        'TELEVISION',
        197,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'acfa7b58-2ba0-45cd-ab5f-912e5ea218e6',
        3,
        'WASHING_MACHINE',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '6710819a-3f44-4a4c-a0c3-6c6bb8f630cf',
        4,
        'BICYCLE',
        1,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '9ae17ed0-f7a1-4d57-b5cd-1680b81867ad',
        4,
        'CAR_JEEP',
        1,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '1f74492f-cece-4296-a916-8deea91dc02b',
        4,
        'COMPUTER',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '721464be-c97c-4b99-b0e0-52affe69c16c',
        4,
        'ELECTRICAL_FAN',
        1,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'bc27466b-be7b-46b3-b88e-7ffb318fff3e',
        4,
        'INTERNET',
        24,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'ce6959d1-9510-4fd3-9321-98b093111553',
        4,
        'MOBILE_PHONE',
        320,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '27917d39-ac4e-440e-8b7d-48f61df22d93',
        4,
        'MOTORCYCLE',
        32,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'b6d9bcba-7731-48bd-a01d-95f947eda6e9',
        4,
        'NONE',
        16,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '85574eef-f36f-4153-be4e-aab9da3d053a',
        4,
        'RADIO',
        38,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '6a90f664-7cb7-41cd-b95e-ee7b43138e1c',
        4,
        'TELEVISION',
        65,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '619b1194-e0b1-40a7-8342-e49b0a510bb8',
        5,
        'AIR_CONDITIONER',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'd2cb7cea-e4f0-44be-a7f2-48065233d9f2',
        5,
        'BICYCLE',
        15,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'a5085355-1fba-4def-897c-0fa9a171ee49',
        5,
        'CAR_JEEP',
        21,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '4c8c7df7-9069-47b5-8134-c8013a951fe1',
        5,
        'COMPUTER',
        46,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'e64e50a1-c32d-4590-b56c-71a70dc142e9',
        5,
        'ELECTRICAL_FAN',
        749,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'e635956b-1a29-4b59-836f-b66629d3be94',
        5,
        'INTERNET',
        633,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '7c1540a9-ad94-45bc-9bd1-1483ed7dd992',
        5,
        'MICROWAVE_OVEN',
        4,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '08c8115d-67f7-47d6-a53e-93036c3fdd2c',
        5,
        'MOBILE_PHONE',
        895,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'cb945a8e-1656-40da-9408-87a435b9e82f',
        5,
        'MOTORCYCLE',
        194,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '8828dd83-eb20-4ac9-a647-a69b9e38b722',
        5,
        'NONE',
        8,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '6b0d4542-31a8-41fb-b5b6-aed8bee273a4',
        5,
        'RADIO',
        72,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '20f23a13-681a-474b-988c-307f00f69ee4',
        5,
        'REFRIGERATOR',
        420,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '8bafe171-54f4-46af-8356-6e3c9ac50f41',
        5,
        'TELEVISION',
        309,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'c1ffb79a-cbc9-463e-903a-91647c73a044',
        5,
        'WASHING_MACHINE',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '29f34964-6649-4202-a1e9-6393b26717c8',
        6,
        'AIR_CONDITIONER',
        1,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'c46ed1fb-cee2-49b7-9e60-842fb38a1ea0',
        6,
        'BICYCLE',
        204,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '63827805-203e-400e-a045-e02378ecff82',
        6,
        'CAR_JEEP',
        10,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '780a1fee-2c99-4649-b1ca-d93b63c37550',
        6,
        'COMPUTER',
        50,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'dc03aedf-2e43-46a1-ac12-f6eccd78daff',
        6,
        'DAILY_NATIONAL_NEWSPAPER_ACCESS',
        1,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'd79df8d2-4352-4139-9a18-d70222bfa546',
        6,
        'ELECTRICAL_FAN',
        404,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '3c5d8ca5-5170-4d71-b2b9-955dcdf3ef29',
        6,
        'INTERNET',
        461,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'cb690ef8-eb44-4376-88cc-9b79b820490e',
        6,
        'MICROWAVE_OVEN',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'ba8e5469-e274-4c31-96d6-497d02f00e4b',
        6,
        'MOBILE_PHONE',
        858,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '6036b312-1f44-4f76-9049-c71d38bea482',
        6,
        'MOTORCYCLE',
        158,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'fe482c61-7027-4d7d-9bcf-d6d99221bf10',
        6,
        'NONE',
        23,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '1d26007a-ad75-4166-a82f-3e16b6282882',
        6,
        'RADIO',
        262,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '258f6655-fbe1-469f-855d-379ad6717fed',
        6,
        'REFRIGERATOR',
        241,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'af115e17-a35f-4ab8-9fef-f3a795b9cb7f',
        6,
        'TELEVISION',
        431,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'aadaf89f-012a-448d-ba95-f7df26734353',
        6,
        'WASHING_MACHINE',
        5,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '2ac6c882-2fe0-4586-88a5-ca5408e68930',
        7,
        'AIR_CONDITIONER',
        3,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '63685ceb-76a4-47c6-b3e4-b90bd1cf4166',
        7,
        'BICYCLE',
        257,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'befbb3a4-e7c2-45ec-abd7-25995434edf4',
        7,
        'CAR_JEEP',
        5,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'ca45ef91-53c6-4774-b67d-0ce3168bb808',
        7,
        'COMPUTER',
        21,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'ba34eda7-1739-4b17-95fb-7e7f89cebd40',
        7,
        'ELECTRICAL_FAN',
        591,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'bb762f73-6515-4c01-91a2-44ecea0ad335',
        7,
        'INTERNET',
        406,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '85474bb9-a461-440f-8339-520119c9aee6',
        7,
        'MOBILE_PHONE',
        756,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '21dd2046-f026-4078-8cd3-86e5de5e50fe',
        7,
        'MOTORCYCLE',
        226,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '5d58a2be-4cb0-4a3d-ad35-66dddc0f77de',
        7,
        'NONE',
        21,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '02500179-d16d-495a-aaef-e3f8400d6768',
        7,
        'RADIO',
        57,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '74f58426-953a-46bb-b830-22e01bb00cc9',
        7,
        'REFRIGERATOR',
        453,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '85de619c-60f0-4f3b-a485-5cc8095da4c9',
        7,
        'TELEVISION',
        451,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'b03f6243-1bcb-4e0c-84a1-6d1de28f61e7',
        7,
        'WASHING_MACHINE',
        4,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'a21899f9-3a72-414e-958c-d4de75e2a188',
        8,
        'AIR_CONDITIONER',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'e0bc3f03-3c69-4925-addb-d625c372b377',
        8,
        'BICYCLE',
        156,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '721f154b-047b-4437-b889-191fd87bb591',
        8,
        'CAR_JEEP',
        7,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'e45a04ec-bacd-4dc2-8861-b54c09c2c98a',
        8,
        'COMPUTER',
        32,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'df675b32-bc9f-41d9-9acd-81920b443f0c',
        8,
        'ELECTRICAL_FAN',
        329,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '40f12ed7-3fe6-46f0-8110-a4ff2ca822e9',
        8,
        'INTERNET',
        319,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '1c6abb9e-11d4-4ac3-a09b-453acc896a60',
        8,
        'MICROWAVE_OVEN',
        1,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '80a5d854-d563-4df8-906c-450974a7bff5',
        8,
        'MOBILE_PHONE',
        482,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '21a8a583-6dd4-4859-b627-dabe54dce2b1',
        8,
        'MOTORCYCLE',
        121,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '1d513905-81bf-4e52-86fe-84b86abce34f',
        8,
        'NONE',
        15,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '1ca64fe1-c687-42cc-954b-8395cd5022b0',
        8,
        'RADIO',
        25,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '506c10fd-7004-4df8-bf5c-6d09cbfbca2a',
        8,
        'REFRIGERATOR',
        220,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '7f03fb22-91b2-4ae4-a691-eb30c9cafcdd',
        8,
        'TELEVISION',
        250,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '6fc43c02-a73f-4d96-9f33-4571fbbf8b4f',
        8,
        'WASHING_MACHINE',
        7,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '6a930521-0d60-4cdc-a0a8-b042f0b565df',
        9,
        'BICYCLE',
        555,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '06d8056f-9e3f-4b95-9072-d3a115f92b10',
        9,
        'CAR_JEEP',
        12,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '4eb816f0-8f58-4bc1-be63-9430a56f0db4',
        9,
        'COMPUTER',
        98,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '19d3f27b-a034-46e3-a2e3-5c01f1e87d00',
        9,
        'ELECTRICAL_FAN',
        1125,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '8501104f-9f34-48a4-ae5a-9c65a232efe6',
        9,
        'INTERNET',
        699,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '182ff54b-7e41-4185-9d27-ab118674b1d1',
        9,
        'MICROWAVE_OVEN',
        6,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'b73ec9d3-4e76-4a8d-b0ca-a0eef8b8960d',
        9,
        'MOBILE_PHONE',
        1193,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '63b6f4f3-24e8-4dde-b53e-90fb45134efa',
        9,
        'MOTORCYCLE',
        277,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '3da57169-96d0-4c35-9b88-01ad13334fec',
        9,
        'NONE',
        16,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'c7ede1d9-54b2-4ba1-97fb-5de21e57f066',
        9,
        'RADIO',
        101,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'c55324a8-48aa-48ab-be2c-74436454d7bd',
        9,
        'REFRIGERATOR',
        578,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'bfa95f1f-4fe3-4e98-bb88-e78312312d42',
        9,
        'TELEVISION',
        518,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '69871555-ad48-4572-b15f-80295016b9f8',
        9,
        'WASHING_MACHINE',
        9,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'ac68c2c0-5472-4122-9162-065f3b757e91',
        10,
        'AIR_CONDITIONER',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '5635cbad-e35c-4175-a9d2-8408fa0f6e5b',
        10,
        'BICYCLE',
        93,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'b63283c2-2ed1-4a32-879c-05b598e26d60',
        10,
        'CAR_JEEP',
        24,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '2f46fe4c-f105-469b-8c04-6ee0fca99b21',
        10,
        'COMPUTER',
        95,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '9b2af1ec-858c-49fe-a9d1-36e12e283469',
        10,
        'DAILY_NATIONAL_NEWSPAPER_ACCESS',
        2,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '32bde387-f958-4888-99c7-157fad070305',
        10,
        'ELECTRICAL_FAN',
        691,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'f4755a42-f3fc-41dc-b9f3-124963029db2',
        10,
        'INTERNET',
        591,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '4d163848-c6a9-4a52-969f-8bf7d9fb5175',
        10,
        'MICROWAVE_OVEN',
        7,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '5943f690-99b8-4ae7-bd14-f9eb0c592f1b',
        10,
        'MOBILE_PHONE',
        820,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '3d361d25-a13e-437e-b09b-aa6b97150e1c',
        10,
        'MOTORCYCLE',
        233,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'f3ce9974-8a9c-4b2e-895b-f448d320647b',
        10,
        'NONE',
        11,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'e7d64c1a-1d53-4cdc-abb4-5a39ac463a48',
        10,
        'RADIO',
        43,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        '1a4010c5-211b-42ad-a703-61d5477da902',
        10,
        'REFRIGERATOR',
        502,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'b5670a48-c204-4a8f-a1cb-fd18cf406644',
        10,
        'TELEVISION',
        376,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    INSERT INTO acme_ward_wise_facilities 
    (id, ward_number, facility, households, updated_at, created_at)
    VALUES (
        'a9c01710-c927-462c-8220-fa28354655a3',
        10,
        'WASHING_MACHINE',
        31,
        '2025-06-30 13:01:30',
        '2025-06-30 13:01:30'
    );
    

    END IF;
END
$$;

