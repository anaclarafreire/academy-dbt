with source_territory as (
    select
        cast(territoryid as int64) as pk_id_territorio 
        , cast(name as string) as nome_territorio
    from {{ source('RAW_sap_aw', 'salesterritory') }} 
)

select *
from source_territory
