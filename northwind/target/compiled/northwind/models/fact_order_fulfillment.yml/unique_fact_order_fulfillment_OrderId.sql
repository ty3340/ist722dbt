
    
    

select
    OrderId as unique_field,
    count(*) as n_records

from analytics.dbt_ty3340_northwind.fact_order_fulfillment
where OrderId is not null
group by OrderId
having count(*) > 1


