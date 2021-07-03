{{ config(materialized='ephemeral') }}

WITH issues_users AS (
    SELECT * FROM {{ ref('stg_github__issue_users')}}
),
milestone_creators AS (
    SELECT * FROM {{ ref('stg_github__milestone_creators')}}
),
comment_users AS (
    SELECT * FROM {{ ref('stg_github__comment_users')}}
),
team_members AS (
 SELECT * FROM {{ ref('stg_github__team_members')}}
),
duplicated_users AS (
    SELECT * FROM issues_users
    UNION ALL
    SELECT * FROM milestone_creators
    UNION ALL
    SELECT * FROM comment_users
    UNION ALL
    SELECT * FROM team_members
    ),
ranked_users AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY id ORDER BY id DESC) AS rownum
    FROM duplicated_users
)
SELECT
    repos_url           ,
    starred_url         ,
    url                 ,
    received_events_url ,
    site_admin          ,
    gravatar_id         ,
    following_url       ,
    avatar_url          ,
    events_url          ,
    id as user_id       ,
    login as user_name  ,
    organizations_url   ,
    html_url            ,
    type                ,
    subscriptions_url   ,
    node_id             ,
    followers_url       ,
    gists_url
FROM ranked_users
WHERE rownum = 1
