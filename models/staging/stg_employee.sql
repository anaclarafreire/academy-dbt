with source_employee as (
    select
        cast(e.businessentityid as int64) as id_funcionario, 
        cast(e.nationalidnumber as int64) as cpf_funcionario,
        cast(e.jobtitle as string) as cargo_funcionario,
        cast(e.gender as string) as genero_funcionario
    from {{ source('RAW_sap_aw', 'employee') }} e
)

select *
from source_employee
