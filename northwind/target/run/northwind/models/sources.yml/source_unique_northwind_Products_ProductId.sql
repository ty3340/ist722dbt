select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    ProductId as unique_field,
    count(*) as n_records

from raw.northwind.Products
where ProductId is not null
group by ProductId
having count(*) > 1



      
    ) dbt_internal_test