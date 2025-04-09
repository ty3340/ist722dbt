select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    CategoryId as unique_field,
    count(*) as n_records

from raw.northwind.Categories
where CategoryId is not null
group by CategoryId
having count(*) > 1



      
    ) dbt_internal_test