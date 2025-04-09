
    
    

select
    EmployeeId as unique_field,
    count(*) as n_records

from raw.northwind.Employees
where EmployeeId is not null
group by EmployeeId
having count(*) > 1


