#Write a query to display for each store its store ID, city, and country.
select s.store_id, a.address, c.city, co.country 
from store s
join address a
on s.address_id = a.address_id
join city c
on a.city_id = c.city_id
join country co
on c.country_id = co.country_id;


#Write a query to display how much business, in dollars, each store brought in.

select s.store_id, st.staff_id, round(sum(p.amount),0) as business 
from payment p
join staff st
on p.staff_id = st.staff_id
join store s
on st.store_id = s.store_id
group by st.staff_id;

#What is the average running time of films by category?
select category.name, avg(length)
from sakila.film join sakila.film_category using (film_id)
                 join sakila.category using (category_id)
group by category.name
order by avg(length) desc;

#Which film categories are longest?
select category.name, avg(length)
from sakila.film join sakila.film_category using (film_id)
                 join sakila.category using (category_id)
group by category.name
order by avg(length) desc;



#Display the most frequently rented movies in descending order.
select title, count(*) as `rental frequency`
from sakila.film
join (sakila.inventory join sakila.rental using (inventory_id))
using (film_id)
group by title
order by `rental frequency` desc;




#List the top five genres in gross revenue in descending order.

select name, category_id, sum(amount) as `gross revenue`
from sakila.payment
join (sakila.rental join (sakila.inventory join (sakila.film_category join sakila.category using (category_id)) using (film_id)) using (inventory_id)) using (rental_id)
group by category_id
order by `gross revenue` desc
limit 5;


#Is "Academy Dinosaur" available for rent from Store 1?
select film.film_id, film.title, store.store_id, inventory.inventory_id
from sakila.inventory
join sakila.store using (store_id)
join sakila.film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;

select inventory.inventory_id
from sakila.inventory join sakila.store using (store_id)
     join sakila.film using (film_id)
     join sakila.rental using (inventory_id)
where film.title = 'Academy Dinosaur'
      and store.store_id = 1
      and not exists (select * from sakila.rental
                      where rental.inventory_id = inventory.inventory_id
                      and rental.return_date is null);