with source_data as (
    SELECT 
        country
        , city
        , fax
        , postal_code
        --, _sdc_table_version
        , address
        , region
        --, _sdc_received_at
        , customer_id
        , _sdc_sequence
        , contact_name
        , phone
        , company_name
        , contact_title
        --, _sdc_batched_at
        --, _sdc_extracted_at
    FROM {{  source('judsonindiciumstitch','customers')  }}
)

select * from source_data