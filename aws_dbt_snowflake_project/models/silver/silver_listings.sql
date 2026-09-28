{{ 
    config(
        materialized='incremental', 
        unique_key='listing_id'
    ) 
}}

select 
    listing_id,
    {{ trimmer('host_id', 'silver_listings') }},
    {{ trimmer('property_type', 'silver_listings') }},
    {{ trimmer('room_type', 'silver_listings') }},
    {{ trimmer('city', 'silver_listings') }},
    {{ trimmer('country', 'silver_listings') }},
    accommodates,
    bathrooms,
    bedrooms,
    price_per_night,
    {{ tag('CAST(price_per_night AS INT)') }} as price_tag,
    created_at
from {{ ref('bronze_listings') }}
