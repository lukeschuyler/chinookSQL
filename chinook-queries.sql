-- 1.
SELECT CustomerId, Firstname, LastName, Country
FROM Customer
WHERE Country != 'USA'

-- 2.
SELECT CustomerId, Firstname, LastName, Country
FROM Customer
WHERE Country = 'Brazil'

-- 3.
SELECT c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Customer c, Invoice i 
WHERE c.Country = 'Brazil'

-- 4.
SELECT * FROM employee
WHERE title = 'Sales Support Agent'

-- 5.
SELECT DISTINCT BillingCountry
FROM  Invoice

-- 6.
SELECT *
FROM Invoice i, Customer c
WHERE c.Country = 'Brazil'
