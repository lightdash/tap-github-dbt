{{ config(materialized='table') }}

SELECT
    issue_id,
    state,
    repository,
    number,
    closed_at,
    closed_at::date AS closed_at_date,
    title,
    body,
    created_at::date AS created_at_date,
    updated_at::date AS updated_at_date,
    EXTRACT('week' FROM created_at) AS created_at_week,
    EXTRACT('week' FROM closed_at) AS closed_at_week,
    pull_request_id,
    user_id,
    EXTRACT(day FROM closed_at - created_at) AS num_days_between_issue_created_and_closed
FROM {{ ref('stg_github__issues') }}
