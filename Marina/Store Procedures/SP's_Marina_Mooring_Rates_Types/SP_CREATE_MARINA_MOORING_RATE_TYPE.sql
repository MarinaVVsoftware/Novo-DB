CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_MARINA_MOORING_RATE_TYPE`
(
    _type VARCHAR(100)
)

BEGIN

INSERT INTO Marina_Mooring_Rates_Types
(
    type
)
VALUES
(
     _type
);

END