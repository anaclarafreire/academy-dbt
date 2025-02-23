with source_countryregion as (
    select
        cast(countryregioncode as string) as pk_sigla_pais
        , cast(name as string) as nome_pais
    from {{ source('RAW_sap_aw', 'countryregion') }} 
)

select *
from source_countryregion
