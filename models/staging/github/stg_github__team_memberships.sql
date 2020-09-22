SELECT
    {{ dbt_utils.split_part("url", "'/'", 7) }}::integer as team_id,
    {{ dbt_utils.split_part("url", "'/'", 9) }} as user_name,
    role,
    state
FROM
    {{ ref('base_github__team_memberships') }}