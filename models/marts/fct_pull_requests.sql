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
    TIMESTAMP_TRUNC(TIMESTAMP(merged_at), WEEK, 'UTC') AS merged_at_week,
    closed_at,
    created_at,
    TIMESTAMP_TRUNC(TIMESTAMP(created_at), WEEK, 'UTC') AS created_at_week,
    updated_at,
    IF(merged_at IS NOT NULL, DATE_DIFF(merged_at, created_at, DAY), NULL) AS num_days_between_pull_request_created_and_merged
FROM {{ ref('stg_github__pull_requests') }}
