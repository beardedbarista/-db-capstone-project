CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking`(ID int)
BEGIN
delete from bookings where BookingID = ID;
Select 'Your reservation has been canceled' Confirmation;
END