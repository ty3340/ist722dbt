select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    OrderId as unique_field,
    count(*) as n_records

from raw.northwind.Orders
where OrderId is not null
group by OrderId
having count(*) > 1



      
    ) dbt_internal_test