-- Generated SQL script
-- Date: 2025-06-30 12:45:34


-- Check if acme_ward_wise_school_dropout table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = 'acme_ward_wise_school_dropout'
    ) THEN
        CREATE TABLE acme_ward_wise_school_dropout (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            cause VARCHAR(100) NOT NULL,
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
    IF NOT EXISTS (SELECT 1 FROM acme_ward_wise_school_dropout) THEN


    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '2a7dd03f-af60-4f8a-b05f-e45438a024cb',
        1,
        'EMPLOYMENT',
        20,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'e1c6249b-626b-40da-8fd2-f9ede23d9a2b',
        1,
        'FAR',
        37,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '6bbfcec1-1357-463d-817b-2387940122d1',
        1,
        'HOUSE_HELP',
        52,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '0bab27d5-17a2-4155-a824-d7faceab809b',
        1,
        'MARRIAGE',
        112,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'a0f22f24-6b7f-40b8-a656-fd01f0ac4091',
        1,
        'OTHER',
        45,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '8aee21fb-4ed5-46b6-a0f1-981a98dd4d9b',
        1,
        'UNKNOWN',
        39,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '5845ddcf-a5e8-490f-ab8c-ddd61119f200',
        2,
        'EMPLOYMENT',
        15,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '37ab4841-2969-435d-9ffd-4f85ce2e5e65',
        2,
        'FAR',
        8,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'e1d6a58c-f81e-4ab9-a2c0-9ab46a21dff5',
        2,
        'HOUSE_HELP',
        61,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '212358f5-e1d8-4f5f-9df2-f4fd18dca85d',
        2,
        'LIMITED_SPACE',
        12,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '6350137f-50c8-47ec-af01-e5258ebb59fd',
        2,
        'MARRIAGE',
        92,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'aaade89f-1d3b-40a7-ae57-fb1317da4c2c',
        2,
        'OTHER',
        24,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '3aab2dbc-9e36-4468-a53c-aa6dd4d4422d',
        2,
        'UNKNOWN',
        1478,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'e46614ce-e260-4a44-8a1e-d9de3e42e3c6',
        2,
        'WANTED_STUDY_COMPLETED',
        11,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '50306549-a9b3-4d96-96c8-0d87b8ca59d9',
        3,
        'EMPLOYMENT',
        34,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '41aabd0e-0b69-40b6-9117-ca1e09a3444a',
        3,
        'EXPENSIVE',
        5,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'e51ea046-d56b-4c16-a109-2517b9b4daef',
        3,
        'FAR',
        74,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '14c5c104-c821-41c6-bc49-f82d93daee07',
        3,
        'HOUSE_HELP',
        9,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '9e69f244-e90d-400f-8a37-15c5bd5a3245',
        3,
        'MARRIAGE',
        149,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'd6397a61-5cc6-42b6-b2ce-8c4ec3b8e177',
        3,
        'OTHER',
        166,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '58afbf87-39c8-4b25-9d46-eaa4c2528bb0',
        3,
        'UNKNOWN',
        480,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '4695852e-4f8e-4e75-ad11-165622895fcd',
        3,
        'WANTED_STUDY_COMPLETED',
        17,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '78abf67c-4e08-436d-bb2a-4ce74da0b7a3',
        4,
        'EMPLOYMENT',
        11,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '7583f93e-b853-46c6-b465-64ee111332fb',
        4,
        'EXPENSIVE',
        1,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'efc82a99-5c07-423f-be67-33daa779d69c',
        4,
        'FAR',
        17,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'a8035688-36b2-4761-aaa8-6dc7e77b0143',
        4,
        'HOUSE_HELP',
        2,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'b9821f6b-84d2-41aa-8ebc-51c3de228e2a',
        4,
        'MARRIAGE',
        62,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '73c7a186-2720-4488-9012-885029b42cab',
        4,
        'OTHER',
        3,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '87b60b76-a0eb-48b7-b973-8d6ae5cef8cf',
        4,
        'UNKNOWN',
        154,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '351a0f35-682a-4c16-b828-38f9e6bb438a',
        4,
        'UNWILLING_PARENTS',
        3,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '85417067-8922-449e-bc9b-03b404b57ae2',
        4,
        'WANTED_STUDY_COMPLETED',
        126,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'e4081e52-1a2b-44fe-b6bc-b1b7be5a5403',
        5,
        'EMPLOYMENT',
        121,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'd0f037e1-5133-48e5-8a33-b1ca19504895',
        5,
        'EXPENSIVE',
        8,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'fcb5dd29-6706-4140-a04c-9fc2c96b6ada',
        5,
        'FAR',
        4,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '5ece6a83-d411-40a6-b44a-8b070e0987b6',
        5,
        'HOUSE_HELP',
        33,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '36408461-0ad4-4e1a-a330-e8e3d3b71bce',
        5,
        'LIMITED_SPACE',
        1,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'f8c62f00-b366-40c1-8186-f22fdcaeee07',
        5,
        'MARRIAGE',
        161,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '3581a4f3-34f9-40c8-bd34-7b95c69c4862',
        5,
        'OTHER',
        55,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'b11265c2-5fd6-4e3d-ae17-bc3ce2874d5f',
        5,
        'UNKNOWN',
        50,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '0aa75670-2130-4f88-83a6-9044828e7408',
        5,
        'UNWILLING_PARENTS',
        3,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '86134857-cf33-4c75-a7d2-fc44dc4bed84',
        5,
        'WANTED_STUDY_COMPLETED',
        94,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '1ba7037a-a4a0-4738-9c8f-01db8fab2c2b',
        6,
        'EMPLOYMENT',
        43,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '53c955ed-952a-4611-a542-255886c466dd',
        6,
        'EXPENSIVE',
        19,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '3b20f481-b6b3-4088-b3bd-8bee500fce75',
        6,
        'FAR',
        5,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '972612c5-e608-4574-80ab-16b2f7caceed',
        6,
        'HOUSE_HELP',
        32,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '052dd129-37d5-46dc-9eaf-8897931c2767',
        6,
        'MARRIAGE',
        131,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'dcd6b986-4438-4547-88d1-0755cd9d6d94',
        6,
        'OTHER',
        222,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'a2b6958c-9113-41b1-88aa-da1f0f61a807',
        6,
        'UNKNOWN',
        152,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '0bc7c109-b02d-472d-8803-1a0eb072819a',
        6,
        'UNWILLING_PARENTS',
        2,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'f2d29de2-db4d-4108-9388-888e5edea956',
        6,
        'WANTED_STUDY_COMPLETED',
        87,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'dd7dba21-fa9c-4974-8a99-af28c363f5db',
        7,
        'EMPLOYMENT',
        41,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'd96be7c2-b50d-451a-bc5b-ae8190a6977f',
        7,
        'EXPENSIVE',
        9,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'ec588d25-9d67-46f3-9dad-61e05b4f54eb',
        7,
        'FAR',
        4,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'b4d3f9dc-47db-47ca-a278-4c4a77466889',
        7,
        'HOUSE_HELP',
        93,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '10d5ff7a-fb27-492b-8599-f042153dec2f',
        7,
        'MARRIAGE',
        169,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '33ba02f8-07f6-407c-a4b2-f8037ddf18b8',
        7,
        'OTHER',
        12,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '41f69e86-db21-4d6f-bd28-ab271fca6ffe',
        7,
        'UNKNOWN',
        397,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'cc638e7b-a9fe-4f47-b712-eb36bc2e97c3',
        7,
        'UNWILLING_PARENTS',
        1,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '4dbb6ca7-a66e-41bf-a954-c2fda1566707',
        7,
        'WANTED_STUDY_COMPLETED',
        86,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '87793ab5-4f98-4d91-9d28-81b2de54911d',
        8,
        'EMPLOYMENT',
        38,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'b5d59c84-6780-4213-b70a-36d607219237',
        8,
        'HOUSE_HELP',
        23,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'fa5ef5b6-7614-4eb5-aab1-75a116110d2b',
        8,
        'LIMITED_SPACE',
        4,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'b7998ac5-71d3-483f-bb6e-62f18c7c393d',
        8,
        'MARRIAGE',
        145,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '905bc66c-97ea-4fcb-b62a-afc1e1883a5f',
        8,
        'OTHER',
        228,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '735c40ba-a8b5-4f68-951f-4555429ecd00',
        8,
        'UNKNOWN',
        1513,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'bbeb39e1-7dd3-4837-ab72-d00cd9121636',
        8,
        'WANTED_STUDY_COMPLETED',
        14,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'cc43fa28-9ab4-4926-ab0f-5e6a5f3318c4',
        9,
        'EMPLOYMENT',
        37,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'adc1a39d-bac4-42f3-8bf7-53d4d19a3b8e',
        9,
        'EXPENSIVE',
        49,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'b85c1cc3-119e-456c-a15c-afdc562d5ba4',
        9,
        'FAR',
        7,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'e1cfaea4-cbf0-4de6-ad75-248d1451e520',
        9,
        'HOUSE_HELP',
        9,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'e5e64696-25b8-4bb3-a2bb-485773d02cdf',
        9,
        'LIMITED_SPACE',
        2,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'd4044331-8fc7-48fd-847b-2152302360b7',
        9,
        'MARRIAGE',
        156,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '4f72eda1-ecc9-46ee-ba38-90e2f1724c01',
        9,
        'OTHER',
        102,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'd9324811-5e4f-4bcd-921d-755da3bb2080',
        9,
        'UNKNOWN',
        225,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '016cca9d-4f5b-4bd2-9542-567eb31a391e',
        9,
        'UNWILLING_PARENTS',
        3,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '9d58c20b-4224-4b97-b2a7-b44c1ad11de6',
        9,
        'WANTED_STUDY_COMPLETED',
        231,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '672a9702-f889-4146-826a-fab8d0b1a6ae',
        10,
        'EMPLOYMENT',
        15,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '6350c995-eefc-46e3-8180-9ba6e72ad702',
        10,
        'EXPENSIVE',
        7,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'dd0a919f-1ed7-4a4e-b507-17870997fbb1',
        10,
        'FAR',
        2,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'e863d0ec-0754-482c-bd12-c36892a822a9',
        10,
        'HOUSE_HELP',
        27,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '300a4b9b-6294-4514-ad91-a7e055ca5a7f',
        10,
        'LIMITED_SPACE',
        2,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'e8fa7df0-2484-4501-8326-aa3ccee73f26',
        10,
        'MARRIAGE',
        99,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'f56b9297-0a53-4e91-aebc-6f9fe5d60139',
        10,
        'OTHER',
        95,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'c432719a-2f13-4306-a100-ff236268b542',
        10,
        'UNKNOWN',
        18,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '0949e75d-805d-47ea-bdee-39a558f4a15c',
        10,
        'UNWILLING_PARENTS',
        1,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    INSERT INTO acme_ward_wise_school_dropout 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        'b58df2b5-09db-4814-bbe8-d435a4d880d2',
        10,
        'WANTED_STUDY_COMPLETED',
        139,
        '2025-06-30 12:45:34',
        '2025-06-30 12:45:34'
    );
    

    END IF;
END
$$;

