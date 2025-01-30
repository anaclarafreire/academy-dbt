with source_creditcard as (
    select
        cast(creditcardid as int64) as pk_id_cartao_credito
        , cast(cardtype as string) as tipo_cartao
        , cast(cardnumber as int64) as numero_cartao 


    from {{ source('RAW_sap_aw', 'creditcard') }} 
)

select *
from source_creditcard