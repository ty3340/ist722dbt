-- models/dim_gradesubject.sql

with distinct_combinations as (
    select distinct
        grade,
        subject
    from {{ source('pandemic_insight', 'testscorebystate') }}
),
ranked as (
    select
        dense_rank() over (order by grade, subject) as gradesubject_key,
        grade,
        subject
    from distinct_combinations
)
select *
from ranked
order by gradesubject_key