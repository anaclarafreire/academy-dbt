with source_person as (
    select
        cast(p.businessentityid as int64) as pk_id_entidade
        , cast(p.persontype as string) as tipo_pessoa
        , cast(p.firstname as string) as nome_pessoa
        , cast(p.lastname as string) as sobrenome_pessoa
    from {{ source('RAW_sap_aw', 'person') }} p
    where p.persontype = 'IN'  -- Apenas clientes individuais
)

select *
from source_person
