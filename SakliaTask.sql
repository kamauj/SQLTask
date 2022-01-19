USE sakila;

#Task 1
SELECT first_name, last_name FROM actor 
	ORDER BY last_name ASC; 

#Task 2 
SELECT first_name, last_name FROM actor 
	WHERE first_name = 'John' ORDER BY last_name ASC;

#Task 3 
SELECT first_name, last_name FROM actor 
	WHERE last_name = 'Neeson' ORDER BY first_name ASC;
    
#Task 4
SELECT first_name, last_name, actor_id FROM actor 
	WHERE (actor_id % 10) = 0 ORDER BY first_name ASC LIMIT 25;
    
#Task 5 
SELECT film_id, title, description FROM film 
	WHERE film_id = 100;
    
#Task 6 
SELECT film_id, title, rating FROM film 
	WHERE rating = 'R' LIMIT 25;

SELECT * FROM film;

#Task 7 
SELECT film_id, title, rating FROM film 
	WHERE rating != 'R' LIMIT 25;
    
#Task 8 
SELECT film_id, title, length FROM film 
	ORDER BY length ASC LIMIT 10;
    
#Task 9 
SELECT film_id, title, length FROM film 
	ORDER BY length DESC ;
    
#Task 10 
SELECT title, special_features FROM film 
	WHERE special_features LIKE '%Deleted Scenes';
    
#Task 11
SELECT last_name FROM actor
	GROUP BY last_name
	HAVING COUNT(last_name)=1 ORDER BY last_name DESC;

#Task 12
SELECT last_name, COUNT(last_name) AS frequency FROM actor 
	GROUP BY last_name 
	HAVING COUNT(last_name)>1 
	ORDER BY frequency DESC;
    
#Task 13 
SELECT * FROM film_actor;
SELECT actor.first_Name, actor.last_Name, COUNT(film.film_id) AS filmInvolvment FROM actor actor 
	JOIN film_actor film ON film.actor_id = actor.actor_id
	GROUP BY actor.last_name;
    
#Task 14
SELECT f.title, f.rental_duration, r.inventory_id, r.rental_id, r.rental_date, r.return_date, date((date(r.rental_date)) + f.rental_duration) as 'due date'
	FROM rental r JOIN inventory i
	ON r.inventory_id = i.inventory_id JOIN film f
	ON i.film_id=f.film_id
	WHERE r.return_date IS NULL AND r.inventory_ID BETWEEN 1 AND 8;
    
#Task 15
SELECT * FROM film;
SELECT AVG(length) AS AverageTime FROM film;

#Task 16
SELECT * FROM film_category;
SELECT AVG(length) AS AverageTime FROM film;
SELECT category_id, AVG(length) AS AverageTime FROM film_category fc 
	JOIN film f ON f.film_id = fc.film_id
	GROUP BY category_id;

#Task 17 
SELECT * FROM actor;
SELECT title, description FROM film 
	WHERE description LIKE '%Robot%';	
    
#Task 18 
SELECT title, release_year FROM film 
	WHERE release_year = '2010';	

#Task 19 
SELECT * FROM category;
SELECT f.title, c.name FROM film f
	JOIN film_category fc ON f.film_id=fc.film_id
	JOIN category c ON c.category_id=fc.category_id
	WHERE name='horror';
    
#Task 20 
SELECT staff_id, first_name, last_name FROM staff 
WHERE staff_id = 2;

#Task 21
SELECT f.film_id, film.title  FROM actor a 
	JOIN film_actor f ON f.actor_id = a.actor_id
    JOIN film film On film.film_id = f.film_id
	WHERE a.actor_id = '16' GROUP BY a.actor_id;

