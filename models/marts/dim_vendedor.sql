with person as (
    select
        pk_id_entidade
        , tipo_pessoa
        , nome_completo_pessoa as nome_completo_vendedor
    from {{ ref('stg_person') }}
    where tipo_pessoa = 'VC'  
)
select 
        pk_id_entidade
        , nome_completo_vendedor
from person 
