with source_salesorderheader as (
    select
        cast(soh.salesorderid as int64 ) as id_pedido, 
        cast(soh.orderdate as string) as data_pedido,  
        cast(soh.duedate as string) as data_vencimento_pedido,  
        cast(soh.shipdate as string) as data_envio,  
        cast(soh.status as int64) as status_pedido,
        cast(soh.onlineorderflag as bool) as flag_pedido_online,
        cast(soh.customerid as int64) as id_cliente, 
        cast(soh.salespersonid as int64) as id_vendedor,
        cast(soh.territoryid as int64) as id_territorio,
        cast(soh.subtotal as numeric) as subtotal,  -- Alterado para numeric
        cast(soh.totaldue as numeric) as total_pedido  -- Corrigido nome e alterado para numeric

    from {{ source('RAW_sap_aw', 'salesorderheader') }} soh
)

select *
from source_salesorderheader
