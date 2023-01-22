select*from athlete_events;
-- sql query to find how many medals india has won
select*
from athlete_events 
where Team='India' 
and Medal<>'NA';
--sql query to find in which sport or event india has won the highest medal
select event,COUNT(Medal)
from athlete_events
where Team='India' 
and Medal<>'NA'
group by Event;
--sql query to identify the sports or event which was played most consecutively in thw summer olympics
select Event,count(Event)
from athlete_events
where Season='Summer'
group by Event
order by count(Event) desc;
--write sql query to find the details of all the countries which have won most number of all silver and bronze medall and at least gold medals
select team,sum(Silver) as silver,sum(Bronze) as bronze,sum(Gold) as gold
from(
SELECT *,
		case Medal when 'Silver' then 1 else 0 end as Silver,
		case Medal when 'Bronze' then 1 else 0 end as Bronze,
		case Medal when 'Gold' then 1 else 0 end as Gold
FROM athlete_events
) innerT
group by Team
having sum(Gold)>0
order by sum(Silver) desc;


--sql query to find which player has got highest gold medals
select Name,sum(Gold)
from(
SELECT*,
		case Medal when 'Gold' then 1 else 0 end as Gold
FROM athlete_events)innerT
group by Name
order by sum(Gold) desc;

--which sport has max events

select Sport,count(*) as count
from athlete_events
group by Sport
order by count(*) desc;

--which year has max events

select year,count(event) as event
from athlete_events
group by Year
order by count(event) desc;





