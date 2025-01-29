with source_stateprovince as (
    select
        cast(stp.stateprovinceid as int64) as pk_id_estado 
        , cast(stp.name as string ) as nome_estado
        , cast(stp.countryregioncode as string ) as sigla_pais
        , cast(stp.territoryid as int64) as id_territorio
    from {{ source('RAW_sap_aw', 'stateprovince') }} stp
)

select *
from source_stateprovince