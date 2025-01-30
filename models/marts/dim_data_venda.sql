with sales_order_header as (
    select
        pk_id_pedido
        , fk_id_cliente
        , fk_id_entidade
        , data_pedido
        , data_envio
        , data_vencimento_pedido
    from {{ ref('stg_sales_order_header') }}
)

select
    pk_id_pedido
    , fk_id_cliente
    , fk_id_entidade
    , data_pedido
    , data_envio
    , data_vencimento_pedido
from sales_order_header 

