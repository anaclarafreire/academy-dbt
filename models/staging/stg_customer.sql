with source_customer as (
    select
        cast(customerid as int64) as pk_id_entidade
    from {{ source('RAW_sap_aw', 'customer') }} c
)
select *
from source_customer