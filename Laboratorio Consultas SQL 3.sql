-- 1. ¿Cuántos apellidos de actores distintos (diferentes) hay?
USE sakila;

SELECT COUNT(distinct last_name) AS  Apellidos_diferentes
FROM actor;

-- 2. ¿En cuántos idiomas diferentes se produjeron originalmente las películas? (Utilice la columna language_id de la film_tabla)

SELECT
	COUNT(distinct language_id) AS Idiomas_diferentes
FROM film;

-- 3. ¿Cuántas películas se estrenaron con "PG-13"calificación?

SELECT
	COUNT(*) AS Peliculas_PG
FROM sakila.film
WHERE rating = "PG-13";

-- 4. Consigue 10 de las películas más largas de 2006.

SELECT
	*
FROM film
	WHERE release_year = 2006
	ORDER BY length DESC
    LIMIT 10;
-- Tabla Resumida
SELECT
   title, length
FROM film
	WHERE release_year = 2006
	ORDER BY length DESC
    LIMIT 10;

-- 5. ¿ Cuántos días lleva funcionando la empresa ( DATEDIFF()función de verificación)?

SELECT
	DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM rental;

-- 6. Muestra información de alquiler con columnas adicionales mes y día laborable. Consigue 20.

SELECT
	*,
	MONTH(rental_date) AS rental_month,
	DAYOFWEEK(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

-- 7. Agregue una columna adicional day_typecon los valores 'fin de semana' y 'día laboral' según el día de alquiler de la semana.

SELECT
	*,
CASE
	WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN "weekend"
    ELSE "workday"
    END AS day_type
FROM rental;

-- 8. ¿Cuántos alquileres hubo en el último mes de actividad?

SELECT
	DATE_FORMAT(rental_date, "%Y, %M") AS Fecha_de_alquiler,COUNT(rental_id)
FROM rental
GROUP BY DATE_FORMAT(rental_date, "%Y, %M")
ORDER BY DATE_FORMAT(rental_date, "%Y, %M") DESC
LIMIT 1;



