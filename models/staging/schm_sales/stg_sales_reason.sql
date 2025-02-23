with source_salesreason as (
    select
        cast(salesreasonid as int64) as pk_id_motivo_venda
        ,   case
               when name = 'Manufacturer' then 'Fabricante'
               when name = 'Review' then 'Revisão'
               when name = 'Price' then 'Preço'
               when name = 'Other' then 'Outro'
               when name = 'Quality' then 'Qualidade'
               when name = 'Television  Advertisement' then 'Publicidade na TV'
               when name = 'Sponsorship' then 'Patrocínio'
               when name = 'Demo Event' then 'Evento de Demonstração'
               when name = 'Magazine Advertisement' then 'Publicidade em Revista'
               when name = 'On Promotion' then 'Em Promoção'
               else name -- caso não encontre, mantém o valor original
            end as descricao_motivo_venda
        ,   case
                when reasontype = 'Marketing' then 'Marketing'
                when reasontype = 'Promotion' then 'Promoção'
                when reasontype = 'Other' then 'Outro'
                else reasontype -- caso não encontre, mantém o valor original
            end as tipo_motivo_venda

    from {{ source('RAW_sap_aw', 'salesreason') }}
)

select *
from source_salesreason
