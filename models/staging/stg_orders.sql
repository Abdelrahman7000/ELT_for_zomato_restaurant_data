with cte AS (
    select
        order_date,
        sales_qty,
        sales_amount AS sales_amt,
        -- limit currency to be only 3 characters
        left(TRIM(currency,'"'), 3) AS currency,
        user_id AS uid,
        r_id AS rid
    from
    {{ source('staging','orders') }}
)

select * from cte where currency='INR'
