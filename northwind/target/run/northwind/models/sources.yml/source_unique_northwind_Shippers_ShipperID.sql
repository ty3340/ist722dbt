select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    ShipperID as unique_field,
    count(*) as n_records

from raw.northwind.Shippers
where ShipperID is not null
group by ShipperID
having count(*) > 1



      
    ) dbt_internal_test