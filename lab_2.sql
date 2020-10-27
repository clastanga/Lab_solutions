#7.	Select all the actors with the first name ‘Scarlett’
select * from sakila.customer
select actor_id, first_name, last_name from actor where first_name = 'SCARLETT'

#8.	Select all the actors with the last name ‘Johansson’
select actor_id, first_name, last_name from actor where last_name = 'JOHANSSON'

#9.	How many films (movies) total are available for rent?
select count(film_id) as movies_for_rent from inventory


#10. How many films have been rented total ? How many unique films have been rented? 
select count(distinct inventory_id) from rental

#11. What is the shortest and longest rental period?
select min(rental_duration), max(rental_duration) from film 

#12. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as min_duration, max(length) as max_duration from film

#13. What's the average movie duration?
select avg(length) as avg_duration from film

#14. What's the average movie duration expressed in format (hours, minutes)? Hint, you will need to use floor and % 
select floor(avg(length)/60) as avg_duration_h, floor(avg(length)%60) as avg_duration_min from film

#15. How many movies are longer than 3 hours? Remember the duration is in minutes
select title, length from film where length >= 180

#16. Get the name and email of all customers, formatted nicely in two columns  
#Example: Mary SMITH mary.smith@sakilacustomer.org
select concat(first_name, ' ', last_name), lower(email) from customer

#17. What's the length of the longest film title?
select title, max(length(title)) as longest_title from film 





