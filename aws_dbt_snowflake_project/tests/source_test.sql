{{config(
    severity='warn',
    tags=['source_test']
)}}

select
1 
from {{source('Stagging','bookings')}}
where 
    Booking_amount > 200