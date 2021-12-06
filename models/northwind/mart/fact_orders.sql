{{ config(materialized='table') }}

with 
    customers as (
        select 
        customer_sk
        , customer_id
        from {{ ref('dim_customers') }}
    )
    ,
    products as (
        select 
        product_sk
        , product_id
        , order_id
        from {{ ref('dim_products') }}
    )

    , orders_with_sk as (
        select
            orders.order_id
            , customers.customer_id
            , products.product_id
            , orders.order_date
            , orders.required_date
            , orders.shipped_date
            , orders.ship_via
            , orders.freight
            , orders.ship_name
            , orders.ship_region
            , orders.ship_address
            , orders.ship_city
            , orders.ship_postal_code
            , orders.ship_country
        from {{ ref('stg_orders') }} orders
        left join customers on orders.customer_id = customers.customer_id
        left join products on orders.order_id = products.order_id
)

select * from orders_with_sk