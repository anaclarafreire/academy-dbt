with source_salesreason as (
    select
        cast(sr.salesreasonid as int64 ) as pk_id_razao_vendas 
        , cast(sr.name as string ) as nome_razao_venda
    from {{ source('RAW_sap_aw', 'salesreason') }} sr
)

select *
from source_salesreason