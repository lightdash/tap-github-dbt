{{ config(materialized='table') }}
SELECT
    team_id,
    organization_id,
    name,
    slug,
    description,
    privacy,
    permission
FROM
    {{ ref('stg_github__teams') }}