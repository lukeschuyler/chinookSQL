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
SELECT BillingCountry, COUNT(*)
FROM Invoice
GROUP BY BillingCountry

-- 15.
SELECT COUNT(pt.PlaylistId), p.Name
FROM PlaylistTrack pt, Playlist p
ON pt.PlaylistId = p.PlaylistId
GROUP BY (pt.PlaylistId)

-- 16.
SELECT t.Name AS 'Track Name', 
al.Title AS 'Album Name', 
g.Name AS 'Genre', 
mt.Name AS 'MediaType'
FROM Track t, Album al, Genre g, MediaType mt
ON t.AlbumId = al.AlbumId 
AND t.GenreId = g.GenreId 
AND t.MediaTypeId = mt.MediaTypeId

-- 17. 
SELECT i.*, COUNT(il.InvoiceId)
FROM Invoice i, InvoiceLine il
ON i.InvoiceId = il.InvoiceId
GROUP BY (i.InvoiceId)

-- 18.
SELECT e.FirstName, e.LastName, SUM (i.Total)
FROM Employee e, Invoice i, Customer c
ON e.EmployeeId = c.SupportRepId AND i.CustomerId = c.CustomerId
GROUP BY (e.EmployeeId)

-- 19.
SELECT e.FirstName, e.LastName, SUM (i.Total)
FROM Employee e, Invoice i, Customer c
ON e.EmployeeId = c.SupportRepId AND i.CustomerId = c.CustomerId
WHERE substr (i.InvoiceDate, 1, 4) = '2009'
GROUP BY (e.EmployeeId)
ORDER BY -i.Total
LIMIT 1
