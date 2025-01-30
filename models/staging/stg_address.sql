with source_address as (
    select
        cast(addressid as int64) as pk_id_endereco
        , cast(addressline1 as string) as linha_endereco_1
        , cast(city as string) as nome_cidade
        , cast(stateprovinceid as int64) as fk_id_estado
    from {{ source('RAW_sap_aw', 'address') }} 
)

select *
from source_address
 
