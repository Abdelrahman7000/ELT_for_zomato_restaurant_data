WITH split_items AS (
    ---- Extracts each word from the `item` column that starts with a capital letter and has at least three characters,
    -- and unnests them into individual rows along with `id`, `item`, `veg`, and the extracted word.
    SELECT
        id,
        item,
        veg,
        TRIM(REPLACE(value, '"', '')) AS item_each
    FROM
        {{ ref('stg_food') }},  
        UNNEST(REGEXP_EXTRACT_ALL(item, r'\b[A-Z][a-z]{2,}\b')) AS value

),
    stopwords_agg_item_only AS (
    --removes certain items words
    -- get the frequency of each item
    SELECT
        item_each, count(*) AS cnt
    FROM 
        split_items
    WHERE item_each NOT IN (
        'Veg','Pcs','Dry','Fry','Ice','Mix','Hot','And','Gms',
        'With','Fried','Combo','Sauce','Plain','Spicy',
        'Grilled','Special','Regular') 
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 40
)

SELECT
    id, spit.item_each AS item, veg, stagg.cnt AS item_cnt
FROM
    split_items spit
JOIN
    stopwords_agg_item_only stagg ON spit.item_each=stagg.item_each
GROUP BY 1,2,3,4
