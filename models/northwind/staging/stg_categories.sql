with
    source_data as (
        SELECT 
            category_id
            , category_name
            , description
        FROM {{  source('judsonindiciumstitch','categories')  }}
    )

select * from source_data