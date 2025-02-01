with source_salesorderdetail as (
    select
        cast(salesorderid as int64 ) as fk_id_pedido 
        , cast(orderqty as int64) as quantidade_produto  
        , cast(productid as int64) as fk_id_produto  
        , cast(unitprice as numeric) as preco_unitario
    from {{ source('RAW_sap_aw', 'salesorderdetail') }} 
)

select *
from source_salesorderdetail