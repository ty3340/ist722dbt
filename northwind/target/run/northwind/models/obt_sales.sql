
  
    

        create or replace transient table analytics.dbt_ty3340_northwind.obt_sales
         as
        (with f_sales as (
    select * from analytics.dbt_ty3340_northwind.fact_sales
),
d_customer as (
    select * from analytics.dbt_ty3340_northwind.dim_customer
),
d_employee as (
    select * from analytics.dbt_ty3340_northwind.dim_employee
),
d_date as (
    select * from analytics.dbt_ty3340_northwind.dim_date
),
d_product as(
    select * from analytics.dbt_ty3340_northwind.dim_product

)
select 
    d_customer.*, 
    d_employee.*, 
    d_date.*,
    d_product.*, 
    f.quantity,
    f.orderid,
    f.extendedpriceamount,
    f.discountamount,
    f.soldamount
    from f_sales as f
    left join d_customer on f.customerkey = d_customer.customerkey
    left join d_employee on f.employeekey = d_employee.employeekey
    left join d_product on f.productkey = d_product.productkey
    left join d_date on f.orderdatekey = d_date.datekey
        );
      
  