-- models/dim_date.sql

with testscore_years as (
    select distinct year from {{ source('pandemic_insight', 'testscorebystate') }}
),
covid_years as (
    select distinct year from {{ source('pandemic_insight', 'covidbystate') }}
),
all_years as (
    select year from testscore_years
    union
    select year from covid_years
)
select
    year * 10000 + 101 as datekey,
    year
from all_years