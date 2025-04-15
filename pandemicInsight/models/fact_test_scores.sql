
-- models/fact_test_scores.sql

with base as (
    select
        year,
        state,
        grade,
        subject,
        testscore_belowbasic,
        testscore_atbasic,
        testscore_atproficient,
        testscore_atadvanced,
        averagescore
    from {{ source('pandemic_insight', 'testscorebystate') }}
),

with_date as (
    select
        d.datekey,
        b.*
    from base b
    join {{ ref('dim_date') }} d
        on b.year = d.year
),

with_region as (
    select
        b.datekey,
        r.regionkey,
        b.grade,
        b.subject,
        b.testscore_belowbasic,
        b.testscore_atbasic,
        b.testscore_atproficient,
        b.testscore_atadvanced,
        b.averagescore
    from with_date b
    join {{ ref('dim_region') }} r
        on b.state = r.region
),

final as (
    select
        r.datekey,
        r.regionkey,
        gs.gradesubject_key,
        r.testscore_belowbasic,
        r.testscore_atbasic,
        r.testscore_atproficient,
        r.testscore_atadvanced,
        r.averagescore
    from with_region r
    join {{ ref('dim_gradesubject') }} gs
        on r.grade = gs.grade
       and r.subject = gs.subject
)

select * from final

