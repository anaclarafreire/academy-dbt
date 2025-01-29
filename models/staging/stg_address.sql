with source_address as (
    select
        cast(a.addressid as int64) as pk_id_endereco
        , cast(a.addressline1 as string) as linha_endereco_1
        , cast(a.city as string) as nome_cidade
        , cast(a.stateprovinceid as int64) as fk_id_estado
    from {{ source('RAW_sap_aw', 'address') }} a
)

select *
from source_address


