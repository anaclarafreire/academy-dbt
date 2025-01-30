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
    customer.pk_id_cliente
    , person.pk_id_entidade
    , nome_completo_cliente
from customer 
inner join person 
    on person.pk_id_entidade = customer.fk_id_entidade
