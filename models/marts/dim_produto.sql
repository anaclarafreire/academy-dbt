with produto as (
    select
        pk_id_produto
        , nome_produto
        , custo_padrao_produto
    from {{ ref('stg_product') }}
),

sales_order_detail as (
    select
        fk_id_produto
    from {{ ref('stg_sales_order_detail') }}
)

select
    pk_id_produto
    , nome_produto
    , custo_padrao_produto
from produto
inner join sales_order_detail 
    on pk_id_produto = fk_id_produto
