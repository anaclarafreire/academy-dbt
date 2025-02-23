with source_salesorderheadersalesreason as (
    select
        cast(salesorderid as int64) as pk_id_pedido
        , cast(salesreasonid as int64) as fk_id_motivo_venda
    from {{ source('RAW_sap_aw', 'salesorderheadersalesreason') }}
)

select *
from source_salesorderheadersalesreason
