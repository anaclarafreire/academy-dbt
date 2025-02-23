with source_businessentityaddress as (
    select
        cast(addressid as int64) as pk_id_endereco
        , cast(city as string) as nome_cidade
        , cast(stateprovinceid as int64) as fk_id_estado
    from {{ source('RAW_sap_aw', 'address') }} 
)

select *
from source_businessentityaddress
 
