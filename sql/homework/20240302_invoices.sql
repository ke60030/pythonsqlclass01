CREATE TABLE IF NOT EXISTS invoices(
	InvoiceId SERIAL,
	CustomerId INT,
	InvoiceDate TIMESTAMP,
	BillingAddress VARCHAR(200),
	BillingCity VARCHAR(100),
	BillingState VARCHAR(20),
	BillingCountry VARCHAR(100),
	BillingPostalCode VARCHAR(50),
	Total FLOAT,
	PRIMARY KEY(InvoiceId)
);
select * from invoices
