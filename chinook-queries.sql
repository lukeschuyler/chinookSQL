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

-- 7.
SELECT i.*, e.FirstName AS 'Employee FirstName', e.LastName AS 'Employee LastName'
FROM Invoice i 
LEFT JOIN Employee e
WHERE e.Title = 'Sales Support Agent'

-- 8. ??? YALKED TO JOE, KINDA VAGUE
SELECT i.Total, 
c.FirstName AS 'Cust FirstName', 
c.LastName AS 'Cust LastName', 
i.BillingCountry, 
e.FirstName AS 'Emp FirstName', 
e.LastName AS 'Emp LastName'
FROM Invoice i 
LEFT JOIN Customer c 
LEFT JOIN Employee e

-- 9.
SELECT InvoiceDate, COUNT(*), SUM(Total)
FROM Invoice
WHERE substr (InvoiceDate,1, 4) = '2009' 
OR substr (InvoiceDate,1, 4) = '2011'
GROUP BY (substr (InvoiceDate,1, 4))

-- 10.
SELECT InvoiceId, COUNT(InvoiceId)
FROM InvoiceLine
WHERE InvoiceId = '37'

-- 11.
SELECT InvoiceId, COUNT(InvoiceId)
FROM InvoiceLine
GROUP BY InvoiceId

-- 12.
SELECT i.*, t.Name AS 'Track Name'
FROM InvoiceLine i, Track t
ON i.TrackId = t.TrackId

-- 13.
SELECT i.*, t.Name AS 'Track Name', ar.Name AS 'Artist Name'
FROM InvoiceLine i, Track t, Artist ar, Album al
ON i.TrackId = t.TrackId 
AND al.ArtistId = ar.ArtistId 
AND al.AlbumId = t.AlbumId

-- 14.
