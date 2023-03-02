

/*01 - Data Science Skills (Linkedin)*/

select candidate_id
from candidates
group by candidate_id
having count(skill) > 2
order by candidate_id;


/*02 - Page With No Likes (Facebook)*/

select p.page_id
from pages p
left outer join page_likes pl
	on pl.page_id = p.page_id
where liked_date is null;


/*03 - Unfinished Parts (Tesla)*/

select part
from parts_assembly
where finish_date is null
group by part;


/*04 - Laptop Vs. Mobile Viewership (New York Times)*/

select
sum(case
	when device_type = 'laptop' then 1
    else 0
end) as laptop_view,
sum(case
	when device_type in ('tablet','phone') then 1
	else 0
end) as mobile_view
from viewership;


/*05 - Cities With Completed Trades (Robinhood)*/

select city, 
sum(case
	when status = 'completed' then 1
    else 0
end) as total_orders
from trades t
join users s
	on s.user_id = t.user_id
group by city
order by total_orders desc;
