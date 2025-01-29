with customer as (
    select 
        c.pk_id_entidade
    from {{ ref('stg_customer') }} c
)

-- Juntando os dados das duas tabelas pela chave pk_id_entidade
select 
    c.pk_id_entidade as pk_id_cliente
from customer c
