with source_salesperson as (
    select
        cast(businessentityid as int64) as pk_id_entidade
        , cast(territoryid as int64) as fk_id_territorio -- Coluna com valores nulos. 
    from {{ source('RAW_sap_aw', 'salesperson') }} 
)

select *
from source_salesperson
