SELECT
    {{ get_user_attributes() }}
FROM
    {{ ref('base_github__team_members') }}