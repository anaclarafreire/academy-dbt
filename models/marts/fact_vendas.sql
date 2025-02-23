with 
stg_cabecalho_vendas as (
    select
        sk_id_pedido as fk_id_pedido
        , flag_pedido_online
        , fk_id_cliente
        , fk_id_vendedor
        , fk_id_territorio
        , fk_id_cartao_credito as id_cartao_credito
        , total_pedido
    from {{ ref('stg_sales_order_header') }}  
), 

stg_detalhe_vendas as (
    select
        fk_id_pedido
        , fk_id_produto
        , quantidade_produto
        , preco_unitario
    from {{ ref('stg_sales_order_detail') }}  
),

joined_table as (
    select
        to_hex(md5(concat(scv.fk_id_pedido, sdv.fk_id_produto))) as sk_id_fato_venda
    -- FKs das dimensões
        , scv.fk_id_pedido
        , scv.fk_id_cliente
        , COALESCE(scv.fk_id_vendedor, -1) AS fk_id_vendedor
        , scv.fk_id_territorio
        , sdv.fk_id_produto
    -- Atributos extras
        , scv.flag_pedido_online
        , scv.total_pedido
        , scv.id_cartao_credito
    -- Métricas agregadas
        , count(distinct scv.fk_id_pedido) as numero_pedidos 
        , sum(sdv.quantidade_produto) as quantidade_comprada
        , sum(sdv.quantidade_produto * sdv.preco_unitario) as valor_total_negociado
        , sum(sdv.quantidade_produto * sdv.preco_unitario) / count(scv.fk_id_pedido) as ticket_medio

    from stg_cabecalho_vendas scv
    left join stg_detalhe_vendas sdv 
        on scv.fk_id_pedido = sdv.fk_id_pedido  
    group by 
        scv.fk_id_pedido, scv.fk_id_cliente, COALESCE(scv.fk_id_vendedor, -1), 
        scv.fk_id_territorio, sdv.fk_id_produto, flag_pedido_online, scv.id_cartao_credito, scv.total_pedido
        
)

select * from joined_table
