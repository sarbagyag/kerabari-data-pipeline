-- Generated SQL script
-- Date: 2025-06-30 13:03:49


-- Check if acme_ward_wise_household_roof table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_household_roof'
    ) THEN
        CREATE TABLE acme_ward_wise_household_roof (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            roof_type VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_household_roof) THEN


    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '2f175630-13d6-47a7-b13c-1c2146f11caf',
        1,
        'CEMENT',
        11,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '851475cd-4821-4bd7-b061-7d7ed89e5ba8',
        1,
        'STRAW',
        3,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '41366d7f-274a-46b3-bada-a4c670db112a',
        1,
        'TIN',
        472,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '113ff370-aee8-4de1-a566-6339ae340fae',
        1,
        'WOOD',
        3,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '86d06e5c-be62-4cad-b9a4-f01b3fa356bb',
        2,
        'CEMENT',
        3,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'a0797de7-aec6-4b30-a452-efc211eece4c',
        2,
        'STRAW',
        21,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'd6fab059-84ab-482f-b8da-28f6f9396a02',
        2,
        'TIN',
        554,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '3f6c19a1-cc14-425b-aee7-e4eb972e9bb9',
        3,
        'CEMENT',
        65,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '40a4cad6-bc94-4778-afef-5e5ebc0819b7',
        3,
        'STRAW',
        3,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '63e09c49-b0a5-4e3d-895b-cf4289b4a846',
        3,
        'TILE',
        4,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '28d1804f-f887-40bf-a363-4c939245962b',
        3,
        'TIN',
        759,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '948f4511-a072-4845-82e2-977f45a67d7e',
        3,
        'WOOD',
        5,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '016c4fcd-f65f-4caa-87b6-9dfc08b43d85',
        4,
        'CEMENT',
        6,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '1deb18cc-dba1-4701-9324-1d554a06bec4',
        4,
        'TIN',
        419,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '4ffe62c2-45be-49bf-8a80-dbeb46957291',
        4,
        'WOOD',
        2,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'cce012c2-77c1-4901-9492-5439982f3333',
        5,
        'CEMENT',
        92,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'a2dffe67-1cf7-4070-88a8-faf6a904d48c',
        5,
        'STRAW',
        1,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '0e0b6f40-01fc-43ad-aa6c-6dd7e52448f1',
        5,
        'TILE',
        1,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'a6415596-22c2-4181-b997-ee58513c472e',
        5,
        'TIN',
        916,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'aad1deaf-59a2-4046-aecb-2dd4d8bd35aa',
        5,
        'WOOD',
        5,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '585b3d6d-6f5c-4350-a758-27cb3c919c79',
        6,
        'CEMENT',
        104,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '71f66894-abe9-404f-94dd-debb5416d763',
        6,
        'STRAW',
        1,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'a09682b0-3b01-4776-a9a2-7c94a2426743',
        6,
        'TIN',
        909,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '7d96dd4c-707d-4131-b048-a05614b205c6',
        7,
        'CEMENT',
        96,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '95b683b0-7a32-4f58-b134-73799887b879',
        7,
        'STRAW',
        1,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '7848c0d2-9399-4c31-b620-1f7ea24c0a6c',
        7,
        'TILE',
        4,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'add69574-581c-46ea-8bc5-ddd17927868b',
        7,
        'TIN',
        956,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '86e3c016-a1e9-4cfa-936d-843196e9fd3e',
        7,
        'WOOD',
        6,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '13e69cb3-b60a-4ebd-b5ac-1ab72905328c',
        8,
        'CEMENT',
        134,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '847f2eee-1340-48a1-8394-b362a980c6b5',
        8,
        'STONE',
        3,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '34df3eea-412b-43a1-a230-2ea35dad607e',
        8,
        'TIN',
        932,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '7f047fae-c8b4-4149-9047-4df0c7c6e32f',
        9,
        'CEMENT',
        138,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'd7f520b5-b43b-49e7-8abc-4cfdde7b8551',
        9,
        'STRAW',
        6,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '2fc7fa29-70c8-428c-b95d-bbf193fc66bf',
        9,
        'TILE',
        7,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'bfdf4975-e02a-46d8-93af-46b134d20e11',
        9,
        'TIN',
        1290,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '0d3408eb-cc0b-4df9-bbb3-5cec7d4db224',
        10,
        'CEMENT',
        229,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '945efbee-f23b-4727-abfb-218eceb0ddbb',
        10,
        'STONE',
        1,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'f5b1d9fd-6fa8-4aeb-9deb-4c4bc78f1769',
        10,
        'TILE',
        2,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    INSERT INTO acme_ward_wise_household_roof 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        'f41f1675-67a9-439b-a028-121dfda5db12',
        10,
        'TIN',
        699,
        '2025-06-30 13:03:49',
        '2025-06-30 13:03:49'
    );
    

    END IF;
END
$$;

