
    
    

select
    ProductId as unique_field,
    count(*) as n_records

from raw.northwind.Products
where ProductId is not null
group by ProductId
having count(*) > 1


