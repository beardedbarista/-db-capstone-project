CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN inputbookingdate DATE, IN TableNumber INT)
SELECT concat("No tables available")
WHERE exists 
(SELECT * from bookings where inputbookingdate = BookingDate and TableNo = TableNumber)