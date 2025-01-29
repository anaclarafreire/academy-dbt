with source_salesorderdetail as (
    select
        cast(sod.salesorderid as int64 ) as fk_id_pedido 
        , cast(sod.orderqty as int64) as quantidade_produto  
        , cast(sod.productid as int64) as fk_id_produto  
        , cast(sod.unitprice as numeric) as preco_unitario
    from {{ source('RAW_sap_aw', 'salesorderdetail') }} sod
)

select *
from source_salesorderdetail