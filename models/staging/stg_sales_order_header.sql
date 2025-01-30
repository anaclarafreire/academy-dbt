with source_salesorderheader as (
    select
        cast(salesorderid as int64) as pk_id_pedido
        , cast(orderdate as string) as data_pedido
        , cast(duedate as string) as data_vencimento_pedido 
        , cast(shipdate as string) as data_envio
        , cast(status as int64) as status_pedido
        , cast(onlineorderflag as bool) as flag_pedido_online
        , cast(customerid as int64) as fk_id_cliente
        , cast(salespersonid as int64) as fk_id_entidade
        , cast(shiptoaddressid as int64) as fk_id_endereco
        , cast(creditcardid as int64) as fk_id_cartao_credito
        , cast(subtotal as numeric) as subtotal  
        , cast(totaldue as numeric) as total_pedido
    from {{ source('RAW_sap_aw', 'salesorderheader') }} 
)

select *
from source_salesorderheader
