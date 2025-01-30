with cidade as (
    select
        pk_id_endereco
        , nome_cidade 
        , fk_id_estado
    from {{ ref('stg_address') }}
)

select
    pk_id_endereco
    , nome_cidade 
    , fk_id_estado
from cidade 

