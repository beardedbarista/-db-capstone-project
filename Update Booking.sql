CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(ID INT, bookdate date)
BEGIN
update bookings
set BookingDate = bookdate
where BookingID = ID;
select 'Booking ID ', ID, ' has been successfully updated' Confirmation;
END