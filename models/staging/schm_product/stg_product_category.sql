with source_productcategory as (
    select
        cast(productcategoryid as int64) as pk_id_categoria_produto
        , cast(name as string) as categoria_produto
    from {{ source('RAW_sap_aw', 'productcategory') }} 
)

select *
from source_productcategory
