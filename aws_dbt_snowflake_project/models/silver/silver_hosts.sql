{{ 
    config(
        materialized='incremental', 
        unique_key='host_id'
    ) 
}}

select 
    host_id,
    Replace(host_name, ' ', '_') as host_name,
    host_since,
    is_superhost,
    case
        when response_rate > 95 then 'fair'
        when response_rate > 80 then 'good'
        when response_rate > 50 then 'average'
        else 'poor'
        end as response_rate_quality,
    created_at
from {{ ref('bronze_hosts') }}
