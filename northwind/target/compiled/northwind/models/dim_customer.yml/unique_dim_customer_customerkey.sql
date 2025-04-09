
    
    

select
    customerkey as unique_field,
    count(*) as n_records

from analytics.dbt_ty3340_northwind.dim_customer
where customerkey is not null
group by customerkey
having count(*) > 1


