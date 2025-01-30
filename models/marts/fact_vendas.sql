with dim_cartao_credito as (
    select
        sk_id_cartao_credito as fk_id_cartao_credito
    from {{ ref('stg_credit_card') }}
),

stg_cabecalho_vendas as (
    select
        sk_id_pedido as fk_id_pedido
        , flag_pedido_online
        , fk_id_cliente
        , fk_id_entidade
        , fk_id_endereco
        , fk_id_cartao_credito
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
        , scv.fk_id_entidade
        , scv.fk_id_endereco
        , sdv.fk_id_produto
        , scv.fk_id_cartao_credito
    -- Atributos extras
        , scv.flag_pedido_online
        , scv.total_pedido
    -- Métricas agregadas
        , count(distinct scv.fk_id_pedido) as numero_pedidos 
        , sum(sdv.quantidade_produto) as quantidade_comprada
        , sum(sdv.quantidade_produto * sdv.preco_unitario) as valor_total_negociado
        , avg(sdv.preco_unitario) as ticket_medio

    from stg_cabecalho_vendas scv
    left join stg_detalhe_vendas sdv 
        on scv.fk_id_pedido = sdv.fk_id_pedido  
    left join dim_cartao_credito dcc 
        on scv.fk_id_cartao_credito = dcc.fk_id_cartao_credito  
    group by 
        sk_id_fato_venda, scv.fk_id_pedido, scv.fk_id_cliente, scv.fk_id_entidade, 
        scv.fk_id_endereco, sdv.fk_id_produto, scv.fk_id_cartao_credito, 
        scv.flag_pedido_online, scv.total_pedido
)

select * from joined_table
