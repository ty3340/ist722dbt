
    
    

select
    SupplierId as unique_field,
    count(*) as n_records

from raw.northwind.Suppliers
where SupplierId is not null
group by SupplierId
having count(*) > 1


