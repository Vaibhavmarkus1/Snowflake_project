{% set col = ['nights_booked','Booking_ID','Booking_amount'] %}

select
{% for c in col %}
    {{ c }}
    {% if not loop.last %},{% endif %}
{% endfor %}
from {{ ref('bronze_bookings') }}