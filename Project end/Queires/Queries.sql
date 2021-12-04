--1
SELECT c.customer_id, c.customer_name, c.email FROM customers c
JOIN payments pay
ON c.customer_id = pay.customer_id
JOIN buys b
ON pay.payment_id = b.payment_id
JOIN shipment s
ON b.buy_id = s.buy_id
WHERE lower(s.company_name) = 'usps'
AND s.tracking_number = 123456;

SELECT p.product_name, p.product_price, b.buy_amount FROM products p
JOIN buys b
ON p.product_id = b.products_id
JOIN payments pay
ON b.payment_id = pay.payment_id
JOIN customers c
ON pay.customer_id = c.customer_id
WHERE c.customer_id = 4;

insert into buys (buy_id, buy_amount, products_id, payment_id) values (4, 4, 4, 4);
insert into shipment (shipment_id, company_name, phone_number, tracking_number, buy_id, arrival_date, received_date) values (3, 'USPS', '87716547895', 123456, 4, '03.11.2020', '03.11.2020');


--2
SELECT c.customer_id, c.customer_name, MAX(p.product_price) as maxp from customers c
JOIN payments pay
ON c.customer_id = pay.customer_id
JOIN buys b
ON pay.payment_id = b.payment_id
JOIN products p
ON p.product_id = b.products_id
WHERE pay.date_of_payment BETWEEN '01.01.2020' AND '31.12.2020'
GROUP BY c.customer_id
ORDER BY maxp desc limit 1;


--3
SELECT DISTINCT p.product_name, p.product_id, (SUM(b.buy_amount) * p.product_price) as dollar_amount FROM products p
JOIN buys b
ON p.product_id = b.products_id
JOIN payments pay
ON pay.payment_id = b.payment_id
WHERE pay.date_of_payment BETWEEN '01.01.2020' AND '31.12.2020'
GROUP BY p.product_id, ROLLUP(p.product_id)
ORDER by dollar_amount DESC LIMIT 2;

--4
SELECT DISTINCT p.product_name, p.product_id, SUM(b.buy_amount) as amount FROM products p
JOIN buys b
ON p.product_id = b.products_id
JOIN payments pay
ON pay.payment_id = b.payment_id
WHERE pay.date_of_payment BETWEEN '01.01.2020' AND '31.12.2020'
GROUP BY p.product_id, ROLLUP(p.product_id)
ORDER by amount DESC LIMIT 2;

--5
SELECT p.product_name FROM products p
JOIN inventory i
ON p.inventory_id = i.inventory_id
JOIN shop s
ON i.shop_id = s.shop_id
WHERE i.inventory_reserve = 0 and lower(s.city) = 'california';



--6
SELECT s.shipment_id, s.arrival_date, s.received_date FROM shipment s
WHERE s.arrival_date < s.received_date;

--7
SELECT distinct c.customer_name, SUM(pay.total_sum) as bill FROM payments pay
JOIN customers c
ON pay.customer_id = c.customer_id
GROUP BY c.customer_name, ROLLUP(c.customer_name);