select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    SupplierId as unique_field,
    count(*) as n_records

from raw.northwind.Suppliers
where SupplierId is not null
group by SupplierId
having count(*) > 1



      
    ) dbt_internal_test