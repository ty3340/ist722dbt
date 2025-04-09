with stg_customers as (
    select * from raw.northwind.Customers
)
select  md5(cast(coalesce(cast(stg_customers.customerid as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customerkey, 
    stg_customers.* 
from stg_customers