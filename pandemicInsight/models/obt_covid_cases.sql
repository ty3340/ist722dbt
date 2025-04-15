-- models/obt_covid_cases.sql

with base as (
    select *
    from {{ ref('fact_covid_cases') }}
),

joined as (
    select
        f.datekey,
        d.year,
        
        f.regionkey,
        r.region,

        f.total_confirmed,
        f.total_deceased,
        f.total_hospitalized_patients,
        f.total_intensive_care_patients,
        f.total_fully_vaccinated,
        f.total_vaccinated,
        f.total_doses_administered

    from base f
    left join {{ ref('dim_date') }} d
        on f.datekey = d.datekey

    left join {{ ref('dim_region') }} r
        on f.regionkey = r.regionkey
)

select *
from joined
order by year, region
