# with cliente as (
#     select 
#         pk_id_cliente,
#         id_territorio,
#         nome_pessoa,
#         sobrenome_pessoa
#     from {{ ref('int_cliente') }}
# )
# 
# select * from cliente