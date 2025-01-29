with source_address as (
    select
        cast(a.addressid as int64) as id_endereco, 
        cast(a.city as string) as nome_cidade,
        cast(a.stateprovinceid as int64) as id_estado
    from {{ source('RAW_sap_aw', 'address') }} a
)

select *
from source_address
