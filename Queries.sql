show databases;
use classicmodels;
show tables;
describe customers;
describe orders;
describe orderdetails;
describe products;

-- get all orders
select * from orders;

-- get all customers 
select * from customers;

-- get customers  where customer_number between 290 and 300;
select * from customers where customer_number between 290 and 300;

-- select orders placed in month = 9 
select * from orders where month(order_date) = 9;

-- using alias 
select customer_name as Name from customers;

-- converting into uppercase
select upper(customer_name) from customers;

-- taking substring
select substring(customer_name,1,5) from customers;

-- sorting customers by cust number
select * from customers order by customers.customer_number;

-- getiing orders placed between '2003-01-01' and '2003-01-31'
select * from orders WHERE order_date BETWEEN str_to_date('2003-01-01', '%Y-%m-%d') AND '2003-01-31';

-- getting most recent order
select * from orders order by order_date DESC limit 1;

-- getting most older order
select * from orders order by order_date ASC limit 1;

-- getting customer name for the given order
select customers.customer_name from customers, orders where customers.customer_number = orders.customer_number and orders.order_number = 10123;

-- getting orders by customer name
select od.* FROM orders as od, customers as cu where od.customer_number = cu.customer_number and cu.customer_name = 'Microscale Inc.';

-- getting orders for the given customer
select * from orders where customer_number=489;

-- getting orderdetails for the given order
select * from orderdetails where order_number=10298;

-- getting product details for the given product
select * from products where product_code = 'S18_1589';

-- getting all the products in the given ordernumber
select products.* from orders inner join orderdetails on orders.order_number=orderdetails.order_number and orderdetails.order_number = 10298 inner join products on products.product_code = orderdetails.product_code;
