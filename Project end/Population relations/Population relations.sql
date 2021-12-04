insert into products (product_id, product_name, product_price, product_fabricator, products_brand, category_id, inventory_id) values (1, 'Sneakers', '25000', 'China', 'Nike', '2', '2');
insert into products (product_id, product_name, product_price, product_fabricator, products_brand, category_id, inventory_id) values (2, 'T-shirts', '5000', 'China', 'Adidas', '1', '1');
insert into products (product_id, product_name, product_price, product_fabricator, products_brand, category_id, inventory_id) values (3, 'G-shock', '12000', 'Switzerland', 'Casio', '3', '3');
insert into products (product_id, product_name, product_price, product_fabricator, products_brand, category_id, inventory_id) values (4, 'Huawei P20', '250000', 'China', 'Huawei', '4', '4');
insert into products (product_id, product_name, product_price, product_fabricator, products_brand, category_id, inventory_id) values (5, 'Lenovo 3', '320000', 'China', 'Lenovo', '5', '5');

insert into category (category_id, category_name) values (1, 'Clothes');
insert into category (category_id, category_name) values (2, 'Sneakers');
insert into category (category_id, category_name) values (3, 'Watch');
insert into category (category_id, category_name) values (4, 'Phones');
insert into category (category_id, category_name) values (5, 'Laptops');

insert into inventory (inventory_id, inventory_reserve, inventory_send_quantity, inventory_received_quantity) values (1, 100, 70, 20);
insert into inventory (inventory_id, inventory_reserve, inventory_send_quantity, inventory_received_quantity) values (2, 0, 200, 100);
insert into inventory (inventory_id, inventory_reserve, inventory_send_quantity, inventory_received_quantity) values (3, 180, 60, 90);
insert into inventory (inventory_id, inventory_reserve, inventory_send_quantity, inventory_received_quantity) values (4, 50, 10, 50);
insert into inventory (inventory_id, inventory_reserve, inventory_send_quantity, inventory_received_quantity) values (5, 80, 30, 40);

insert into buys (buy_id, buy_amount, products_id, payment_id) values (1, 3, 1, 1);
insert into buys (buy_id, buy_amount, products_id, payment_id) values (2, 2, 2, 2);
insert into buys (buy_id, buy_amount, products_id, payment_id) values (3, 1, 3, 3);
insert into buys (buy_id, buy_amount, products_id, payment_id) values (4, 4, 4, 4);
insert into buys (buy_id, buy_amount, products_id, payment_id) values (5, 5, 5, 5);



insert into shipment (shipment_id, company_name, phone_number, tracking_number, buy_id, arrival_date, received_date) values (1, 'Joom', '87009876532', 123456, 1, '02.06.2020', '02.06.2020');
insert into shipment (shipment_id, company_name, phone_number, tracking_number, buy_id, arrival_date, received_date) values (2, 'Aliexpress', '87789856321', 123456, 2, '05.09.2020', '07.09.2020');
insert into shipment (shipment_id, company_name, phone_number, tracking_number, buy_id, arrival_date, received_date) values (3, 'USPS', '87716547895', 123456, 4, '03.11.2020', '03.11.2020');
insert into shipment (shipment_id, company_name, phone_number, tracking_number, buy_id, arrival_date, received_date) values (4, 'Kazpochta', '87779632148', 123456, 5, '05.10.2020', '06.10.2020');
insert into shipment (shipment_id, company_name, phone_number, tracking_number, buy_id, arrival_date, received_date) values (5, 'Fedex', '87799517532', 123456, 3, '27.07.2020', '27.07.2020');

insert into shop (shop_id, shop_name, phone_number, city, address, shipment_id) values (1, 'Koton', '87279856585', 'Almaty', 'Semal-2', 4);
insert into shop (shop_id, shop_name, phone_number, city, address, shipment_id) values (2, 'Huawei', '8727852954', 'California', 'Satpaeva', 3);
insert into shop (shop_id, shop_name, phone_number, city, address, shipment_id) values (3, 'Nike', '87271654897', 'Almaty', 'Rozabakieva', 2);
insert into shop (shop_id, shop_name, phone_number, city, address, shipment_id) values (4, 'Casio', '87278963574', 'Almaty', 'Mega', 1);
insert into shop (shop_id, shop_name, phone_number, city, address, shipment_id) values (5, 'Beluy veter', '87274589621', 'Almaty', 'Tole bi', 5);

insert into payments (payment_id, payment_type, total_sum, buy_id, customer_id, date_of_payment) values (1, 'credit card', 50000, 1, 1, '30.05.2020');
insert into payments (payment_id, payment_type, total_sum, buy_id, customer_id, date_of_payment) values (2, 'cash', 25000, 2, 2, '01.09.2020');
insert into payments (payment_id, payment_type, total_sum, buy_id, customer_id, date_of_payment) values (3, 'credit card', 24000, 3, 3, '29.10.2020');
insert into payments (payment_id, payment_type, total_sum, buy_id, customer_id, date_of_payment) values (4, 'credit card', 250000, 4, 4, '01.10.2020');
insert into payments (payment_id, payment_type, total_sum, buy_id, customer_id, date_of_payment) values (5, 'cash', 320000, 5, 5, '20.07.2020');

insert into customers (customer_id, customer_name, phone_number, email, address, payment_id) values (1, 'Aleksandr', '87014589674', 'aleks@mail.ru', 'Samal-1', 1);
insert into customers (customer_id, customer_name, phone_number, email, address, payment_id) values (2, 'Aleksei', '87715288956', 'lexa@mail.ru', 'Kenesary', 2);
insert into customers (customer_id, customer_name, phone_number, email, address, payment_id) values (3, 'Maksim', '87068961247', 'maks@mail.ru', 'Aimanova', 3);
insert into customers (customer_id, customer_name, phone_number, email, address, payment_id) values (4, 'Michail', '87778912459', 'misha@mail.ru', 'Satpaeva', 4);
insert into customers (customer_id, customer_name, phone_number, email, address, payment_id) values (5, 'Vladislav', '87029631274', 'vlad@mail.ru', 'Zhandosova', 5);

insert into accounts (account_id, account_name, balance, customer_id) values (1, 'Sasha228', 100000, 1);
insert into accounts (account_id, account_name, balance, customer_id) values (2, 'Lexa96', 50000, 2);
insert into accounts (account_id, account_name, balance, customer_id) values (3, 'Crzy_Maks', 25000, 3);
insert into accounts (account_id, account_name, balance, customer_id) values (4, 'Mishka_kos', 250000, 4);
insert into accounts (account_id, account_name, balance, customer_id) values (5, 'Vlad_is_lav', 500000, 5);