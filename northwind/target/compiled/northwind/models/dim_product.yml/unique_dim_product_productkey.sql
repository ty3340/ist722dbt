
    
    

select
    productkey as unique_field,
    count(*) as n_records

from analytics.dbt_ty3340_northwind.dim_product
where productkey is not null
group by productkey
having count(*) > 1


