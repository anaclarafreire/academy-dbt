with source_person as (
    select
        cast(businessentityid as int64) as pk_id_entidade
        , cast(persontype as string) as tipo_pessoa
        , person.firstname || ' ' || person.lastname as nome_completo_pessoa
    from {{ source('RAW_sap_aw', 'person') }} 
)

select *
from source_person
-- where pk_id_entidade is not null