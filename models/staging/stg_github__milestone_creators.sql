SELECT
    {{ get_user_attributes('creator__') }}
FROM
    {{ ref('base_github__issue_milestones') }}