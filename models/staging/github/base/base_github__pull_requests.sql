{{ config(materialized='ephemeral') }}

SELECT * FROM {{ source('github', 'pull_requests')}}

