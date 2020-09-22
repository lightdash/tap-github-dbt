{{ config(materialized='ephemeral') }}

SELECT * FROM {{ source('github', 'issue_milestones')}}

