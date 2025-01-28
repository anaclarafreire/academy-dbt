with source_person as (
    select
        cast(p.businessentityid as int64 ) as codigo_pessoa, 
        cast(p.firstname as string) as nome_pessoa,
        cast(p.lastname as string) as sobrenome_pessoa
    from {{ source('RAW_sap_aw', 'person') }} p
)

select *
from source_person