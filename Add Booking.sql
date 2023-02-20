CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(BookID int, BookDate DATE, FirstName varchar (100), LastName varchar (100), TableNumber int)
BEGIN
insert into bookings (BookingID, BookingDate, GuestFirstName, GuestLastName,TableNo)
values (BookID, BookDate, FirstName, LastName, TableNumber);

select 'New booking added' Confirmation;

END