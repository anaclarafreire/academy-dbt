with source_stateprovince as (
    select
        cast(stateprovinceid as int64) as pk_id_estado 
        , cast(name as string ) as nome_estado
        , cast(countryregioncode as string ) as sigla_pais
        , cast(territoryid as int64) as fk_id_territorio
    from {{ source('RAW_sap_aw', 'stateprovince') }} 
)

select *
from source_stateprovince