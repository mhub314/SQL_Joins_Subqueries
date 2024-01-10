--List all customers who live in Texas (use Joins)
select customer.first_name, customer.last_name, district 
from customer
full join address
on customer.address_id = address.address_id 
where district = 'Texas';


--Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, amount
from customer
full join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99
order by amount desc;


--Show all customers names who have made payments over $175 (use subqueries)
select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id, amount
	having amount > 175.00
	order by amount desc
);


--List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id 
where country = 'Nepal';


--Which staff member had the most transactions?
select staff_id, first_name, last_name
from staff
where staff_id in(
	select staff_id
	from payment
	group by payment_id, payment.staff_id
	order by count(payment_id) desc
);


--How many movies of each rating are there?
select count(rating), rating
from film
group by rating
order by count(rating) desc;


--Show all customers who have made a single payment above $6.99 (use subqueries)
select customer.customer_id, customer.first_name, customer.last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 6.99
	group by customer_id
	
);


--How many free rentals did our stores give away?
select staff.staff_id , staff.store_id , rental_id, amount
from staff
full join payment
on staff.staff_id = payment.staff_id 
where amount = 0.00;

