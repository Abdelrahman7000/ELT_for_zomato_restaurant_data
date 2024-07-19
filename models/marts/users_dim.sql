WITH orders_summary AS (
-- aggregates orders on the level of each user
SELECT
    uid,
    MIN(order_date) AS first_purchase,
    MAX(order_date) AS last_purchase,
    COUNT(*) AS orders_cnt,
    SUM(sales_amt) AS total_purchase,
    avg(sales_amt) AS avg_purchase
FROM
    {{ref('stg_orders')}}
GROUP BY 1
)

SELECT
    id, age, gender, married, occupation,
    m_income, edu_q, f_size,
    first_purchase, last_purchase, 
    orders_cnt, total_purchase
FROM
    {{ref('stg_users')}} u
INNER JOIN
    orders_summary us ON us.uid=u.id