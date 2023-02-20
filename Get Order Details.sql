prepare GetOrderDetail FROM 'select OrderID, Quantity, BillAmount from orders where BookingID = ?';
set @ID = 1;
execute GetOrderDetail using @id;