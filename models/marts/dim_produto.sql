with produto as (
    select
        pk_id_produto
        , nome_produto
        , fk_subcategoria_produto
        , codigo_produto
        , custo_padrao_produto
    from {{ ref('stg_product') }} 
),

categoria as (
    select
        pk_id_categoria_produto as fk_id_categoria_produto
        , categoria_produto
    from {{ ref('stg_product_category') }} 
),

subcategoria as (
    select distinct
        pk_id_subcategoria_produto as fk_id_subcategoria_produto
        , fk_id_categoria_produto
        , subcategoria_produto
    from {{ ref('stg_product_subcategory') }} 
)

select
    p.pk_id_produto
    , p.codigo_produto
    , p.nome_produto
    , cp.fk_id_categoria_produto    
    , cp.categoria_produto
    , scp.fk_id_subcategoria_produto    
    , scp.subcategoria_produto
    , p.custo_padrao_produto
from produto p
left join subcategoria scp
    on p.fk_subcategoria_produto = scp.fk_id_subcategoria_produto  -- Corrigido aqui também
left join categoria cp
    on scp.fk_id_categoria_produto = cp.fk_id_categoria_produto
