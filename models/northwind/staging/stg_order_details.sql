with
    source_data as (
        SELECT 
            order_id
            , product_id
            , unit_price
            , quantity
            , discount
        FROM {{  source('judsonindiciumstitch','order_details')  }}
    )

select * from source_data