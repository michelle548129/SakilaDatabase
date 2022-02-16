USE sakila;

#1 List all actors.
SELECT first_name FROM actor;

#2 Find the surname of the actor with the forename 'John'.
SELECT last_name FROM actor WHERE first_name = "John"; 

#3 Find all actors with surname 'Neeson'.
SELECT first_name, last_name FROM actor WHERE last_name = "Neeson"; 

#4 Find all actors with ID numbers divisible by 10.
SELECT actor_id, first_name, last_name FROM actor WHERE (actor_id % 10) = 0;

#5 What is the description of the movie with an ID of 100?
SELECT description FROM film WHERE film_id = 100; 

#6 Find every R-rated movie.
SELECT title FROM film WHERE rating = "R"; 

#7 Find every non-R-rated movie.
SELECT title FROM film WHERE rating != "R"; 

#8 Find the ten shortest movies.
SELECT title, length FROM film ORDER BY length ASC LIMIT 10; 

#9 Find the movies with the longest runtime, without using LIMIT.
SELECT title, length FROM film ORDER BY length DESC;
 
#10 Find all movies that have deleted scenes.
SELECT title FROM film WHERE special_features LIKE "Deleted Scenes%"; 

#11 Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name FROM actor  GROUP BY last_name HAVING COUNT(DISTINCT last_name) ORDER BY last_name DESC;

#12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*) > 1 ORDER BY COUNT(last_name) DESC;

#13 Which actor has appeared in the most films?
SELECT first_name, last_name 
FROM actor
Inner JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY count(film_actor.actor_id) DESC LIMIT 1;

#14 When is 'Academy Dinosaur' due?
#15 What is the average runtime of all films?
SELECT AVG(length) FROM film;

#16 List the average runtime for every film category.
SELECT name, AVG(length)
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY AVG(length) DESC;

#17 List all movies featuring a robot.
SELECT title FROM film WHERE description LIKE "%Robot%"; 

#18 How many movies were released in 2010?
SELECT COUNT(title) FROM film WHERE release_year = 2010; 

#19 Find the titles of all the horror movies.
SELECT title
FROM film
Inner JOIN film_category
ON film.film_id = film_category.film_id
Inner JOIN category
ON category.category_id = film_category.category_id
WHERE name = 'horror';

#20 List the full name of the staff member with the ID of 2.
SELECT first_name, last_name FROM staff WHERE staff_id = 2; 

#21 List all the movies that Fred Costner has appeared in.
SELECT title
FROM actor
Inner JOIN film_actor 
ON actor.actor_id = film_actor.actor_id
Inner JOIN film
ON film.film_id = film_actor.film_id
WHERE first_name = 'Fred';

#22 How many distinct countries are there?
SELECT DISTINCT COUNT(country) FROM country; 

#23 List the name of every language in reverse-alphabetical order.
SELECT name FROM language ORDER BY name DESC; 

#24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name, last_name FROM actor WHERE last_name LIKE "%son" ORDER BY first_name ASC; 

#25 Which category contains the most films?


SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM category;
SELECT * FROM actor;
SELECT * FROM language;
