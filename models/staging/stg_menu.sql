select
    -- remove preceeding text from id columns
    TRIM(menu_id, 'mn') AS id,
    TRIM(f_id, 'fd') AS fid,
    r_id AS rid,
    cuisine,
    -- try to convert to double, or else use regex to extract price
        REGEXP_SUBSTR(price, '\\d+') AS price
from
    {{ source('staging','menu') }}