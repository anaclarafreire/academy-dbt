with source_productsubcategory as (
    select
        cast(productsubcategoryid as int64) as pk_id_subcategoria_produto
        , cast(productcategoryid as int64) as fk_id_categoria_produto
        , cast(name as string) as subcategoria_produto
    from {{ source('RAW_sap_aw', 'productsubcategory') }} 
)

select *
from source_productsubcategory
