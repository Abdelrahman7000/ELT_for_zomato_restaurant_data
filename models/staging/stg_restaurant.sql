WITH cte AS (
    select
        id AS id,
        name,
        city,
        rating AS rating,
        -- convert column to numeric value to be visualized
        CASE
            WHEN left(rating_count,4)='10K+' THEN 10*1000+1
            WHEN left(rating_count,3)='5K+' THEN 5*1000+1
            WHEN left(rating_count,3)='1K+' THEN 1*1000+1
            WHEN left(rating_count,4)='500+' THEN 500+1
            WHEN left(rating_count,4)='100+' THEN 100+1
            WHEN left(rating_count,3)='50+' THEN 50+1
            WHEN left(rating_count,3)='20+' THEN 20+1
            WHEN left(rating_count,3)='Too' THEN 1
            ELSE null 
        END AS rating_cnt,
        -- extract only the numeric value
        REGEXP_SUBSTR(cost, '\\d+') As cost,
        cuisine,
        lic_no AS lic_no,
        link
    from
        {{ source('staging','restaurant') }}
)

select * 
from cte 
where id IS NOT null