#1. List number of films per category.
select count(f.film_id) as Tot_movies_category, c.name
from film_category f
left join category c
on f.category_id = c.category_id
group by c.name;

#2. Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address, a.district 
from staff s
left join address a
on s.address_id = a.address_id;


#3. Display the total amount rung up by each staff member in August of 2005.

select s.first_name, s.last_name, round(sum(p.amount),0) as August_2005
from staff s
left join payment p
on s.staff_id = p.staff_id
where p.payment_date between '2005-08-01' and '2005-08-31'
group by s.staff_id;


#4. List each film and the number of actors who are listed for that film.
select count(f.film_id) as num_of_film, a.actor_id 
from film f
left join film_actor a 
on f.film_id = a.film_id
group by a.actor_id;


#5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.first_name, c.last_name, sum(p.amount) as tot_amount 
from customer c
left join payment p
on c.customer_id = p.customer_id
group by c.customer_id
order by c.last_name asc;






