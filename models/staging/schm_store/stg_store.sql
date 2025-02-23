with source_store as (
    select
        cast(businessentityid as int64) as pk_id_entidade
        , cast(name as string) as nome_loja
        , cast(salespersonid as int64) as fk_id_vendedor
    from {{ source('RAW_sap_aw', 'store') }} 
)

select *
from source_store
