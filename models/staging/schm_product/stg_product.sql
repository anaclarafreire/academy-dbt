with source_product as (
    select
        cast(productid as int64) as pk_id_produto
        , cast(name as string) as nome_produto
        , cast(productsubcategoryid as int64) as fk_subcategoria_produto
        , cast(productnumber as string) as codigo_produto 
        , cast(standardcost as numeric) as custo_padrao_produto 
    from {{ source('RAW_sap_aw', 'product') }} 
)

select *
from source_product
