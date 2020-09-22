SELECT
    {{ get_user_attributes('user__') }}
FROM
    {{ ref('base_github__comments') }}