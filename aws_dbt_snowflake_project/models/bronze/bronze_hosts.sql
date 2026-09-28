{# {% set incremental_flag = 1 %}
{% set incremental_col ='CREATED_AT' %}

select * from {{ source('Stagging', 'hosts') }}
{% if incremental_flag == 1 %}
    where {{ incremental_col }} > (select coalesce(max({{ incremental_col }}), '1970-01-01') from {{ref('bronze_hosts')}})
{% endif %} #}


{{config(materialized='incremental')}}
select * from {{ source('Stagging', 'hosts') }}

{% if is_incremental() %}
  where CREATED_AT > (select coalesce(max(CREATED_AT), '1970-01-01') from {{ this }})
{% endif %}