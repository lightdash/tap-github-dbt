{{ config(materialized='table') }}

SELECT
    issue_id,
    state,
    repository,
    number,
    closed_at,
    TIMESTAMP_TRUNC(TIMESTAMP(closed_at), WEEK, 'UTC') AS closed_at_week,
    title,
    body,
    created_at,
    TIMESTAMP_TRUNC(TIMESTAMP(created_at), WEEK, 'UTC') AS created_at_week,
    updated_at,
    pull_request_id,
    user_id,
    IF(closed_at IS NOT NULL, DATE_DIFF(closed_at, created_at, DAY), NULL) AS num_days_between_issue_created_and_closed
FROM {{ ref('stg_github__issues') }}
