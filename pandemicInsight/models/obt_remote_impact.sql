-- models/obt_remote_impact.sql

with base as (
    select *
    from {{ ref('fact_remote_impact') }}
),

joined as (
    select
        f.datekey,
        d.year,

        f.regionkey,
        r.region,

        f.gradesubject_key,
        gs.grade,
        gs.subject,

        f.question,
        f.answeroption,
        f.percentage

    from base f
    left join {{ ref('dim_date') }} d
        on f.datekey = d.datekey

    left join {{ ref('dim_region') }} r
        on f.regionkey = r.regionkey

    left join {{ ref('dim_gradesubject') }} gs
        on f.gradesubject_key = gs.gradesubject_key
)

select *
from joined
order by year, region, grade, subject, question
