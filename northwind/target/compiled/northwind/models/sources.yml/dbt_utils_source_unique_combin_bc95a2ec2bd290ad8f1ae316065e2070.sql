





with validation_errors as (

    select
        OrderId, ProductId
    from raw.northwind.Order_Details
    group by OrderId, ProductId
    having count(*) > 1

)

select *
from validation_errors


