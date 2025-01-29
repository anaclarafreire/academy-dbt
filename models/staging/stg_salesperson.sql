with source_salesperson as (
    select
        cast(sp.businessentityid as int64) as pk_id_vendedor
        , cast(sp.territoryid as int64) as regiao
        , cast(sp.bonus as int64) as bonus
        , cast(sp.saleslastyear as numeric) as vendas_ano_anterior
    from {{ source('RAW_sap_aw', 'salesperson') }} sp
)

select *
from source_salesperson
