with date_occured as (
select code, nav_date from "MAJORASSIGNMENT"."MAJORASSIGN"."NAV_HISTORY"
group by code, nav_date
)

select nav_his.code,dao.nav_date as date, max(nav) as max_nav, min(nav) as min_nav
from "MAJORASSIGNMENT"."MAJORASSIGN"."NAV_HISTORY" as nav_his
inner join date_occured as dao on dao.code = nav_his.code 
group by nav_his.code,date