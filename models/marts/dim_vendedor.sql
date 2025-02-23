with vendedor as (
    select
        pk_id_entidade
        , fk_id_territorio
    from {{ ref('stg_salesperson') }} 
),

pessoa as (
    select
        pk_id_entidade as fk_id_entidade
        , nome_completo_pessoa as nome_completo_vendedor
    from {{ ref('stg_person') }} 
)

select 
    v.pk_id_entidade as pk_id_entidade
    , p.nome_completo_vendedor
    , v.fk_id_territorio

from vendedor v
left join pessoa p
    on v.pk_id_entidade = p.fk_id_entidade
