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
    updated_at
  FROM {{ ref('stg_github__pull_requests') }}
