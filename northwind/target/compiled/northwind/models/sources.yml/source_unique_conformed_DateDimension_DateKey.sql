
    
    

select
    DateKey as unique_field,
    count(*) as n_records

from raw.conformed.DateDimension
where DateKey is not null
group by DateKey
having count(*) > 1


