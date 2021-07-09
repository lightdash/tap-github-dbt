{{ config(materialized='table') }}
WITH team_membership AS (
    SELECT
       team_id,
       LOWER(user_name) as user_name,
       role,
       state
    FROM {{ ref('stg_github__team_memberships') }}
),
users AS (
    SELECT
        user_id,
        LOWER(user_name) as user_name
    FROM {{ ref('stg_users') }}
)
SELECT
    team_id,
    users.user_id,
    role,
    state
FROM team_membership
INNER JOIN users USING (user_name)
