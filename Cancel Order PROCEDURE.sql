CREATE PROCEDURE `CancelOrder`(InputOrderID INT)
BEGIN
update orders
set OrderStatus = 'Your order has been cancelled'
where OrderID = InputOrderID;
select OrderID, OrderStatus
from orders
where OrderStatus = 'Your order has been cancelled';
END