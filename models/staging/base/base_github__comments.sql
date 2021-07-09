{{ config(materialized='ephemeral') }}

SELECT * FROM {{ source('github', 'comments')}}

