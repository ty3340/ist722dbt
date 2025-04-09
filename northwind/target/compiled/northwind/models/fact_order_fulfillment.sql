with stg_orders as 
(
    select
        OrderID,  
        md5(cast(coalesce(cast(employeeid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as employeekey, 
        md5(cast(coalesce(cast(customerid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customerkey, 
        replace(to_date(orderdate)::varchar,'-','')::int as orderdatekey,
        replace(to_date(shippeddate)::varchar,'-','')::int as shippeddatekey,
        replace(to_date(requireddate)::varchar,'-','')::int as requireddatekey,
        shipname,
        shipaddress,
        shipcity,
        shipregion,
        shippostalcode,
        shipcountry,
        freight,
        shipvia
    from raw.northwind.Orders
),
stg_order_details as
(
    select 
        orderid,
        sum(Quantity) as quantityonorder, 
        sum(Quantity*UnitPrice*(1-Discount)) as totalorderamount
    from raw.northwind.Order_Details
    group by orderid
),
stg_shippers as (
    select * from raw.northwind.Shippers
)
select  
    o.*,
    s.companyname as shippercompanyname,
    od.quantityonorder, od.totalorderamount,
    o.shippeddatekey - o.orderdatekey as daysfromordertoshipped,
    o.requireddatekey - o.orderdatekey as daysfromordertorequired,
    o.shippeddatekey - o.requireddatekey as shippedtorequireddelta,
    case when o.shippeddatekey - o.requireddatekey <=0 then 'Y' else 'N' end as shippedontime
from stg_orders o
    join stg_order_details od on o.orderid = od.orderid
    join stg_shippers s on s.shipperid = o.shipvia