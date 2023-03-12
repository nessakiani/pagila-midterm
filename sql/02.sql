/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

select country from customer
join address using(address_id)
join city using(city_id)
join country using(country_id)
group by country
order by count(distinct customer_id) desc
limit 1;
