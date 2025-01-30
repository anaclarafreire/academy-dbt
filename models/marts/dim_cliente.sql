with person as (
    select
        pk_id_entidade
        , nome_pessoa
        , sobrenome_pessoa
    from {{ ref('stg_person') }}
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
    , person.nome_pessoa as nome_cliente
    , person.sobrenome_pessoa as sobrenome_cliente
from customer 
inner join person 
    on person.pk_id_entidade = customer.fk_id_entidade
