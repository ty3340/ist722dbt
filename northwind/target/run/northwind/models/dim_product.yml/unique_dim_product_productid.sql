select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    productid as unique_field,
    count(*) as n_records

from analytics.dbt_ty3340_northwind.dim_product
where productid is not null
group by productid
having count(*) > 1



      
    ) dbt_internal_test