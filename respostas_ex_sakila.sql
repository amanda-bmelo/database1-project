select * from film;

select title from film;

select * from film where length < 60;

select * from customer where active=0;

select concat(c.first_name, " ", c.last_name) name, a.address
from customer c, address a
where c.address_id = a.address_id and c.active=1;

select concat(c.first_name, " ", c.last_name) name, o.country
from customer c, address a, city, country o
where c.address_id=a.address_id and a.city_id=city.city_id and city.country_id=o.country_id and o.country="Brazil";

select f.title, concat(a.first_name, " ", a.last_name) actor
from film_actor fa, actor a, film f
where fa.actor_id=a.actor_id and fa.film_id=f.film_id;

select f.title title, concat(a.first_name, " ", a.last_name) actor
from film_actor fa, actor a, film f
where fa.actor_id=a.actor_id and fa.film_id=f.film_id
order by title;

select f.title, concat(a.first_name, " ", a.last_name) actor
from film_actor fa, actor a, film f
where fa.actor_id=a.actor_id and fa.film_id=f.film_id
order by actor;

select f.title, concat(a.first_name, " ", a.last_name) actor
from film_actor fa, actor a, film f
where fa.actor_id=a.actor_id and fa.film_id=f.film_id and a.actor_id=6;

select count(*) from film;

select avg(length) from film;

select c.name, f.title
from film_category fc, category c, film f
where fc.category_id=c.category_id and fc.film_id=f.film_id;

select c.name, count(*)
from film_category fc, category c, film f
where fc.category_id=c.category_id and fc.film_id=f.film_id
group by c.name;
select c.name, avg(f.length)
from film_category fc, category c, film f
where fc.category_id=c.category_id and fc.film_id=f.film_id
group by c.name;

select c.name, count(*) num_films from film_category fc, category c, film f
where fc.category_id=c.category_id and fc.film_id=f.film_id
group by c.name having num_films < 57;

select c.name, avg(f.length) average from film_category fc, category c, film f
where fc.category_id=c.category_id and fc.film_id=f.film_id
group by c.name having count(*) < 57;

select concat(c.first_name, " ", c.last_name) name, count(r.rental_id) num_rents
from rental r, customer c
where r.customer_id=c.customer_id
group by name;


select concat(c.first_name, " ", c.last_name) name, count(r.rental_id) num_rents from rental r, customer c
where r.customer_id=c.customer_id
group by name order by num_rents DESC;

select concat(c.first_name, " ", c.last_name) name, r.return_date
from rental r, customer c
where r.customer_id=c.customer_id and r.return_date is null
group by name;

select concat(c.first_name, " ", c.last_name) name, r.return_date
from rental r, customer c
where r.customer_id=c.customer_id and r.return_date is not null
group by name;
