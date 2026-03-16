-- Activity 5: Introducing the service area table

-- Sample rows
SELECT * FROM public.aca_service_area_puf LIMIT 20;










-- Row count
SELECT TO_CHAR(COUNT(*), 'FM999,999,999,999') AS total_rows
FROM public.aca_service_area_puf;










-- Distinct values in key columns
SELECT
     COUNT(DISTINCT state_code)      AS distinct_states
    ,COUNT(DISTINCT service_area_id) AS distinct_service_areas
    ,COUNT(DISTINCT county)          AS distinct_counties
FROM public.aca_service_area_puf;










-- Statewide vs county-specific: how many of each?
SELECT cover_entire_state, COUNT(*) AS row_count
FROM public.aca_service_area_puf
GROUP BY cover_entire_state;










-- What does a statewide row look like?
SELECT * FROM public.aca_service_area_puf WHERE cover_entire_state = 'Yes' LIMIT 10;










-- What does a county-specific row look like?
SELECT * FROM public.aca_service_area_puf WHERE cover_entire_state = 'No' LIMIT 10;










-- All rows for a single state
SELECT *
FROM public.aca_service_area_puf
WHERE state_code = 'MS'
ORDER BY service_area_id, cover_entire_state, county_name;
