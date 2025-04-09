select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        OrderId, ProductId
    from raw.northwind.Order_Details
    group by OrderId, ProductId
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test