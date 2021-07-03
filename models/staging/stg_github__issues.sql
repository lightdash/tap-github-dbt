WITH issues AS (
    SELECT * FROM {{ ref('base_github__issues') }}
),


pull_requests AS(
     SELECT
        pull_request_id,
        url
    FROM
        {{ ref('stg_github__pull_requests') }}
)

SELECT
    id::integer as issue_id,
    state,
    issues.url,
    REPLACE( {{ dbt_utils.get_url_path(field='repository_url') }}, 'repos/', '') as repository,
    number,
    closed_at,
    labels_url,
    title,
    updated_at,
    html_url,
    author_association,
    locked,
    events_url,
    node_id,
    body,
    comments as num_comments,
    created_at,
    comments_url,
    pull_request_id::integer,
    user__id::integer as user_id
FROM issues
LEFT JOIN pull_requests ON issues.pull_request__url = pull_requests.url