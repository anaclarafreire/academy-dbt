with endereco as (
    select
        pk_id_endereco
        , linha_endereco_1
        , nome_cidade 
        , fk_id_estado
    from {{ ref('stg_address') }}
),

estado_provincia as (
    select
        pk_id_estado
        , nome_estado
        , fk_sigla_pais
        , fk_id_territorio
    from {{ ref('stg_state_province') }}
), 

pais_regiao as(
    select
        pk_sigla_pais
        , nome_pais
    from {{ ref('stg_country_region') }}
)

select
    pk_id_endereco 
    , linha_endereco_1
    , fk_id_territorio 
    , nome_cidade
    , fk_id_estado 
    , nome_estado
    , fk_sigla_pais 
    , nome_pais
from endereco 
inner join estado_provincia 
    on fk_id_estado = pk_id_estado
inner join pais_regiao
    on fk_sigla_pais =  pk_sigla_pais


