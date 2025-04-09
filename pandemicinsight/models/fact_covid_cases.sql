-- models/fact_covid_cases.sql

with base as (
    select
        year,
        state,
        total_confirmed,
        total_deceased,
        total_hospitalized_patients,
        total_intensive_care_patients,
        total_fully_vaccinated,
        total_vaccinated,
        total_doses_administered
    from {{ source('pandemic_insight', 'covidbystate') }}
),

with_date as (
    select
        d.datekey,
        b.*
    from base b
    join {{ ref('dim_date') }} d
        on b.year = d.year
),

final as (
    select
        b.datekey,
        r.regionkey,
        b.total_confirmed,
        b.total_deceased,
        b.total_hospitalized_patients,
        b.total_intensive_care_patients,
        b.total_fully_vaccinated,
        b.total_vaccinated,
        b.total_doses_administered
    from with_date b
    join {{ ref('dim_region') }} r
        on b.state = r.region
)

select * from final