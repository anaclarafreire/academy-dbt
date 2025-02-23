WITH vendas AS (
    SELECT 
        fv.fk_id_vendedor
        , fv.fk_id_territorio
        , SUM(fv.numero_pedidos) AS numero_pedidos  -- Somando os pedidos do vendedor
        , SUM(fv.quantidade_comprada) AS quantidade_comprada -- Somando os produtos vendidos
        , SUM(fv.valor_total_negociado) AS valor_total_negociado -- Somando o valor total negociado
        , SUM(fv.valor_total_negociado) / NULLIF(SUM(fv.numero_pedidos), 0) AS ticket_medio  -- Média ponderada
    FROM {{ ref('fact_vendas') }} fv
    GROUP BY fv.fk_id_vendedor, fv.fk_id_territorio  -- ✅ Agora a agregação está correta
),

regiao AS (
    SELECT
        r.fk_id_territorio
        , r.nome_territorio
    FROM {{ ref('dim_localidade') }} r
),

vendedor AS (
    SELECT
        v.pk_id_entidade AS fk_id_vendedor
        , v.nome_completo_vendedor    
    FROM {{ ref('dim_vendedor') }} v
)

SELECT DISTINCT
    -- Criando chave surrogate baseada em vendedor + território
    TO_HEX(MD5(CAST(vendas.fk_id_vendedor AS STRING) || '-' || CAST(vendas.fk_id_territorio AS STRING))) AS sk_vendas_vendedor_regiao
    , vendas.fk_id_vendedor
    , vendedor.nome_completo_vendedor
    , vendas.fk_id_territorio
    , regiao.nome_territorio
    , vendas.numero_pedidos as numero_vendas
    , vendas.quantidade_comprada as produtos_vendidos
    , vendas.valor_total_negociado as faturamento_total
    , vendas.ticket_medio

FROM vendas
LEFT JOIN regiao ON vendas.fk_id_territorio = regiao.fk_id_territorio
LEFT JOIN vendedor ON vendas.fk_id_vendedor = vendedor.fk_id_vendedor
