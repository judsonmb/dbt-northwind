{{ config(materialized='table') }}


with
    staging_customers as (
        select *
        from {{ ref('stg_customers') }}
    )
    , transformed as (
        select
            row_number() over (order by customer_id) as customer_sk --auto-incremental surrogate key
            , customer_id
            , company_name
            , contact_name
            , contact_title
            , address 
            , city
            , region
            , postal_code
            , country
            , phone
            , fax
        from staging_customers
    ) 

select * from transformed   