-- models/marts/dimensions/dim_cliente.sql
{{ config(materialized = 'table') }}

with stg_person as (
    select
        p.pk_id_entidade
        , p.nome_pessoa
        , p.sobrenome_pessoa
    from {{ ref('stg_person') }} p
),

stg_customer as (
    select
        c.pk_id_cliente
        , c.fk_id_entidade
    from {{ ref('stg_customer') }} c
)

select
    c.pk_id_cliente
    , p.pk_id_entidade
    , p.nome_pessoa as nome_cliente
    , p.sobrenome_pessoa as sobrenome_cliente
from stg_customer c
inner join stg_person p  -- Garantindo que pegamos apenas clientes reais
    on p.pk_id_entidade = c.fk_id_entidade
