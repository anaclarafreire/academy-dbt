with source_customer as (
    select distinct
        cast(customerid as int64) as pk_id_cliente
        , cast(personid as int64) as fk_id_entidade
        , cast(territoryid as int64) as fk_id_territorio
    from {{ source('RAW_sap_aw', 'customer') }}
    where personid is not null
)

select *
from source_customer