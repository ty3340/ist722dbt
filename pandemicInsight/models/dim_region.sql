with testscore_states as (
    select distinct state from {{ source('pandemic_insight', 'testscorebystate') }}
),
covid_states as (
    select distinct state from {{ source('pandemic_insight', 'covidbystate') }}
),
all_states as (
    select state from testscore_states
    union
    select state from covid_states
),
ranked_states as (
    select
        state as region,
        dense_rank() over (order by state) as regionkey
    from all_states
)
select
    regionkey,
    region 
from ranked_states
order by regionkey
