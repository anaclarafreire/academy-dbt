WITH vendedor AS (
    SELECT
        pk_id_entidade
        , fk_id_territorio
    FROM {{ ref('stg_salesperson') }} 
),

pessoa AS (
    SELECT
        pk_id_entidade AS fk_id_entidade
        , nome_completo_pessoa AS nome_completo_vendedor
    FROM {{ ref('stg_person') }} 
)

SELECT 
    v.pk_id_entidade AS fk_id_entidade
    , p.nome_completo_vendedor
    , v.fk_id_territorio

FROM vendedor v
LEFT JOIN pessoa p
    ON v.pk_id_entidade = p.fk_id_entidade
