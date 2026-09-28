{{
    config(
        materialized='ephemeral'
    )
}}
with bookings as (
    select
    Booking_id,
    Booking_date,
    booking_status,
    created_at
    from {{ref('obt')}}
)
select * from bookings