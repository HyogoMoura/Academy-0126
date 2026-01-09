with 
    source_order_det as (
        select *  from {{ source('nwind', 'order_details') }}
    )
    ,  renaming as(
        select
        cast(order_id as int) as order_detail_pk
        , cast(product_id as int) as product_fk
        , cast(unit_price as float) as product_price
        , cast(quantity as int) as quantity
        , cast(discount as float) as discount_pct
        from source_order_det
    )

select * from renaming