with cliente as (
    select
        pk_id_entidade
        , fk_id_territorio
    from {{ ref('stg_customer') }}
),

pessoa as (
    select
        pk_id_entidade as fk_id_entidade
        , nome_completo_pessoa as nome_completo_cliente
    from {{ ref('stg_person') }}
), 

territorio as (
    select
        pk_id_territorio as fk_id_territorio
        , nome_territorio
    from {{ ref('stg_sales_territory') }}
)

select
    c.sk_id_entidade
    , p.nome_completo_cliente
    , c.fk_id_territorio
    , t.nome_territorio
from cliente c 
left join pessoa p 
    on c.pk_id_entidade = p.fk_id_entidade
left join territorio t
    on c.fk_id_territorio = t.fk_id_territorio
