{{ config(materialized='table') }}
SELECT
    team_id,
    user_id,
    role,
    state
FROM  {{ ref('team_memberships') }}
