--Selecciona las columnas film_id y title de la tabla film.
SELECT film_id, title FROM film;

--Selecciona 5 filas de la tabla film, obteniendo todas las columnas.
SELECT * FROM film LIMIT 5;

--Selecciona filas de la tabla film donde film_id sea menor que 4.
SELECT * FROM film WHERE film_id < 4;

--Selecciona filas de la tabla film donde el rating sea PG o G.
SELECT * FROM film WHERE rating = 'PG' OR rating = 'G';

--Selecciona filas de la tabla actor donde el nombre sea Angela, Angelina o Audrey usando IN.
SELECT * FROM actor WHERE first_name IN ('Angela', 'Angelina', 'Audrey');

--Obtén una lista de actores con el nombre Julia.
SELECT * FROM actor WHERE first_name = 'Julia';

--Obtén una lista de actores con los nombres Chris, Cameron o Cuba.
SELECT * FROM actor WHERE first_name = 'Chris' OR first_name = 'Cameron' OR first_name = 'Cuba';

--Selecciona la fila de la tabla customer para el cliente con el nombre Jamie Rice.
SELECT * FROM customer WHERE first_name = 'Jamie' AND last_name = 'Rice';

--Selecciona el monto y la fecha de pago de la tabla payment donde el monto pagado sea menor a $1.
SELECT amount, payment_date FROM payment WHERE amount < 1;

--¿Cuáles son las diferentes duraciones de alquiler permitidas por la tienda?
SELECT DISTINCT rental_duration
FROM film;

--Ordena las filas en la tabla city por country_id y luego por city.
SELECT *
FROM city
ORDER BY country_id, city;

--¿Cuáles son los ID de los últimos 3 clientes que devolvieron un alquiler?
SELECT customer_id, return_date FROM rental ORDER BY return_date LIMIT 3;

--¿Cuántas películas tienen clasificación NC-17? ¿Cuántas tienen clasificación PG o PG-13?
SELECT rating, COUNT(rating) FROM public.film
WHERE rating='PG' OR rating = 'PG-13' OR rating='NC-17'
GROUP BY rating;

--¿Cuántos clientes diferentes tienen registros en la tabla rental?
SELECT customer_id FROM rental ORDER BY return_date LIMIT 3;

--¿Hay algún cliente con el mismo apellido?
SELECT last_name, COUNT(*)
FROM customer
GROUP BY last_name


--¿Qué película (id) tiene la mayor cantidad de actores?
SELECT film_id, COUNT(actor_id) AS cantidad_actores
FROM film_actor
GROUP BY film_id
ORDER BY cantidad_actores DESC
LIMIT 1;


--¿Qué actor (id) aparece en la mayor cantidad de películas?
SELECT actor_id, COUNT(film_id) AS cantidad_peliculas
FROM film_actor
GROUP BY actor_id
ORDER BY cantidad_peliculas DESC
LIMIT 1;

--Cuenta el número de ciudades para cada country_id en la tabla city. Ordena los resultados por count(*).
SELECT country_id, COUNT(*) AS cantidad_ciudades
FROM city
GROUP BY country_id
ORDER BY COUNT(*) ASC;

--¿Cuál es la tarifa de alquiler promedio de las películas? ¿Puedes redondear el resultado a 2 decimales?
SELECT ROUND(AVG(rental_rate), 2) AS tarifa_promedio
FROM film;

--Selecciona los 10 actores que tienen los nombres más largos (nombre y apellido combinados).
SELECT actor_id, CONCAT(first_name, ' ', last_name) AS nombre_completo
FROM actor
ORDER BY LENGTH(CONCAT(first_name, ' ', last_name)) DESC
LIMIT 10;