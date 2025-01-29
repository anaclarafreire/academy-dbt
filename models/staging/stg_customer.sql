with source_customer as (
    select
        cast(customerid as int64) as id_cliente, -- Use int64 para números inteiros
    from {{ source('RAW_sap_aw', 'customer') }} c
)
select *
from source_customer