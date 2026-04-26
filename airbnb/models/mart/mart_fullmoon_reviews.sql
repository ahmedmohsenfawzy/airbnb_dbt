{{
    config(
        materialized = 'table'
    )
}}


with src_reviews as(
    select * from {{ref('fct_reviews')}}
),
fullmoon_review as(
    select * from {{ ref('seed_full_moon_dates') }}
)

select 
    sr.*,
    case
        when f.full_moon_date is null then 'not full moon'
        else 'full moon'
    end as is_full_moon
from src_reviews sr
left join fullmoon_review f
on to_date(sr.review_date) = date_add(to_date(f.full_moon_date), 1)