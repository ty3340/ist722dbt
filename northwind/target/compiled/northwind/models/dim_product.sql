SELECT md5(cast(coalesce(cast(p.ProductID as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) 
       as productkey, ProductID, ProductName, SupplierID
    ,CategoryName, [Description] as categorydescription
  FROM raw.northwind.Products p 
     join raw.northwind.Categories c on p.CategoryID = c.CategoryID