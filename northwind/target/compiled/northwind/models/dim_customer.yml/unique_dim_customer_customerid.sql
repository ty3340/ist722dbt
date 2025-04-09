
    
    

select
    customerid as unique_field,
    count(*) as n_records

from analytics.dbt_ty3340_northwind.dim_customer
where customerid is not null
group by customerid
having count(*) > 1


