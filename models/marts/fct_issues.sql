{{ config(materialized='table') }}

SELECT
    issue_id,
    state,
    repository,
    number,
    closed_at,
    title,
    body,
    created_at,
    updated_at,
    pull_request_id,
    user_id,
    IF(closed_at IS NOT NULL, DATE_PART('day', closed_at - created_at), NULL) AS num_days_between_issue_created_and_closed
FROM {{ ref('stg_github__issues') }}
