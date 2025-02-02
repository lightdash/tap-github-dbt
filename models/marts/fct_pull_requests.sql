{{ config(materialized='table') }}

SELECT
    pull_request_id,
    repository,
    number,
    state,
    title,
    body,
    user_id,
    merged_at,
    closed_at,
    created_at,
    updated_at,
    merged_at::date AS merged_at_date,
    closed_at::date AS closed_at_date,
    created_at::date AS created_at_date,
    updated_at::date AS updated_at_date,
    EXTRACT(day FROM merged_at - created_at) AS num_days_between_pull_request_created_and_merged
FROM {{ ref('stg_github__pull_requests') }}
