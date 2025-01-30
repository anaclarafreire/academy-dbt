with person as (
    select
        pk_id_entidade
        , tipo_pessoa
        , nome_completo_pessoa as nome_completo_cliente
    from {{ ref('stg_person') }}
    where tipo_pessoa = 'IN' 
),

customer as (
    select
        pk_id_cliente
        , fk_id_entidade
    from {{ ref('stg_customer') }}
)

select
    pk_id_entidade
    , pk_id_cliente
    , nome_completo_cliente
from person 
inner join customer 
    on pk_id_entidade = fk_id_entidade
