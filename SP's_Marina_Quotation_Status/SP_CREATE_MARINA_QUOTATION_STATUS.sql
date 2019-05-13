CREATE PROCEDURE `SP_CREATE_MARINA_QUOTATION_STATUS`
(
    _status VARCHAR(50)
)

BEGIN

INSERT INTO Marina_Quotation_Status
(
    status
)
VALUES
(
    _status
);

END