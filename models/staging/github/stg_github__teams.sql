SELECT
    id::integer as team_id,
    {{ dbt_utils.split_part("url", "'/'", 5) }}::integer as organization_id,
    name,
    slug,
    description,
    privacy,
    permission
FROM
    {{ ref('base_github__teams') }}