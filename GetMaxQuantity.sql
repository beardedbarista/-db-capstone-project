CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity`()
select max(Quantity) AS 'Max Quantity in Orders' from orders