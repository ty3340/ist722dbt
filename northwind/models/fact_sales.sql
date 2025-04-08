select 
    {{ dbt_utils.generate_surrogate_key(['o.employeeid']) }} as employeekey, 
    {{ dbt_utils.generate_surrogate_key(['o.customerid']) }} as customerkey,
    replace(to_date(orderdate)::varchar,'-','')::int as orderdatekey, 
    {{ dbt_utils.generate_surrogate_key(['od.ProductID']) }} as productkey, 
    od.quantity,
    o.orderid,
    od.quantity * od.unitprice as extendedpriceamount,
    od.quantity * od.unitprice * od.discount as discountamount,
    od.quantity * od.unitprice * (1-od.discount) as soldamount
from {{source('northwind','Orders')}} o
    join {{source('northwind','Order_Details')}} od on o.orderid = od.orderid
