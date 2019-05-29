CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_MARINA_PAYMENT_QUOTATION_DEBT`
(
    _marina_quotation_id INT,
    _marina_payment_id INT,
    _marina_quotation_debt_id INT,
    _client_id VARCHAR(10)
)

BEGIN

INSERT INTO  Marina_Payment_Quotation_Debt
(
    marina_quotation_id,
    marina_payment_id,
    marina_quotation_debt_id,
    client_id
)
VALUES
(
    _marina_quotation_id,
    _marina_payment_id,
    _marina_quotation_debt_id,
    _client_id
);

END