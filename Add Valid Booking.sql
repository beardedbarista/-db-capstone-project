CREATE DEFINER=`root`@`localhost` PROCEDURE `AddValidBooking`(IN inputbookingdate DATE, IN TableNumber INT)
BEGIN
declare validate int;
	start transaction;
    select BookingID into validate
    from bookings
    where BookingDate = inputbookingdate and TableNo = TableNumber;
	insert into bookings (BookingID, BookingDate,TableNo) 
	values (7, inputbookingdate, TableNumber);
if validate > 0 then
    rollback;
    select concat('Table ', TableNumber,' is already booked - booking cancelled') AS 'Booking Status';
	else
    commit;
    select concat ('Reservation booked sucessfully for ', BookingDate) as 'Booking Status';
end if;
end