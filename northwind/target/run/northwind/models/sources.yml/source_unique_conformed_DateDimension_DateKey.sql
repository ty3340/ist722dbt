select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    DateKey as unique_field,
    count(*) as n_records

from raw.conformed.DateDimension
where DateKey is not null
group by DateKey
having count(*) > 1



      
    ) dbt_internal_test