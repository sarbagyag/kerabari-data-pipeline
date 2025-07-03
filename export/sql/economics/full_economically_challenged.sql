-- SQL to extract all households with severity scoring and category
-- This query uses the correct schema and table names as provided

CREATE TABLE IF NOT EXISTS full_economically_challenged_population AS
SELECT
    f.id AS family_id,
    f.ward_no,
    f.head_name,
    f.locality,
    f.head_phone AS family_head_phone_number,
    f.total_members,
    i.gender AS head_gender,
    i.age AS head_age,
    i.caste,
    -- Marginalized caste
    CASE WHEN i.caste IN ('दलित', 'जनजाति', 'मुस्लिम', 'थारु', 'मगर', 'गुरुङ', 'तमाङ', 'नेवार', 'राई', 'लिम्बु', 'अन्य (खुलाउने)') THEN TRUE ELSE FALSE END AS marginalized_caste,
    b.land_ownership AS land_ownership,
    b.base AS house_base,
    b.outer_wall AS house_outer_wall,
    b.roof AS house_roof,
    f.facilities AS facilities,
    f.income_sources,
    f.has_remittance,
    f.remittance_expenses,
    (CASE WHEN f.loaned_organizations IS NOT NULL AND array_length(f.loaned_organizations, 1) > 0 THEN TRUE ELSE FALSE END) AS has_loan,
    f.loan_use,
    (CASE WHEN f.has_bank IS NOT NULL AND array_length(f.has_bank, 1) > 0 THEN TRUE ELSE FALSE END) AS has_bank,
    (CASE WHEN f.has_insurance IN ('yes', 'हो', 'छ') THEN TRUE ELSE FALSE END) AS has_insurance,
    f.primary_cooking_fuel,
    f.primary_energy_source,
    f.toilet_type,
    f.water_source,
    f.female_properties,
    f.head_phone AS phone_number,
    f.building_token,
    -- Severity score calculation (mimicking Python logic, simplified for SQL)
    (
        -- Land ownership (no_land)
        CASE WHEN b.land_ownership IS NULL OR b.land_ownership != 'निजी' THEN 2 ELSE 0 END +
        -- House base (poor_house_base)
        CASE WHEN b.base IN ('माटोको जोडाइ भएको इँटा/ढुङ्गा', 'काठको खम्बा गाडेको', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
        -- Outer wall (poor_outer_wall)
        CASE WHEN b.outer_wall IN ('माटोको जोडाइ भएको इँटा/ढुङ्गा', 'काँचो इँटा', 'जस्ता/टिन/च्यादर', 'बाँसजन्य सामग्री', 'काठ/फल्याक', 'प्रि फ्याब', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
        -- Roof (poor_roof)
        CASE WHEN b.roof IN ('जस्ता/टिन', 'खर/पराल/छ्वाली', 'काठ/फल्याक', 'ढुङ्गा/स्लेट', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
        -- Facilities (no_facilities/few_facilities)
        CASE WHEN (f.facilities IS NULL OR array_length(f.facilities, 1) IS NULL OR f.facilities @> ARRAY['माथिका कुनै पनि नभएको ']) THEN 2 ELSE 0 END +
        CASE WHEN (f.facilities IS NOT NULL AND array_length(f.facilities, 1) < 3) THEN 1 ELSE 0 END +
        -- Income sources (no_income_source/only_labour_income)
        CASE WHEN (f.income_sources IS NULL OR array_length(f.income_sources, 1) IS NULL) THEN 3 ELSE 0 END +
        CASE WHEN (f.income_sources IS NOT NULL AND f.income_sources @> ARRAY['ज्याला मजदुरी'] AND array_length(f.income_sources, 1) = 1) THEN 2 ELSE 0 END +
        -- Remittance (no_remittance)
        CASE WHEN (f.has_remittance IS NULL OR f.has_remittance = FALSE) THEN 1 ELSE 0 END +
        -- Loan (has_loan)
        CASE WHEN (f.loaned_organizations IS NOT NULL AND array_length(f.loaned_organizations, 1) > 0) THEN 1 ELSE 0 END +
        -- Bank account (no_bank_account)
        CASE WHEN (f.has_bank IS NULL OR array_length(f.has_bank, 1) IS NULL) THEN 1 ELSE 0 END +
        -- Health insurance (no_health_insurance)
        CASE WHEN (f.has_insurance NOT IN ('yes', 'हो', 'छ')) THEN 1 ELSE 0 END +
        -- Toilet (lacks_toilet)
        CASE WHEN (f.toilet_type IS NULL OR f.toilet_type = '' OR f.toilet_type = 'अन्य') THEN 1 ELSE 0 END +
        -- Water (lacks_clean_water)
        CASE WHEN (f.water_source IS NULL OR array_length(f.water_source, 1) IS NULL) THEN 1 ELSE 0 END +
        -- Electricity (lacks_electricity)
        CASE WHEN (f.primary_energy_source IS NULL OR f.primary_energy_source = '' OR f.primary_energy_source = 'अन्य') THEN 1 ELSE 0 END +
        -- Marginalized caste
        CASE WHEN i.caste IN ('दलित', 'जनजाति', 'मुस्लिम', 'थारु', 'मगर', 'गुरुङ', 'तमाङ', 'नेवार', 'राई', 'लिम्बु', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END
        -- (Add more logic for female_headed, single_parent, elderly_only, children_only, education, skills, disability, chronic disease if you want to expand)
    ) AS severity_score,
    -- Severity category
    CASE
        WHEN (
            -- Repeat the same score logic as above
            CASE WHEN b.land_ownership IS NULL OR b.land_ownership != 'निजी' THEN 2 ELSE 0 END +
            CASE WHEN b.base IN ('माटोको जोडाइ भएको इँटा/ढुङ्गा', 'काठको खम्बा गाडेको', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
            CASE WHEN b.outer_wall IN ('माटोको जोडाइ भएको इँटा/ढुङ्गा', 'काँचो इँटा', 'जस्ता/टिन/च्यादर', 'बाँसजन्य सामग्री', 'काठ/फल्याक', 'प्रि फ्याब', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
            CASE WHEN b.roof IN ('जस्ता/टिन', 'खर/पराल/छ्वाली', 'काठ/फल्याक', 'ढुङ्गा/स्लेट', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
            CASE WHEN (f.facilities IS NULL OR array_length(f.facilities, 1) IS NULL OR f.facilities @> ARRAY['माथिका कुनै पनि नभएको ']) THEN 2 ELSE 0 END +
            CASE WHEN (f.facilities IS NOT NULL AND array_length(f.facilities, 1) < 3) THEN 1 ELSE 0 END +
            CASE WHEN (f.income_sources IS NULL OR array_length(f.income_sources, 1) IS NULL) THEN 3 ELSE 0 END +
            CASE WHEN (f.income_sources IS NOT NULL AND f.income_sources @> ARRAY['ज्याला मजदुरी'] AND array_length(f.income_sources, 1) = 1) THEN 2 ELSE 0 END +
            CASE WHEN (f.has_remittance IS NULL OR f.has_remittance = FALSE) THEN 1 ELSE 0 END +
            CASE WHEN (f.loaned_organizations IS NOT NULL AND array_length(f.loaned_organizations, 1) > 0) THEN 1 ELSE 0 END +
            CASE WHEN (f.has_bank IS NULL OR array_length(f.has_bank, 1) IS NULL) THEN 1 ELSE 0 END +
            CASE WHEN (f.has_insurance NOT IN ('yes', 'हो', 'छ')) THEN 1 ELSE 0 END +
            CASE WHEN (f.toilet_type IS NULL OR f.toilet_type = '' OR f.toilet_type = 'अन्य') THEN 1 ELSE 0 END +
            CASE WHEN (f.water_source IS NULL OR array_length(f.water_source, 1) IS NULL) THEN 1 ELSE 0 END +
            CASE WHEN (f.primary_energy_source IS NULL OR f.primary_energy_source = '' OR f.primary_energy_source = 'अन्य') THEN 1 ELSE 0 END +
            CASE WHEN i.caste IN ('दलित', 'जनजाति', 'मुस्लिम', 'थारु', 'मगर', 'गुरुङ', 'तमाङ', 'नेवार', 'राई', 'लिम्बु', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END
        ) >= 9 THEN 'Severely Challenged'
        WHEN (
            CASE WHEN b.land_ownership IS NULL OR b.land_ownership != 'निजी' THEN 2 ELSE 0 END +
            CASE WHEN b.base IN ('माटोको जोडाइ भएको इँटा/ढुङ्गा', 'काठको खम्बा गाडेको', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
            CASE WHEN b.outer_wall IN ('माटोको जोडाइ भएको इँटा/ढुङ्गा', 'काँचो इँटा', 'जस्ता/टिन/च्यादर', 'बाँसजन्य सामग्री', 'काठ/फल्याक', 'प्रि फ्याब', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
            CASE WHEN b.roof IN ('जस्ता/टिन', 'खर/पराल/छ्वाली', 'काठ/फल्याक', 'ढुङ्गा/स्लेट', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
            CASE WHEN (f.facilities IS NULL OR array_length(f.facilities, 1) IS NULL OR f.facilities @> ARRAY['माथिका कुनै पनि नभएको ']) THEN 2 ELSE 0 END +
            CASE WHEN (f.facilities IS NOT NULL AND array_length(f.facilities, 1) < 3) THEN 1 ELSE 0 END +
            CASE WHEN (f.income_sources IS NULL OR array_length(f.income_sources, 1) IS NULL) THEN 3 ELSE 0 END +
            CASE WHEN (f.income_sources IS NOT NULL AND f.income_sources @> ARRAY['ज्याला मजदुरी'] AND array_length(f.income_sources, 1) = 1) THEN 2 ELSE 0 END +
            CASE WHEN (f.has_remittance IS NULL OR f.has_remittance = FALSE) THEN 1 ELSE 0 END +
            CASE WHEN (f.loaned_organizations IS NOT NULL AND array_length(f.loaned_organizations, 1) > 0) THEN 1 ELSE 0 END +
            CASE WHEN (f.has_bank IS NULL OR array_length(f.has_bank, 1) IS NULL) THEN 1 ELSE 0 END +
            CASE WHEN (f.has_insurance NOT IN ('yes', 'हो', 'छ')) THEN 1 ELSE 0 END +
            CASE WHEN (f.toilet_type IS NULL OR f.toilet_type = '' OR f.toilet_type = 'अन्य') THEN 1 ELSE 0 END +
            CASE WHEN (f.water_source IS NULL OR array_length(f.water_source, 1) IS NULL) THEN 1 ELSE 0 END +
            CASE WHEN (f.primary_energy_source IS NULL OR f.primary_energy_source = '' OR f.primary_energy_source = 'अन्य') THEN 1 ELSE 0 END +
            CASE WHEN i.caste IN ('दलित', 'जनजाति', 'मुस्लिम', 'थारु', 'मगर', 'गुरुङ', 'तमाङ', 'नेवार', 'राई', 'लिम्बु', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END
        ) >= 6 THEN 'Moderately Challenged'
        WHEN (
            CASE WHEN b.land_ownership IS NULL OR b.land_ownership != 'निजी' THEN 2 ELSE 0 END +
            CASE WHEN b.base IN ('माटोको जोडाइ भएको इँटा/ढुङ्गा', 'काठको खम्बा गाडेको', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
            CASE WHEN b.outer_wall IN ('माटोको जोडाइ भएको इँटा/ढुङ्गा', 'काँचो इँटा', 'जस्ता/टिन/च्यादर', 'बाँसजन्य सामग्री', 'काठ/फल्याक', 'प्रि फ्याब', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
            CASE WHEN b.roof IN ('जस्ता/टिन', 'खर/पराल/छ्वाली', 'काठ/फल्याक', 'ढुङ्गा/स्लेट', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END +
            CASE WHEN (f.facilities IS NULL OR array_length(f.facilities, 1) IS NULL OR f.facilities @> ARRAY['माथिका कुनै पनि नभएको ']) THEN 2 ELSE 0 END +
            CASE WHEN (f.facilities IS NOT NULL AND array_length(f.facilities, 1) < 3) THEN 1 ELSE 0 END +
            CASE WHEN (f.income_sources IS NULL OR array_length(f.income_sources, 1) IS NULL) THEN 3 ELSE 0 END +
            CASE WHEN (f.income_sources IS NOT NULL AND f.income_sources @> ARRAY['ज्याला मजदुरी'] AND array_length(f.income_sources, 1) = 1) THEN 2 ELSE 0 END +
            CASE WHEN (f.has_remittance IS NULL OR f.has_remittance = FALSE) THEN 1 ELSE 0 END +
            CASE WHEN (f.loaned_organizations IS NOT NULL AND array_length(f.loaned_organizations, 1) > 0) THEN 1 ELSE 0 END +
            CASE WHEN (f.has_bank IS NULL OR array_length(f.has_bank, 1) IS NULL) THEN 1 ELSE 0 END +
            CASE WHEN (f.has_insurance NOT IN ('yes', 'हो', 'छ')) THEN 1 ELSE 0 END +
            CASE WHEN (f.toilet_type IS NULL OR f.toilet_type = '' OR f.toilet_type = 'अन्य') THEN 1 ELSE 0 END +
            CASE WHEN (f.water_source IS NULL OR array_length(f.water_source, 1) IS NULL) THEN 1 ELSE 0 END +
            CASE WHEN (f.primary_energy_source IS NULL OR f.primary_energy_source = '' OR f.primary_energy_source = 'अन्य') THEN 1 ELSE 0 END +
            CASE WHEN i.caste IN ('दलित', 'जनजाति', 'मुस्लिम', 'थारु', 'मगर', 'गुरुङ', 'तमाङ', 'नेवार', 'राई', 'लिम्बु', 'अन्य (खुलाउने)') THEN 1 ELSE 0 END
        ) >= 3 THEN 'Mildly Challenged'
        ELSE 'Not Economically Challenged'
    END AS severity_category
FROM
    survey_kerabari_family f
LEFT JOIN survey_kerabari_buildings b
    ON f.building_token = b.building_token AND f.ward_no = b.tmp_ward_number
LEFT JOIN survey_kerabari_individual i
    ON i.family_id = f.id AND (i.family_role = 'head' OR i.name = f.head_name)
ORDER BY f.ward_no, severity_score DESC;
