DROP TABLE IF EXISTS marina_quotation_service_types;
DROP TABLE IF EXISTS marina_quotation_services;

DROP TABLE IF EXISTS marina_quotation_timeline_types;
DROP TABLE IF EXISTS marina_quotation_timeline;

DROP TABLE IF EXISTS notification_status;
DROP TABLE IF EXISTS notification_types;
DROP TABLE IF EXISTS notifications;

/* slip_types depende de slips, y slip_occupation depende de slips */
DROP TABLE IF EXISTS slips_occupation;
DROP TABLE IF EXISTS slips;
DROP TABLE IF EXISTS slip_types;

DROP TABLE IF EXISTS marina_quotation_electricity;
DROP TABLE IF EXISTS marina_mooring_tariff_types;
DROP TABLE IF EXISTS marina_mooring_tariff;

DROP TABLE IF EXISTS marina_quotation_status;
DROP TABLE IF EXISTS marina_quotations;