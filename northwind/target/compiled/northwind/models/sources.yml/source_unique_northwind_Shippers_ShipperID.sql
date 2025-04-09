
    
    

select
    ShipperID as unique_field,
    count(*) as n_records

from raw.northwind.Shippers
where ShipperID is not null
group by ShipperID
having count(*) > 1


