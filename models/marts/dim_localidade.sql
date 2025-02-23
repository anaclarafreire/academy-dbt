with endereco as (
    select
        pk_id_endereco
        , fk_id_estado
    from {{ ref('stg_address') }} e
),

estado_provincia as (
    select
        pk_id_estado as fk_id_estado
        , nome_estado
        , fk_sigla_pais
        , fk_id_territorio
    from {{ ref('stg_state_province') }} ep
), 

pais_regiao as(
    select
        pk_sigla_pais as fk_sigla_pais
        , nome_pais
    from {{ ref('stg_country_region') }} pr
),

territorio as(
    select
        pk_id_territorio as fk_id_territorio
        , nome_territorio
    from {{ ref('stg_sales_territory') }} t
)

select
    e.pk_id_endereco 
    , ep.fk_id_territorio
    , t.nome_territorio
    , e.fk_id_estado 
    , ep.nome_estado
    , pr.fk_sigla_pais 
    , nome_pais
from endereco e
left join estado_provincia ep
    on e.fk_id_estado = ep.fk_id_estado
left join pais_regiao pr
    on ep.fk_sigla_pais =  pr.fk_sigla_pais
left join territorio t
    on ep.fk_id_territorio = t.fk_id_territorio



