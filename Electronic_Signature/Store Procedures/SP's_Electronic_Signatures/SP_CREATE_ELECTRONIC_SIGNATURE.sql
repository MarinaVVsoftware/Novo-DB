CREATE PROCEDURE `SP_CREATE_ELECTRONIC_SIGNATURES`
(
    _signature INT,
    _attemps INT,
    _attemps_reset_date DATETIME
)

BEGIN

INSERT INTO Electonic_Signatures
(
    signature,
    attemps,
    attemps_reset_date
)
VALUES
(
    _signature,
    _attemps,
    _attemps_reset_date
);

END