/* FOREIGN KEYS de las tablas del modelo de negocio "Boats".

reglas de convención de FK:

FK_[nombre de la tabla que tiene dependencia de]_[nombre del PK de la tabla padre]
*/

ALTER TABLE Marina_Quotations ADD FOREIGN KEY(boat_id) REFERENCES Boats(boat_id);
ALTER TABLE Marina_Quotations ADD FOREIGN KEY(marina_quotation_status_id) REFERENCES Marina_Quotation_Status(marina_quotation_status_id);
ALTER TABLE Marina_Quotations ADD FOREIGN KEY(marina_mooring_rate_id) REFERENCES Marina_Mooring_Rates(marina_mooring_rate_id);
ALTER TABLE Marina_Quotations ADD FOREIGN KEY(marina_electricity_sales_id) REFERENCES Marina_Electricity_Sales(marina_electricity_sales_id);

ALTER TABLE Marina_Mooring_Rates ADD FOREIGN KEY(marina_mooring_rate_type_id) REFERENCES Marina_Mooring_Rates_Types(marina_mooring_rate_type_id);

ALTER TABLE Marina_Quotation_Services ADD FOREIGN KEY(boat_id) REFERENCES Boats(boat_id);
ALTER TABLE Marina_Quotation_Services ADD FOREIGN KEY(marina_service_id) REFERENCES Marina_Services(marina_service_id);

ALTER TABLE Marina_Payment_Services ADD FOREIGN KEY(marina_quotation_service_id) REFERENCES Marina_Quotation_Services(marina_quotation_service_id);
ALTER TABLE Marina_Payment_Services ADD FOREIGN KEY(payment_method_id) REFERENCES Payment_Methods(payment_method_id);
ALTER TABLE Marina_Payment_Services ADD FOREIGN KEY(client_id) REFERENCES Clients(client_id);

ALTER TABLE Marina_Payment_Quotation_Debt ADD FOREIGN KEY(marina_quotation_id) REFERENCES Marina_Quotation(marina_quotation_id);
ALTER TABLE Marina_Payment_Quotation_Debt ADD FOREIGN KEY(marina_payment_id) REFERENCES Marina_Payments(marina_payment_id);
ALTER TABLE Marina_Payment_Quotation_Debt ADD FOREIGN KEY(marina_quotation_debt_id) REFERENCES Marina_Quotation_Debts(marina_quotation_debt_id);
ALTER TABLE Marina_Payment_Quotation_Debt ADD FOREIGN KEY(client_id) REFERENCES Clients(client_id);

ALTER TABLE Marina_Payments ADD FOREIGN KEY(payment_method_id) REFERENCES Payment_Methods(payment_method_id);

ALTER TABLE Marina_Payment_Moratorium_Charge ADD FOREIGN KEY(marina_moratorium_charge_id) REFERENCES Marina_Moratorium_Charge(marina_moratorium_charge_id);
ALTER TABLE Marina_Payment_Moratorium_Charge ADD FOREIGN KEY(marina_payment_id) REFERENCES Marina_Payments(marina_payment_id);
ALTER TABLE Marina_Payment_Moratorium_Charge ADD FOREIGN KEY(marina_quotation_id) REFERENCES Marina_Quotation(marina_quotation_id);
ALTER TABLE Marina_Payment_Moratorium_Charge ADD FOREIGN KEY(client_id) REFERENCES Clients(client_id);

ALTER TABLE Marina_Moratorium_Charge ADD FOREIGN KEY(marina_quotation_id) REFERENCES Marina_Quotation(marina_quotation_id);

ALTER TABLE Marina_Quotation_Debts ADD FOREIGN KEY(marina_quotation_id) REFERENCES Marina_Quotation(marina_quotation_id);

/* Slips -> Slip_Types */
ALTER TABLE slips
ADD CONSTRAINT FK_slips_slip_type_id
FOREIGN KEY (slip_type_id) REFERENCES slip_types(slip_type_id);

/* Slips_Occupation -> Boats */
ALTER TABLE slips_occupation
ADD CONSTRAINT FK_slips_occupation_boat_id
FOREIGN KEY (boat_id) REFERENCES boats(boat_id);

/* Slips_Occupation -> Slips */
ALTER TABLE slips_occupation
ADD CONSTRAINT FK_slips_occupation_slip_id
FOREIGN KEY (slip_id) REFERENCES slips(slip_id);