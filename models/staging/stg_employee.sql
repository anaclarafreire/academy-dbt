with source_employee as (
    select
        cast(e.businessentityid as int64) as pk_id_entidade
        , cast(e.nationalidnumber as int64) as cpf_funcionario
        , cast(e.jobtitle as string) as cargo_funcionario
        , cast(e.gender as string) as genero_funcionario
        , cast(e.hiredate as date) as data_contratacao
        , cast(e.birthdate as date) as data_nascimento
        , cast(e.vacationhours as int64) as horas_ferias
    from {{ source('RAW_sap_aw', 'employee') }} e
)

select *
from source_employee
