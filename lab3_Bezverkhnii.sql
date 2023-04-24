--1a
SELECT BOOKS.title, PUBLISHER.name, PUBLISHER.phone
FROM BOOKS, PUBLISHER 
WHERE BOOKS.pubid = PUBLISHER.pubid;
--1b
SELECT b.title, p.name, p.phone
FROM BOOKS b
JOIN PUBLISHER p USING (pubid);
--2a
SELECT o.order#, c.firstname || ' ' || c.lastname AS customer_name
FROM ORDERS o, CUSTOMERS c
WHERE o.shipdate IS NULL AND o.customer# = c.customer#
ORDER BY o.orderdate;
--2b
SELECT o.order#, c.firstname || ' ' || c.lastname AS customer_name
FROM ORDERS o
JOIN CUSTOMERS c ON o.customer# = c.customer#
WHERE o.shipdate IS NULL
ORDER BY o.orderdate;
--3a
SELECT DISTINCT c.customer#, c.firstname, c.lastname
FROM CUSTOMERS c, ORDERS o, BOOKS b, ORDERITEMS i
WHERE c.state = 'FL'
AND c.customer# = o.customer#
AND o.order# = i.order#
AND i.isbn = b.isbn
AND b.category = 'COMPUTER';
--3b
SELECT DISTINCT c.customer#, c.firstname, c.lastname
FROM CUSTOMERS c
JOIN ORDERS o ON c.customer# = o.customer#
JOIN ORDERITEMS i ON o.order# = i.order#
JOIN BOOKS b ON i.isbn = b.isbn
WHERE c.state = 'FL'
AND b.category = 'COMPUTER';
--4a
SELECT DISTINCT b.title
FROM BOOKS b, ORDERS o, CUSTOMERS c, ORDERITEMS i
WHERE c.firstname || ' ' || c.lastname = 'JAKE LUCAS'
AND c.customer# = o.customer#
AND o.order# = i.order#
AND b.isbn = i.isbn;
--4b
SELECT DISTINCT b.title
FROM BOOKS b
JOIN ORDERITEMS i ON b.isbn = i.isbn
JOIN ORDERS o ON i.order# = o.order#
JOIN CUSTOMERS c ON o.customer# = c.customer#
WHERE c.firstname || ' ' || c.lastname = 'JAKE LUCAS';
--5a
SELECT o.orderdate, b.title, i.paideach - b.cost AS profit
FROM BOOKS b, ORDERS o, CUSTOMERS c, ORDERITEMS i
WHERE c.firstname || ' ' || c.lastname = 'JAKE LUCAS'
AND c.customer# = o.customer#
AND o.order# = i.order#
AND b.isbn = i.isbn
ORDER BY o.orderdate, profit DESC;
--5b
SELECT o.orderdate, b.title, i.paideach - b.cost AS profit
FROM BOOKS b
JOIN ORDERITEMS i ON b.isbn = i.isbn
JOIN ORDERS o ON i.order# = o.order#
JOIN CUSTOMERS c ON o.customer# = c.customer#
WHERE c.firstname || ' ' || c.lastname = 'JAKE LUCAS'
ORDER BY o.orderdate, profit DESC;
--6a
SELECT b.title
FROM BOOKAUTHOR s, Books b, AUTHOR a
WHERE a.lname='ADAMS'
AND b.isbn = s.isbn
AND a.authorid = s.authorid;
--6b
SELECT b.title
FROM AUTHOR a
JOIN BOOKAUTHOR s ON a.authorid = s.authorid
JOIN BOOKS b ON b.isbn = s.isbn
WHERE a.lname='ADAMS';
--7a
SELECT p.gift
FROM PROMOTION P, BOOKS b
WHERE b.retail Between p.minretail and p.maxretail
AND b.title = 'SHORTEST POEMS';
--7b
SELECT gift
FROM Promotion
INNER JOIN BOOKS ON BOOKS.retail Between promotion.minretail and promotion.maxretail
WHERE BOOKS.title = 'SHORTEST POEMS';
--8a
SELECT a.lname, a.fname, b.title FROM books b, orders o, orderitems i, customers c, bookauthor t, author a
WHERE c.customer# = o.customer#
AND firstname = 'BECCA'
AND lastname = 'NELSON'
AND o.order# = i.order#
AND i.isbn = b.isbn
AND b.isbn = t.isbn
AND t.authorid = a.authorid;
--8b
SELECT a.lname, a.fname, b.title FROM customers c JOIN orders o ON c.customer# = o.customer#
JOIN orderitems i ON o.order# = i.order#
JOIN books b ON i.isbn = b.isbn JOIN bookauthor t ON b.isbn = t.isbn JOIN author a ON t.authorid = a.authorid
WHERE firstname = 'BECCA' AND lastname = 'NELSON';
--9a
SELECT title, NULL AS order#, NULL AS state
FROM BOOKS
UNION ALL
SELECT b.title, o.order#, c.state
FROM ORDERITEMS i, BOOKS b, ORDERS o, Customers c
WHERE i.isbn = b.isbn
AND i.order# = o.order#
AND o.customer# = c.customer#;
--9b
SELECT b.title, o.order#, c.state
FROM BOOKS b
LEFT OUTER JOIN ORDERITEMS i ON b.isbn = i.isbn
LEFT OUTER JOIN ORDERS o ON i.order# = o.order#
LEFT OUTER JOIN Customers c ON o.customer# = c.customer#;


 