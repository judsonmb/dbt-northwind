{{ config(materialized='table') }}


with
    staging_products as (
        select *
        from {{ ref('stg_products') }}
    )
    ,
    staging_categories as (
        select *
        from {{ ref('stg_categories') }}
    )
    ,
    staging_suppliers as (
        select *
        from {{ ref('stg_suppliers') }}
    )
    ,
    staging_order_details as (
        select *
        from {{ ref('stg_order_details') }}
    )
    , transformed as (
        select
            row_number() over (order by p.product_id) as product_sk --auto-incremental surrogate key
            , p.product_id
            , p.product_name
            , p.supplier_id
            , p.category_id
            , p.quantity_per_unit
            , p.unit_price
            , p.units_in_stock
            , p.units_on_order
            , p.reorder_level
            , p.discontinued
            , cat.category_name
            , cat.description
            , sup.company_name
            , sup.contact_name
            , sup.contact_title
            , sup.city
            , sup.region
            , sup.postal_code
            , sup.country
            , sup.phone
            , sup.fax
            , sup.homepage
            , od.order_id
            , od.quantity
            , od.discount
        from staging_products as p
        left join staging_categories as cat on p.category_id = cat.category_id
        left join staging_suppliers as sup on p.supplier_id = sup.supplier_id 
        left join staging_order_details as od on p.product_id = od.product_id
    ) 

select * from transformed   