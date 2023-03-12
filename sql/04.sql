/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */

select t.title from (
    select distinct film.title, count(distinct film_actor.actor_id) as actor_count from film
    inner join film_actor on film_actor.film_id = film.film_id
    where film_actor.actor_id in (
        select film_actor.actor_id from film_actor
        inner join film on film.film_id = film_actor.film_id
        where film.title = 'AMERICAN CIRCUS'
    )
    group by film.title
) as t
where t.actor_count >= 2
order by t.title asc;
