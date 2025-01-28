with source_countryregion as (
    select
        cast(cr.countryregioncode as string) as sigla_pais,
        cast(cr.name as string) as nome_pais
    from {{ source('RAW_sap_aw', 'countryregion') }} cr
)

select *
from source_countryregion
