-- Generated SQL script
-- Date: 2025-06-30 11:27:31


CREATE TABLE IF NOT EXISTS acme_ward_time_series_population (
    id                      varchar(36) not null primary key,
    ward_number             integer     not null,
    ward_name               text,
    year                    integer     not null,
    total_population        integer,
    male_population         integer,
    female_population       integer,
    other_population        integer,
    total_households        integer,
    average_household_size  numeric,
    population_0_to_14      integer,
    population_15_to_59     integer,
    population_60_and_above integer,
    literacy_rate           numeric,
    male_literacy_rate      numeric,
    female_literacy_rate    numeric,
    growth_rate             numeric,
    area_sq_km              numeric,
    population_density      numeric,
    sex_ratio               numeric,
    updated_at              timestamp default CURRENT_TIMESTAMP,
    created_at              timestamp default CURRENT_TIMESTAMP
);
ALTER TABLE acme_ward_time_series_population OWNER TO postgres;

TRUNCATE TABLE acme_ward_time_series_population;

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'f3fcb438-aac9-45c5-9ffc-cb54dacdd581', 1, 'पाटीगाउँ(१-९)', 2078,
        1994, 973, 1021, NULL,
        476, 4.19, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 29.83, 66.85, 95.3,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'f48ef191-cce3-4d32-9d74-d3c5945fb598', 2, 'सिंहदेवी(१-९)', 2078,
        2192, 1063, 1129, NULL,
        562, 3.9, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 24.78, 88.46, 94.15,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '1230108d-7385-4b92-a2df-afdc12f8d77b', 3, 'लेटाङभोगटेनी (१) र केराबारी(४)', 2078,
        3390, 1647, 1743, NULL,
        812, 4.17, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 29.73, 114.03, 94.49,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'f9c11c30-1723-430c-afe7-3712c5360ba2', 4, 'याङशिला(१-४,६,७)', 2078,
        1682, 838, 844, NULL,
        415, 4.05, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 19.56, 85.99, 99.29,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'b049a325-6e07-4a5f-9d4b-daaa357567d5', 5, 'याङशिला(५,८)', 2078,
        3892, 1839, 2053, NULL,
        944, 4.12, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 34.32, 113.4, 89.58,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'c5edc7d9-7ae3-40d9-a455-6a8df93594eb', 6, 'केराबारी (७) र याङशिला(९)', 2078,
        3991, 1924, 2067, NULL,
        982, 4.06, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 34.96, 114.16, 93.08,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'e9f747bd-ccf8-4b6a-bd85-d671be5e0aca', 7, 'केराबारी(६,८)', 2078,
        4169, 1967, 2202, NULL,
        1034, 4.03, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 36.29, 114.88, 89.33,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '13b93a8c-5f04-41df-a081-eff8276a4b8f', 8, 'केराबारी(२,५)', 2078,
        4088, 1925, 2163, NULL,
        1041, 3.93, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 29.49, 138.62, 89.0,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'd815a3a1-9ff2-4ae9-a1aa-2047921d6b46', 9, 'केराबारी(९)', 2078,
        5564, 2576, 2988, NULL,
        1401, 3.97, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 47.64, 116.79, 86.21,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '086211f9-11b9-4b14-8957-8230790e981c', 10, 'केराबारी(१,३)', 2078,
        3542, 1663, 1879, NULL,
        906, 3.91, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, 26.59, 133.21, 88.5,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '81e471c2-e198-4979-99ed-219a1f481c7d', 1, 'पाटीगाउँ(१-९)', 2081,
        2136, 1087, 1049, 0.0,
        489, 4.37, 470.0, 1406.0, 260.0,
        80.1, 84.55, 75.47, 2.32, 29.83, 71.61, 103.62,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'fc108dd1-be20-414c-99e3-a302ee513558', 2, 'सिंहदेवी(१-९)', 2081,
        2253, 1093, 1160, 0.0,
        578, 3.9, 440.0, 1521.0, 292.0,
        94.69, 96.7, 93.02, 0.92, 24.78, 90.92, 94.22,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '8174fdee-33dd-4b80-b995-5ab2379892f3', 3, 'लेटाङभोगटेनी (१) र केराबारी(४)', 2081,
        3489, 1693, 1792, 4.0,
        836, 4.17, 756.0, 2337.0, 396.0,
        84.91, 89.95, 80.38, 0.96, 29.73, 117.36, 94.48,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '7abf7bc1-60f0-4efb-996c-fd612d8eb8fc', 4, 'याङशिला(१-४,६,७)', 2081,
        1729, 861, 868, 0.0,
        427, 4.05, 402.0, 1122.0, 205.0,
        74.94, 78.46, 71.39, 0.92, 19.56, 88.39, 99.19,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '0f027b91-f713-4934-ad50-62ea1f1f9e00', 5, 'याङशिला(५,८)', 2081,
        4193, 2083, 2110, 0.0,
        1028, 4.08, 803.0, 2912.0, 478.0,
        87.04, 91.48, 82.71, 2.51, 34.32, 122.17, 98.72,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '4e1f5b77-35ef-45c0-a62d-4a0cccc7d84d', 6, 'केराबारी (७) र याङशिला(९)', 2081,
        4138, 2005, 2125, 8.0,
        1000, 4.14, 876.0, 2748.0, 514.0,
        72.29, 76.95, 67.93, 1.21, 34.96, 118.36, 94.35,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '6f506b93-3281-4c4d-9e9f-22afa115e2e1', 7, 'केराबारी(६,८)', 2081,
        4285, 2022, 2263, 0.0,
        986, 4.35, 856.0, 2857.0, 572.0,
        84.46, 86.42, 82.75, 0.92, 36.29, 118.08, 89.35,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'e5c9c3de-033b-4e45-bba6-51681fe4b258', 8, 'केराबारी(२,५)', 2081,
        4202, 1979, 2223, 0.0,
        1108, 3.79, 743.0, 2722.0, 737.0,
        87.43, 90.22, 84.96, 0.92, 29.49, 142.49, 89.02,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        '6a4f022e-13ad-41f8-bc33-f6e1f83eacfa', 9, 'केराबारी(९)', 2081,
        5923, 2847, 3071, 5.0,
        1480, 4.0, 1183.0, 3979.0, 761.0,
        85.7, 91.29, 80.61, 2.11, 47.64, 124.33, 92.71,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    

    INSERT INTO acme_ward_time_series_population (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        'cf307bb9-c82b-4c77-a71c-5758c50218b6', 10, 'केराबारी(१,३)', 2081,
        3834, 1903, 1931, 0.0,
        932, 4.11, 776.0, 2634.0, 424.0,
        86.77, 92.6, 81.02, 2.68, 26.59, 144.19, 98.55,
        '2025-06-30 11:27:31', '2025-06-30 11:27:31'
    );
    
-- End of script

