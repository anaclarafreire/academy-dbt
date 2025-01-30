with produto as (
    select
        pk_id_produto
        , nome_produto
        , custo_padrao_produto
    from {{ ref('stg_product') }}
),

detalhe_vendas as (
    select
        fk_id_produto
    from {{ ref('stg_sales_order_detail') }}
)

select
    pk_id_produto
    , nome_produto
    , custo_padrao_produto
from produto
inner join detalhe_vendas 
    on pk_id_produto = fk_id_produto
