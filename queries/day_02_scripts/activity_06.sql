-- Activity 6: CTE for county expansion (capstone)

-- The problem: statewide rows represent many counties but appear as one row.
-- The CTE below expands them using a county reference table.

WITH sa_expanded AS (

    -- County-specific rows: use the county FIPS directly
    SELECT DISTINCT
         sa.business_year
        ,sa.state_code
        ,sa.issuer_id
        ,sa.service_area_id
        ,RIGHT(sa.county, 5) AS county_fips
    FROM public.aca_service_area_puf AS sa
    WHERE sa.cover_entire_state IN ('No', 'false')
    AND LEFT(sa.dental_only_plan, 1) = 'N'

    UNION

    -- Statewide rows: expand to one row per county
    SELECT DISTINCT
         sa.business_year
        ,sa.state_code
        ,sa.issuer_id
        ,sa.service_area_id
        ,cf."GEOID" AS county_fips
    FROM public.aca_service_area_puf AS sa
    JOIN public.county_fips_look_up AS cf
        ON sa.state_code = cf."USPS"
    WHERE sa.cover_entire_state = 'Yes'
    AND LEFT(sa.dental_only_plan, 1) = 'N'

)
SELECT *
FROM sa_expanded
WHERE state_code = 'AL'
ORDER BY service_area_id, county_fips;










-- Check: raw rows vs expanded rows for a single state
SELECT COUNT(*) AS raw_sa_rows
FROM public.aca_service_area_puf
WHERE state_code = 'AL'
AND dental_only_plan = 'No';










-- How many counties in the reference table?
SELECT COUNT(*) AS county_count
FROM public.county_fips_look_up
WHERE "USPS" = 'AL';










-- Expanded row count
WITH sa_expanded AS (
    SELECT DISTINCT
         sa.business_year
        ,sa.state_code
        ,sa.issuer_id
        ,sa.service_area_id
        ,RIGHT(sa.county, 5) AS county_fips
    FROM public.aca_service_area_puf AS sa
    WHERE sa.cover_entire_state IN ('No', 'false')
    AND LEFT(sa.dental_only_plan, 1) = 'N'

    UNION

    SELECT DISTINCT
         sa.business_year
        ,sa.state_code
        ,sa.issuer_id
        ,sa.service_area_id
        ,cf."GEOID" AS county_fips
    FROM public.aca_service_area_puf AS sa
    JOIN public.county_fips_look_up AS cf
        ON sa.state_code = cf."USPS"
    WHERE sa.cover_entire_state = 'Yes'
    AND LEFT(sa.dental_only_plan, 1) = 'N'
)
SELECT COUNT(*) AS expanded_rows
FROM sa_expanded
WHERE state_code = 'AL';
