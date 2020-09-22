{{ config(materialized='ephemeral') }}

SELECT * FROM {{ source('github', 'team_memberships')}}

