with source_employee as (
    select
        cast(businessentityid as int64) as pk_id_entidade
        , cast(nationalidnumber as int64) as id_nacional_funcionario
        , case
            when jobtitle = 'Buyer' then 'Comprador'
            when jobtitle = 'Janitor' then 'Zelador'
            when jobtitle = 'Stocker' then 'Estoquista'
            when jobtitle = 'Accountant' then 'Contador'
            when jobtitle = 'Tool Designer' then 'Designer de Ferramentas'
            when jobtitle = 'Design Engineer' then 'Engenheiro de Design'
            when jobtitle = 'Finance Manager' then 'Gerente Financeiro'
            when jobtitle = 'Network Manager' then 'Gerente de Network'
            when jobtitle = 'Purchasing Manager' then 'Gerente de Compras'
            when jobtitle = 'Benefits Specialist' then 'Especialista de Benefícios'
            else jobtitle 
            end as cargo_funcionario
        , cast(gender as string) as genero_funcionario
        , cast(hiredate as date) as data_contratacao
        , cast(birthdate as date) as data_nascimento
        , cast(vacationhours as int64) as horas_ferias
    from {{ source('RAW_sap_aw', 'employee') }} 
)

select *
from source_employee