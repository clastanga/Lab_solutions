#1 Rank films by length (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, and the rank.
select * from film
select title, length, rank() over (order by length desc) as rank_by_length
from film;


#2 Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). 
#In your output, only select the columns title, length, rating and the rank.

select title, length, rating, rank() over (partition by rating order by length) as rank_by_lenght
from film;


# --- for tomorrow
#3 How many films are there for each of the categories in the category table. Use appropriate join to write this query
#4 Which actor has appeared in the most films?
#5 Most active customer (the customer that has rented the most number of films)
