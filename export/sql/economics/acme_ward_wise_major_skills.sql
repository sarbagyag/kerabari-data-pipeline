-- Generated SQL script
-- Date: 2025-06-30 12:14:59


-- Check if acme_ward_wise_major_skills table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_major_skills'
    ) THEN
        CREATE TABLE acme_ward_wise_major_skills (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL,
            skill TEXT NOT NULL,
            population INTEGER NOT NULL DEFAULT 0 CHECK (population >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_major_skills) THEN


    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'd643b22f-e36b-436e-86cd-9e0ad1ef9199',
        1,
        'SELF_PROTECTION_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '3ed89a62-0058-475a-884b-0462386a3791',
        1,
        'COMPUTER_SCIENCE_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '080ce52a-88c1-4266-b9c5-c431a8ca6704',
        1,
        'AGRICULTURE_RELATED',
        61,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '530b9dd4-441f-46b2-b040-913eee1a30a0',
        1,
        'BEUATICIAN_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '9abfd682-97d9-4101-8474-4fd65e3c142b',
        1,
        'MUSIC_DRAMA_RELATED',
        6,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '585620c8-d689-4b18-aca7-5b9c069c5b07',
        1,
        'ANIMAL_HEALTH_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '35cdfefb-1c22-4f32-89c8-8d38f56a5c1e',
        1,
        'SEWING_RELATED',
        10,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'ce1efb1b-051c-455c-bebe-feb317b2f7d8',
        1,
        'ELECTRICITY_INSTALLMENT_RELATED',
        8,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'e6e829cb-65ef-40c2-91a6-a94f2ff2f266',
        1,
        'HUMAN_HEALTH_RELATED',
        10,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'e43f5a20-e5f1-4fe3-b7a4-2b712b00e99e',
        1,
        'MECHANICS_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '8659feab-88c6-4269-9f21-290cbb008177',
        1,
        'TEACHING_RELATED',
        37,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'c3b9d2f2-7d12-46e8-97d6-99a6d10e217d',
        1,
        'DRIVING_RELATED',
        7,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '5ae1681c-b93b-49d2-a019-4d09c54081f3',
        1,
        'CARPENTERY_RELATED',
        13,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '40ff9da0-f78c-4b1e-8bf5-f4d009c33716',
        1,
        'HANDICRAFT_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'f1d452e7-719c-4fbb-a028-06c7109e9508',
        1,
        'HOTEL_RESTAURANT_RELATED',
        11,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '931a168e-6094-4ed5-8aea-22e567a9abf2',
        2,
        'SELF_PROTECTION_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '226156ac-5ff4-44dc-89a6-997829856cf0',
        2,
        'AGRICULTURE_RELATED',
        9,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'dc71d532-6ee9-4f66-b84b-208d5bb7dda1',
        2,
        'SEWING_RELATED',
        21,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'ac0c0939-7115-4fa5-97b1-cf8e9ace4686',
        2,
        'HUMAN_HEALTH_RELATED',
        6,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'aa93c9e6-42a1-4ec8-87e0-61786898074e',
        2,
        'TEACHING_RELATED',
        53,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '310315c4-79b4-4132-b2ab-d2c49a1f1bed',
        2,
        'DRIVING_RELATED',
        27,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '86f62015-50e7-4d68-a631-107cc46d0067',
        2,
        'LITERARY_CREATION_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'b0eab860-72fc-4570-a4a5-a143a57fb57c',
        2,
        'CARPENTERY_RELATED',
        16,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '3e4f1699-5cb0-4321-8e75-d33710980a14',
        2,
        'HOTEL_RESTAURANT_RELATED',
        17,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '2da5e46e-2001-489b-8f91-c4f9c30a55c2',
        3,
        'SELF_PROTECTION_RELATED',
        15,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '8eb9ec5c-2d94-4ed1-9a3d-1dd8942d6aab',
        3,
        'COMPUTER_SCIENCE_RELATED',
        4,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '030e01f6-abe7-49d0-8036-4772ef5cdfa5',
        3,
        'AGRICULTURE_RELATED',
        37,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '63c7170e-0b31-41fc-a5d0-2accc97bd048',
        3,
        'BEUATICIAN_RELATED',
        5,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '17f6ad9e-f81a-4a21-b5c6-d14b02d34d13',
        3,
        'JWELLERY_MAKING_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '056d10b9-5ed7-4cdb-8d95-13b857a06de6',
        3,
        'PRINTING_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'a48dcb94-e4c5-4cf5-8d99-c18a3e82258d',
        3,
        'LAND_SURVEY_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'b107987f-a1de-44d0-af10-b88d7561f783',
        3,
        'SHOEMAKING_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '77781afe-2522-4e41-ae54-10cc853e378d',
        3,
        'ANIMAL_HEALTH_RELATED',
        8,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '3da05e4b-e74d-4c27-b404-4f0f492cb08f',
        3,
        'SEWING_RELATED',
        32,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'fd06c7cf-9352-417c-b27f-c34d6294d463',
        3,
        'PLUMBING',
        10,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '5a9bf1a9-a485-426f-ae06-a17723ca0134',
        3,
        'FURNITURE_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'cebea002-f8f0-43df-94e8-8081d2206e12',
        3,
        'ELECTRICITY_INSTALLMENT_RELATED',
        8,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '15eae3d5-6ce5-4001-ab76-a22e6e33edf5',
        3,
        'HUMAN_HEALTH_RELATED',
        11,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '3f4229dd-5583-441a-8299-9326320beac8',
        3,
        'MECHANICS_RELATED',
        4,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'a043d135-5faf-4b8a-b7c3-6bfa904817e9',
        3,
        'TEACHING_RELATED',
        23,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'ebd4f53f-5434-4bdb-80f1-2a33abac2b1c',
        3,
        'PHOTOGRAPHY_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '86117010-4f15-41f7-83db-2f65fe61b0fa',
        3,
        'DRIVING_RELATED',
        46,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '167e119a-1926-4611-bc23-1b4049e518fd',
        3,
        'CARPENTERY_RELATED',
        27,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '40cf5761-ca5c-4054-9a3a-ebf312580c37',
        3,
        'HANDICRAFT_RELATED',
        7,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '0fcdf0e7-d3d8-49fc-86c7-0e1f9ecae358',
        3,
        'HOTEL_RESTAURANT_RELATED',
        40,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '87d8bab7-f890-4672-929a-bb7e8aae58da',
        4,
        'AGRICULTURE_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'df344ad2-f613-4bdb-8a41-08d533ecf67e',
        4,
        'ANIMAL_HEALTH_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '3b817eb6-765c-4e92-b13e-a44996ba1208',
        4,
        'SEWING_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'ef60fdeb-9773-450d-af72-579c7aed6006',
        4,
        'HUMAN_HEALTH_RELATED',
        4,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '0de5a11b-c852-474a-bfc9-b2f1db9f6f88',
        4,
        'TEACHING_RELATED',
        9,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'de9ae9ac-5123-45af-a6dc-492c1f52d700',
        4,
        'DRIVING_RELATED',
        5,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '4b475564-6db7-4d82-9b8e-54c1f179f0d1',
        4,
        'CARPENTERY_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'c684a348-6e66-40a8-b165-41d4b8af4f0a',
        5,
        'SELF_PROTECTION_RELATED',
        6,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '0851a5ac-4f20-4805-8fd2-9f854a439894',
        5,
        'COMPUTER_SCIENCE_RELATED',
        10,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '51b35e2c-a257-45ea-81fb-d8738d92fb22',
        5,
        'AGRICULTURE_RELATED',
        43,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'dc4d6cb5-ee20-42fb-bcd7-9dd84bc6586b',
        5,
        'BEUATICIAN_RELATED',
        9,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '67405d75-bdef-4198-81a8-0a4967e051ce',
        5,
        'JWELLERY_MAKING_RELATED',
        6,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '1c79da04-58b3-40dc-b1fc-fa2b1c10b365',
        5,
        'MUSIC_DRAMA_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '190a0e1b-d00b-4d18-b73e-738cd7b18103',
        5,
        'LAND_SURVEY_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '4b57bef6-fdaf-4265-8921-7aefd67f5f90',
        5,
        'ANIMAL_HEALTH_RELATED',
        10,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'e0512e4f-1adb-44aa-a01f-5db30669bedb',
        5,
        'SEWING_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'fe83a7b4-2075-48bd-afef-706c1bd7fa9b',
        5,
        'PLUMBING',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '8381b797-f3b5-4e8e-9765-fb9001d44112',
        5,
        'FURNITURE_RELATED',
        5,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'e9379f43-c6de-4f85-a8c7-03bb7d4227fc',
        5,
        'ELECTRICITY_INSTALLMENT_RELATED',
        12,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '8a0a98db-8bdc-4e9d-9d7b-486b1ec299a1',
        5,
        'HUMAN_HEALTH_RELATED',
        4,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '96022f67-b2ea-48ec-bdfb-c1dd3126bfa1',
        5,
        'STONEWORK_WOODWORK',
        6,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'd38dbf65-1e56-4d3a-9b8c-95b820fccaeb',
        5,
        'MECHANICS_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '35d2ba88-571b-495e-8d05-1fb6be0dddc5',
        5,
        'RADIO_TELEVISION_ELECTRICAL_REPAIR',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '4597023a-0c04-4682-ab2d-316261351b03',
        5,
        'TEACHING_RELATED',
        47,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '1576f789-f0b1-4af5-8a4c-ee07cbca047a',
        5,
        'DRIVING_RELATED',
        35,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '8951774e-a7fd-4973-903a-1631873b5e76',
        5,
        'CARPENTERY_RELATED',
        11,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '053d499d-4f1b-4003-9afc-7f8afc1c2e5d',
        5,
        'HANDICRAFT_RELATED',
        4,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '99a7b9b5-eef1-4e9c-aff6-e12e59d917ce',
        5,
        'HOTEL_RESTAURANT_RELATED',
        19,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'd30cc85a-2c55-4b51-8e6b-dbe92e86ba60',
        6,
        'SELF_PROTECTION_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'a894d362-1f3b-4cd6-af48-db68fa0345e1',
        6,
        'ENGINEERING_DESIGN_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'e800df4e-2fc0-4c58-a427-6b511c787924',
        6,
        'COMPUTER_SCIENCE_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '8baf2aab-4422-4bc0-97ce-53cac4421d25',
        6,
        'AGRICULTURE_RELATED',
        34,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'aca58d5d-4522-41fb-8745-191d092eb5cf',
        6,
        'BEUATICIAN_RELATED',
        11,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '27e3a0ef-84a4-4c18-a6b0-1d4d37695ec4',
        6,
        'JWELLERY_MAKING_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '8da65762-95d4-48f7-be90-dfd9bd416beb',
        6,
        'MUSIC_DRAMA_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '97558f63-a8f6-4373-9a73-4c83cbf9448d',
        6,
        'ANIMAL_HEALTH_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'c111c6ee-2476-4cf6-9ccb-de5f0a4ba3da',
        6,
        'SEWING_RELATED',
        34,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '4cab696f-ee6e-4f19-999a-0cfccc905cd4',
        6,
        'PLUMBING',
        4,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '9ab925c2-5153-475f-b2e3-b313ba3132b1',
        6,
        'FURNITURE_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '9e568519-ed93-47ef-ac95-5e5828186752',
        6,
        'ELECTRICITY_INSTALLMENT_RELATED',
        19,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'b82f34eb-3946-4505-972b-6973f11891dc',
        6,
        'HUMAN_HEALTH_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'ef70b47b-2653-486c-9ce3-6c88d40349d4',
        6,
        'MECHANICS_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '09c8f0a5-3273-4695-b6a8-9394ff329c12',
        6,
        'TEACHING_RELATED',
        16,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'ff541d0e-ad86-4a07-877e-607a6e1570fb',
        6,
        'DRIVING_RELATED',
        56,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'df934e3e-8b12-477a-8626-e8f5d5975887',
        6,
        'CARPENTERY_RELATED',
        16,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'b3fa89d5-c0eb-4c1f-91b1-b02b1d85345d',
        6,
        'HOTEL_RESTAURANT_RELATED',
        21,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'a7b995fe-ca43-45ff-8589-9d618255f8ba',
        7,
        'SELF_PROTECTION_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'b0d6a4ab-fbb0-4cd9-b3f1-8ddd1b506ec9',
        7,
        'COMPUTER_SCIENCE_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'b4c6bc88-08ab-4220-8172-ca233ae287cd',
        7,
        'BEUATICIAN_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '04c9e986-9195-4085-a70f-cdd8737295f1',
        7,
        'ANIMAL_HEALTH_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'e03a2ff3-2975-43fe-9289-f1e53b311a09',
        7,
        'SEWING_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '87c4c9c5-108f-46f9-ad6d-8425007916c7',
        7,
        'HUMAN_HEALTH_RELATED',
        6,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'f64fc28d-a562-4fe0-8186-8e7e0680831e',
        7,
        'MECHANICS_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'c345c93c-f6fa-4412-9df9-942ced72601c',
        7,
        'TEACHING_RELATED',
        14,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '9a961a54-7ddf-4d3e-81ce-2d539d80e652',
        7,
        'PHOTOGRAPHY_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '094149b1-0aa8-45fc-be31-9b713fef0f27',
        7,
        'DRIVING_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'f1af3532-165a-401b-82fd-e22034036145',
        7,
        'HOTEL_RESTAURANT_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'a3db81f1-0ce4-4da5-a430-9b7b71d8a9c7',
        8,
        'ENGINEERING_DESIGN_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'aea3d957-72e4-4cb7-9325-9909901a20a4',
        8,
        'COMPUTER_SCIENCE_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '29f3130d-6aec-4cc5-87d1-44d0af6679bc',
        8,
        'AGRICULTURE_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'd83a38fb-e127-48b1-9f33-ce2153fa1162',
        8,
        'BEUATICIAN_RELATED',
        12,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '9e2f4e88-c64c-4a1d-8f58-bc925cc8843c',
        8,
        'JWELLERY_MAKING_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '2abba0bb-e929-4f5a-a247-5455dcf7630e',
        8,
        'MUSIC_DRAMA_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '7ac991b7-17e6-4831-bd8b-e2279287a81f',
        8,
        'ANIMAL_HEALTH_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '1ba6cb0b-b717-4bab-b7e2-dcc43f724499',
        8,
        'SEWING_RELATED',
        8,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '9ef94a6c-051b-4d10-a459-70f91a794ca4',
        8,
        'FURNITURE_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '0cf7361c-b37d-4ac8-a11b-aabaee68598a',
        8,
        'ELECTRICITY_INSTALLMENT_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'acefa039-8ef8-45b4-8e50-9376e2a5cbd6',
        8,
        'HUMAN_HEALTH_RELATED',
        9,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '82fa730d-9d75-44d5-ab00-33baa04793c4',
        8,
        'STONEWORK_WOODWORK',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '3d26c293-6d70-4622-9fa3-ffddd9fd5a48',
        8,
        'RADIO_TELEVISION_ELECTRICAL_REPAIR',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '642cfe91-da39-4f2c-8f44-5b880bb97795',
        8,
        'TEACHING_RELATED',
        24,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '5581cb6c-a8f5-4460-86a3-da2d06445a31',
        8,
        'DRIVING_RELATED',
        15,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '3592e988-259c-4709-afc0-31e66caa5bd0',
        8,
        'LITERARY_CREATION_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'd084b191-089b-4aa6-b672-529bbb3e8793',
        8,
        'CARPENTERY_RELATED',
        10,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '1cbc0d28-69b4-4e1f-91ae-0adc5b5b6d1b',
        8,
        'HANDICRAFT_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'daad1a8b-cee7-4041-8b5c-0d02aef3d27b',
        8,
        'HOTEL_RESTAURANT_RELATED',
        12,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'a6d30b77-bfe0-47a1-87fa-db67ae3de812',
        9,
        'SELF_PROTECTION_RELATED',
        11,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'bad9c77e-8a81-4516-9261-bbf86498b9d7',
        9,
        'ENGINEERING_DESIGN_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'bdff1ad4-41fe-470e-a318-9cf5f4899290',
        9,
        'COMPUTER_SCIENCE_RELATED',
        15,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '77b8fd80-3b41-4c26-9225-cfca9d921be0',
        9,
        'AGRICULTURE_RELATED',
        38,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '5798dfae-2fdb-4434-924b-8225e831bb19',
        9,
        'BEUATICIAN_RELATED',
        21,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'd554d26b-cf8c-490c-a71a-8101960ad756',
        9,
        'JWELLERY_MAKING_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '32c8a93c-7945-4aab-9a9e-b8f32383f79a',
        9,
        'MUSIC_DRAMA_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'c6e6284f-d4c8-4986-a8e7-aaa1f147c47f',
        9,
        'PRINTING_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '9a3b749a-9ba0-4eb2-9b2a-9e2f525e5dcb',
        9,
        'ANIMAL_HEALTH_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '326d6ebf-9630-46d5-afb1-00a822317ee2',
        9,
        'SEWING_RELATED',
        48,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'fa7f9dbc-dd05-4337-9709-0a6cd3905765',
        9,
        'PLUMBING',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'a08e035a-e587-467e-a2b7-8ba2cf1d21b6',
        9,
        'FURNITURE_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '87d929e2-d09f-40d6-8551-8248f35982f0',
        9,
        'ELECTRICITY_INSTALLMENT_RELATED',
        22,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '539dd0b4-1768-469e-b381-616955f2825e',
        9,
        'HUMAN_HEALTH_RELATED',
        28,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'ae35c1e5-2a5c-45dd-a6fb-97df8b22e7c2',
        9,
        'STONEWORK_WOODWORK',
        6,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '9abd3873-096d-4883-9625-0c0b6863b571',
        9,
        'MECHANICS_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '3dcebbcf-0102-4ef2-a244-bd652259fdf5',
        9,
        'RADIO_TELEVISION_ELECTRICAL_REPAIR',
        5,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'ea350b58-b613-4414-80a9-c7874e2255ce',
        9,
        'TEACHING_RELATED',
        99,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '7445b775-234d-4a1d-bb5f-ed0b7fd971af',
        9,
        'PHOTOGRAPHY_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'aba74e69-f386-4cf5-af2c-0602b9751c1d',
        9,
        'DRIVING_RELATED',
        70,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '63c4204e-0d5a-4a7d-9920-8311a8451ebb',
        9,
        'CARPENTERY_RELATED',
        15,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '7ca84e14-3a0c-4668-ae2a-db26773faadd',
        9,
        'HANDICRAFT_RELATED',
        5,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '4cf43261-b146-48b2-839c-6509917e9c88',
        9,
        'HOTEL_RESTAURANT_RELATED',
        34,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '7f967c77-94a6-4fc6-83a8-73808f1478ee',
        10,
        'SELF_PROTECTION_RELATED',
        4,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'db89787f-8baa-4ac1-9bc3-1c78c63bdb0d',
        10,
        'ENGINEERING_DESIGN_RELATED',
        5,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '4ea63a96-87f0-4f73-91bb-d626a3ee23f8',
        10,
        'COMPUTER_SCIENCE_RELATED',
        10,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'a9b1205f-f02e-4c90-bcca-8b6feb3603db',
        10,
        'AGRICULTURE_RELATED',
        10,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'b1379fa7-0fde-462f-b85d-c88d95dddce9',
        10,
        'BEUATICIAN_RELATED',
        23,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '5bad5e1d-18ed-4fd7-adc6-ba62c9c7fdf6',
        10,
        'JWELLERY_MAKING_RELATED',
        5,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'e8c63273-4466-4077-b5f8-c059f6ff63eb',
        10,
        'MUSIC_DRAMA_RELATED',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '09b17f23-735e-4a41-94e2-94d678b5ef84',
        10,
        'ANIMAL_HEALTH_RELATED',
        8,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '85ebb4fa-abb0-436d-8b93-b15ed51e7f69',
        10,
        'SEWING_RELATED',
        44,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '31d5fb47-fd6d-4eb8-b722-199d14dc912f',
        10,
        'PLUMBING',
        2,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '8cd6aaa2-1d5c-409f-af4e-5ebcb0eb9c30',
        10,
        'FURNITURE_RELATED',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'bda5488b-3eb3-4c84-8c21-b1aeb8482606',
        10,
        'ELECTRICITY_INSTALLMENT_RELATED',
        3,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '6480fe6f-6ee9-435e-8ab0-f33711697b8f',
        10,
        'HUMAN_HEALTH_RELATED',
        21,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '1d1aeb38-1497-4e14-8504-c3ad87fa3694',
        10,
        'RADIO_TELEVISION_ELECTRICAL_REPAIR',
        1,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'bbfb9206-de5d-4431-8d39-8df7d0bcea74',
        10,
        'TEACHING_RELATED',
        57,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '071dcc53-a564-4537-9ab3-6336f86d632c',
        10,
        'DRIVING_RELATED',
        50,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        'b4b16867-81a5-46d9-8fa7-f7217ee60ed4',
        10,
        'CARPENTERY_RELATED',
        15,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '6c2d1fc2-3ad3-4b54-87ac-f09008ac9866',
        10,
        'HANDICRAFT_RELATED',
        9,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    INSERT INTO acme_ward_wise_major_skills 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '97273e79-fc74-457b-bbcd-ed2a71df0606',
        10,
        'HOTEL_RESTAURANT_RELATED',
        29,
        '2025-06-30 12:14:59',
        '2025-06-30 12:14:59'
    );
    

    END IF;
END
$$;

