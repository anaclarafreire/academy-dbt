with reason as (
    select
        pk_id_motivo_venda
        , descricao_motivo_venda,
    from {{ ref('stg_sales_reason') }}
),


select
        pk_id_motivo_venda
        , descricao_motivo_venda,
from reason 

