select * 
from {{ ref('fct_reviews') }} as f
left join {{ref('dim_listings_cleansed')}} as d
on f.listing_id = d.listing_id
where try_cast(d.created_at as timestamp) > f.review_date
limit 10
