with cte_food as (
    select
        -- removes fd and converts to number, or else null
        trim(f_id, 'fd') as id,
        item,

        CASE veg_or_non_veg
        -- reduces column to true or false based on whether food item is vegetarian or not
            WHEN 'Veg' THEN True
            WHEN 'Non-veg' THEN False
            ELSE null
        END AS veg
    from
        {{ source('staging','food') }}
)


select * from cte_food 
where id IS NOT NULL
