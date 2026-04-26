{{
  config(
    materialized = 'view'
  )
}}
with src_listings as(
    select * from {{ref('src_listings')}}
)
select
  listing_id,
  listing_name,
  listing_url,
  room_type,
  case when try_cast(minimum_nights as int) = 0 then 1
       else try_cast(minimum_nights as int)
       end as minimum_nights,
  host_id,
  replace(price_str, '$', '')::decimal(18,2) as price,
  created_at,
  updated_at
from src_listings