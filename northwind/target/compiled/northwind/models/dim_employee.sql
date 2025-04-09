with stg_employees as (
    select * from raw.northwind.Employees
),
stg_supervisors as (
    select * from raw.northwind.Employees
)
select 
    md5(cast(coalesce(cast(e.employeeid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) 
       as employeekey, 
    e.employeeid,
    concat(e.lastname ,', ' , e.firstname) as employeenamelastfirst,
    concat(e.firstname  , ' ' , e.lastname) as employeenamefirstlast,
    e.title as employeetitle,
    concat(s.lastname ,', ' , s.firstname) as supervisornamelastfirst,
    concat(s.firstname  , ' ' , s.lastname) as supervisornamefirstlast
from stg_employees e
    left join stg_supervisors s on e.reportsto = s.employeeid