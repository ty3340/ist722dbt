select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    employeekey as unique_field,
    count(*) as n_records

from analytics.dbt_ty3340_northwind.dim_employee
where employeekey is not null
group by employeekey
having count(*) > 1



      
    ) dbt_internal_test