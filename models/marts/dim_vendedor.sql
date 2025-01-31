with pessoa as (
    select
        p.pk_id_entidade
        , p.nome_completo_pessoa as nome_completo_vendedor
    from {{ ref('stg_person') }} p
),

vendedor as (
    select
        v.pk_id_entidade
        , v.fk_id_territorio
    from {{ ref('stg_salesperson') }} v
)

select 
        p.pk_id_entidade
        , p.nome_completo_vendedor
        , v.fk_id_territorio
from pessoa p
inner join vendedor v
    on p.pk_id_entidade = v.pk_id_entidade
