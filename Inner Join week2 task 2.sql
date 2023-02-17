#join 4 tables to extract details on bills over$40
Select bookings.BookingID, bookings.GuestFirstName, bookings.GuestLastName, orders.OrderID, orders.BillAmount, menuitems.Name, menus.Cuisine
from bookings
inner join orders on bookings.BookingID = orders.BookingID
inner join menus on orders.MenuID = menus.MenuID
inner join menuitems on menus.ItemID = menuitems.ItemID
where orders.BillAmount > 40;
