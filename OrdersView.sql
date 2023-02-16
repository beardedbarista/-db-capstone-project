CREATE VIEW `orderview` AS select OrderID, BillAmount, Quantity
from orders
where quantity > 2;
