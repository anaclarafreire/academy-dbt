with pessoa as (
    select
        pk_id_entidade
        , tipo_pessoa
        , nome_completo_pessoa as nome_completo_cliente
    from {{ ref('stg_person') }}
    where tipo_pessoa = 'IN' 
),

cliente as (
    select
        pk_id_cliente
        , fk_id_entidade
    from {{ ref('stg_customer') }}
)

select
    pk_id_entidade
    , pk_id_cliente
    , nome_completo_cliente
from pessoa 
inner join cliente 
    on pk_id_entidade = fk_id_entidade
