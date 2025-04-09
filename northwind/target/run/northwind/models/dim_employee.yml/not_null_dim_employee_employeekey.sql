select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select employeekey
from analytics.dbt_ty3340_northwind.dim_employee
where employeekey is null



      
    ) dbt_internal_test