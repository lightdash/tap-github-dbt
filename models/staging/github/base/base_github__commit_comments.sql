{{ config(materialized='ephemeral') }}

SELECT * FROM {{ source('github', 'commit_comments')}}

