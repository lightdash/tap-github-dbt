SELECT
    id::integer as pull_request_id,
    _sdc_repository as repository,
    url,
    number,
    state,
    title,
    body,
    user__id::integer as user_id,
    merged_at,
    closed_at,
    created_at,
    updated_at
FROM
    {{ ref('base_github__pull_requests') }}