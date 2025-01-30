with cartao_credito as (
    select
        sk_id_cartao_credito
        , tipo_cartao
        , numero_cartao
    from {{ ref('stg_credit_card') }}
)

select
        sk_id_cartao_credito
        , tipo_cartao
        , numero_cartao
from cartao_credito 

