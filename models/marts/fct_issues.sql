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
    user_id
FROM {{ ref('stg_github__issues') }}