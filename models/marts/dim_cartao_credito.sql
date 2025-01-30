with cartao_credito as (
    select
        pk_id_cartao_credito
        , tipo_cartao
        , numero_cartao
    from {{ ref('stg_credit_card') }}
)

select
        pk_id_cartao_credito
        , tipo_cartao
        , numero_cartao
from cartao_credito 

