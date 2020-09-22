{% macro get_user_attributes (column_prefix='') %}
    {%
        set user_attributes = [
            'repos_url'          ,
            'starred_url'        ,
            'url'                ,
            'received_events_url',
            'site_admin::boolean',
            'gravatar_id'        ,
            'following_url'      ,
            'avatar_url'         ,
            'events_url'         ,
            'id::integer'        ,
            'login'              ,
            'organizations_url'  ,
            'html_url'           ,
            'type'               ,
            'subscriptions_url'  ,
            'node_id'            ,
            'followers_url'      ,
            'gists_url'
        ]
    %}
    {% for attr in user_attributes %}
        {{column_prefix}}{{attr}} as {{attr.split(':')[0]}}
        {%- if not loop.last -%},{%- endif %}
    {% endfor %}
{% endmacro %}
