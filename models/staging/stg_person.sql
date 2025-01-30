with source_person as (
    select
        cast(businessentityid as int64) as pk_id_entidade,
        cast(persontype as string) as tipo_pessoa,
        cast(firstname as string) as nome_pessoa,
        cast(lastname as string) as sobrenome_pessoa
    from {{ source('RAW_sap_aw', 'person') }}
    where persontype = 'IN'
)

select *
from source_person
