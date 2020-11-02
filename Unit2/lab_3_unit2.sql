
    #1. How many distinct (different) actors' last names are there?
    select count(actor_id) from actor;
    
    #2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
   select * from film;
   SELECT distinct language_id FROM film;
   
    #3. How many movies were released with "PG-13" rating?
   SELECT count(*) FROM film where rating like 'PG-13';
    
    #4. Get 10 the longest movies from 2006.
    select title, release_year, length from film order by length Desc limit 10; 
    
    #5. How many days has been the company operating (check DATEDIFF() function)?
    select * from rental;
    select ABS(DATEDIFF(min(rental_date), max(rental_date))) from rental;
    
    #6. Show rental info with additional columns month and weekday. Get 20.
    select rental_date, date_format((rental_date),'%M - %W') as rental_day_and_month,
		return_date, date_format((rental_date),'%M - %W') as return_day_and_month
	from rental 
    limit 20;
    
    #7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
    SELECT DAYNAME(rental_date) AS day_type 
    from rental
    where rental_date in('saturday','sunday');
    
    #8. How many rentals were in the last month of activity?
	select count(rental_id), rental_date from rental where TIMESTAMPADD(MONTH,'2003-02-01','2003-05-01')rental_date ;

    