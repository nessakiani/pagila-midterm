/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 */

with children_films as (
    select film_id from film
    join film_category using(film_id)
    join category using(category_id)
    where name = 'Children'
), horror_films as (
    select film_id from film
    join film_category using(film_id)
    join category using(category_id)
    where name = 'Horror'
), children_actors as (
    select actor_id from film_actor
    where film_id in (select * from children_films)
), horror_actors as (
    select actor_id
    from film_actor
    where film_id in (select * from horror_films)
), children_wo_horror_actors as (
    select * from children_actors
    except select * from horror_actors
)
select first_name, last_name from actor
where actor_id in (select * from children_wo_horror_actors)
order by first_name, last_name;
