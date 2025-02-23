with 
motivo_venda as (
    select
        pk_id_pedido
        , fk_id_motivo_venda
    from {{ ref('stg_sales_order_header_reason') }}
),

motivos as (
    select
        pk_id_motivo_venda
        , tipo_motivo_venda
        , descricao_motivo_venda
    from {{ ref('stg_sales_reason') }}
) 

select
        pk_id_pedido
        , fk_id_motivo_venda
        , tipo_motivo_venda
        , descricao_motivo_venda
from motivo_venda mv
left join motivos m
on mv.fk_id_motivo_venda = m.pk_id_motivo_venda

