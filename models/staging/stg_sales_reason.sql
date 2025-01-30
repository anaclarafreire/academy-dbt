with source_salesreason as (
    select
        cast(salesreasonid as int64) as pk_id_motivo_venda,
        cast(name as string) as descricao_motivo_venda,
        cast(reasontype as string) as tipo_motivo_venda
    from {{ source('RAW_sap_aw', 'salesreason') }}
)

select *
from source_salesreason