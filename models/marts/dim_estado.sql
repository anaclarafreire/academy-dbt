with stateprovince as (
    select
        pk_id_estado
        , nome_estado
        , fk_sigla_pais 
        , fk_id_territorio
    from {{ ref('stg_state_province') }}
)


select
    pk_id_estado
    , nome_estado
    , fk_sigla_pais 
    , fk_id_territorio
from stateprovince 

