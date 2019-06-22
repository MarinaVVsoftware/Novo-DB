/* SP SP_PaymentMethods_GetMethods: Trae los métodos de pago. */
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PaymentMethods_GetMethods`()
BEGIN
    SELECT * FROM payment_methods
    ORDER BY payment_method_id ASC;
END