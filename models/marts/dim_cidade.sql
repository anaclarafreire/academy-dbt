with cidade as (
    select
        pk_id_endereco
        , nome_cidade 
        , fk_sigla_estado
    from {{ ref('stg_address') }}
)

select
    pk_id_endereco
    , nome_cidade 
    , fk_sigla_estado
from cidade 

