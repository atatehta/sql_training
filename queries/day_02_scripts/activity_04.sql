-- Activity 4: Detecting and fixing join problems

-- Starting point: basic join with filters
SELECT
     r.state_code
    ,r.plan_id
    ,r.rating_area_id
    ,r.age
    ,r.individual_rate
    ,pa.metal_level
    ,pa.plan_type
    ,pa.plan_marketing_name
    ,pa.csr_variation_type     -- why are there multiple rows per plan?
FROM public.aca_rate_puf r
JOIN public.aca_plan_attributes_puf pa
    ON r.plan_id = pa.standard_component_id
WHERE r.state_code = 'AL'
AND r.business_year = '2024'
AND r.age = '21'
LIMIT 50;










-- Try adding each filter and compare row counts:
--   AND pa.dental_only_plan = 'No'
--   AND RIGHT(pa.plan_id, 1) = '1'










-- What do the variant suffixes look like?
SELECT DISTINCT RIGHT(plan_id, 1) FROM public.aca_plan_attributes_puf;
