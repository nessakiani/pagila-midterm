/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 *
 * Write a SQL query that lists the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 * 4) have never been rented by anyone with an 'F' in their address (at the street, city, or country level).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

select title from film
where title not like '%F%'
except select title from film
join film_actor using(film_id)
join actor using(actor_id)
where actor.first_name like '%F%' or actor.last_name like '%F%'
except select title from film
join inventory using(film_id)
join rental using(inventory_id)
join customer using(customer_id)
join address using(address_id)
join city using(city_id)
join country using(country_id)
where address.address like '%F%' or address.address2 like '%F%'
or city.city like '%F%' or country.country like '%F%'
or customer.first_name like '%F%' or customer.last_name like '%F%'
order by title;
