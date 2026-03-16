-- Activity 3: Comparing two tables — attempting the join

-- Row counts before joining
SELECT TO_CHAR(COUNT(*), 'FM999,999,999,999') AS rate_rows FROM public.aca_rate_puf;
SELECT TO_CHAR(COUNT(*), 'FM999,999,999,999') AS pa_rows FROM public.aca_plan_attributes_puf;










-- What does the join key look like in each table?
SELECT DISTINCT plan_id FROM public.aca_rate_puf LIMIT 20;
SELECT DISTINCT standard_component_id FROM public.aca_plan_attributes_puf LIMIT 20;










-- Attempt the join (single state, single year, single age)
SELECT
     r.state_code
    ,r.plan_id
    ,r.rating_area_id
    ,r.age
    ,r.individual_rate
    ,pa.metal_level
    ,pa.plan_type
    ,pa.plan_marketing_name
FROM public.aca_rate_puf r
JOIN public.aca_plan_attributes_puf pa
    ON r.plan_id = pa.standard_component_id
WHERE r.state_code = 'AL'
AND r.business_year = '2024'
AND r.age = '21'
LIMIT 20;










-- Row count after joining (no filters)
SELECT COUNT(*) AS joined_rows
FROM public.aca_rate_puf r
JOIN public.aca_plan_attributes_puf pa
    ON r.plan_id = pa.standard_component_id;

-- Is joined_rows larger or smaller than rate_rows? Why?
