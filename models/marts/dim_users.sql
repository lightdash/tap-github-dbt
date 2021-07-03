{{ config(materialized='table') }}

SELECT
    user_id,
    user_name
FROM {{ ref('users') }}