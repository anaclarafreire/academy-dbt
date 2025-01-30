with pais as (
    select
        pk_sigla_pais
        , nome_pais 
    from {{ ref('stg_country_region') }}
)

select
    pk_sigla_pais
    , nome_pais 
from pais 