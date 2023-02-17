#SQL subquery to determine what cuisine has been ordered more than once
select Cuisine from menus where MenuID = any (select MenuID from orders where Quantity > 1);