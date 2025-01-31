with 
vendas as (
    select 
        fv.fk_id_vendedor
        , fv.fk_id_territorio
        , fv.fk_id_pedido
        , fv.fk_id_produto
        , sum(fv.valor_total_negociado) as total_vendas
        , sum(fv.numero_pedidos) as total_pedidos
        , sum(fv.quantidade_comprada) as total_produtos_vendidos
        , sum(fv.valor_total_negociado) / sum(fv.numero_pedidos) as ticket_medio
    from {{ ref('fact_vendas') }} fv
    group by
        fv.fk_id_vendedor
        , fv.fk_id_territorio
        , fv.fk_id_pedido
        , fv.fk_id_produto
),

regiao as (
    select
        r.fk_id_territorio
        , r.fk_id_estado
    from {{ ref('dim_localidade') }} r
),

vendedor as (
    select
        v.pk_id_entidade as fk_id_vendedor
        , v.nome_completo_vendedor    
    from {{ ref('dim_vendedor') }} v
)

select
    to_hex(md5(cast(vendas.fk_id_vendedor as string) || '-' || cast(regiao.fk_id_estado as string))) as sk_vendas_vendedor_estado
    , vendas.fk_id_vendedor
    , vendedor.nome_completo_vendedor
    , vendas.fk_id_territorio
    , vendas.fk_id_pedido
    , vendas.fk_id_produto
    , vendas.total_vendas
    , vendas.total_pedidos
    , vendas.total_produtos_vendidos
    , vendas.ticket_medio

from vendas
inner join regiao
    on vendas.fk_id_territorio = regiao.fk_id_territorio
inner join vendedor
    on vendas.fk_id_vendedor = vendedor.fk_id_vendedor
