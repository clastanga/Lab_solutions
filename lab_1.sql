select * from sakila.language 

#3.	Select one column from a table:  Get film titles
select title from film

#4.	Select one column from a table and alias it : Get unique list of film languages under the alias ‘language’ -
select distinct name as language from language 

#5.	Using select statements and reviewing how many records are returned, 
#can you find out how many stores and staff does the company have? Can you return a list of employee first names only?
select count(staff_id) as staff, count(store_id) as stores from staff 

#6.	BONUS : How many unique days did customers rent movies in this dataset? 
select * from sakila.rental
select distinct rental_date from rental
select count(distinct left(rental_date,10)) from rental

