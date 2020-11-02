#1. Drop column picture from staff.
alter table staff
drop column picture;

select * from staff;

#2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select * from customer
where first_name = 'TAMMY';

select * from staff;

insert into staff(first_name, last_name, email, address_id, store_id, username)
values('TAMMY', 'SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 79, 2, 'Tammy');	

#3 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1 today.
insert into store(manager_staff_id, address_id)
values(3,134);	


#4 Delete non-active users, but first, create a backup table deleted_users to store 
#customer_id, email, and the date the user was deleted.

drop table if exists deleted_users;

CREATE TABLE deleted_users
  AS (SELECT customer_id, first_name, last_name, email, active
      FROM customer
      WHERE active = 0);
select * from deleted_users;

select * from customer
where active = 0

alter table customer
drop column where active = 0;

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

select * from films_2020;

UPDATE films_2020
SET rental_duration = 3;

UPDATE films_2020
SET rental_rate = 2.99;

UPDATE films_2020
SET replacement_cost = 8.99;

