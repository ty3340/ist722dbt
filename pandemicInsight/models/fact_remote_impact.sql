-- models/fact_remote_impact.sql

with source as (
    select
        subject,
        grade,
        year,
        state,
        question,
        answeroption,
        percentage
    from {{ source('pandemic_insight', 'remotelearningbystate') }}
),

with_date as (
    select
        d.datekey,
        s.*
    from source s
    join {{ ref('dim_date') }} d
        on s.year = d.year
),

with_region as (
    select
        s.*,
        r.regionkey
    from with_date s
    join {{ ref('dim_region') }} r
        on s.state = r.region
),

with_gradesubject as (
    select
        s.*,
        gs.gradesubject_key
    from with_region s
    join {{ ref('dim_gradesubject') }} gs
        on s.grade = gs.grade and s.subject = gs.subject
),

final as (
    select
        datekey,
        regionkey,
        gradesubject_key,
        question,
        answeroption,
        percentage
    from with_gradesubject
)

select * from final
