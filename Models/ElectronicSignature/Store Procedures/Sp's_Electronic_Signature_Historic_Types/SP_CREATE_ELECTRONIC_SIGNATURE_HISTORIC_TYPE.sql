CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CREATE_ELECTRONIC_SIGNATURE_HISTORIC_TYPE`
(
    _type VARCHAR(100)
)

BEGIN

INSERT INTO Electronic_Signature_Historic_Types
(
    type
)
VALUES
(
    _type
);

END