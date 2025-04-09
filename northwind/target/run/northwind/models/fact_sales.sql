
  
    

        create or replace transient table analytics.dbt_ty3340_northwind.fact_sales
         as
        (select 
    md5(cast(coalesce(cast(o.employeeid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as employeekey, 
    md5(cast(coalesce(cast(o.customerid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customerkey,
    replace(to_date(orderdate)::varchar,'-','')::int as orderdatekey, 
    md5(cast(coalesce(cast(od.ProductID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as productkey, 
    od.quantity,
    o.orderid,
    od.quantity * od.unitprice as extendedpriceamount,
    od.quantity * od.unitprice * od.discount as discountamount,
    od.quantity * od.unitprice * (1-od.discount) as soldamount
from raw.northwind.Orders o
    join raw.northwind.Order_Details od on o.orderid = od.orderid
        );
      
  