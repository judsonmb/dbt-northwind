with
    source_data as (
        SELECT 
            supplier_id
            , company_name
            , contact_name
            , contact_title
            , city
            , region
            , postal_code
            , country
            , phone
            , fax
            , homepage

        FROM {{  source('judsonindiciumstitch','suppliers')  }}
    )

select * from source_data