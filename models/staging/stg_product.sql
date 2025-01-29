with source_product as (
    select
        cast(productid as int64) as id_produto, -- Use int64 para números inteiros
        cast(name as string) as nome_produto,  -- Use string no lugar de varchar
        cast(standardcost as float64) as custo_padrao_produto -- float64 para números decimais
    from {{ source('RAW_sap_aw', 'product') }}
)

select *
from source_product
