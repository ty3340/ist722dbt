SELECT {{ dbt_utils.generate_surrogate_key(['p.ProductID'])}} 
       as productkey, ProductID, ProductName, SupplierID
    ,CategoryName, [Description] as categorydescription
  FROM {{source('northwind', 'Products')}} p 
     join {{source('northwind','Categories')}} c on p.CategoryID = c.CategoryID


