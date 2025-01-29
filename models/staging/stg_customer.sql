with source_customer as (
    select
        cast(customerid as int64) as pk_id_cliente
        , cast(personid as int64) as fk_id_entidade
    from {{ source('RAW_sap_aw', 'customer') }} c
    where personid is not null  
)
select *
from source_customer
