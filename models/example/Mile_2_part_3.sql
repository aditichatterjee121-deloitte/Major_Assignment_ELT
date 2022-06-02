with
first_month as (
select code as c from "MAJORASSIGNMENT"."MAJORASSIGN"."NAV_HISTORY" where nav_date ='2018-12-01'
),
third_month as (
select code as c from "MAJORASSIGNMENT"."MAJORASSIGN"."NAV_HISTORY" where nav_date ='2019-02-28'
),
merge as (
select fm.c as codef from first_month as fm inner join third_month as tm on fm.c=tm.c order by fm.c)

select distinct(mf.name) as discontinue_mutual_fund from "MAJORASSIGNMENT"."MAJORASSIGN"."NAV_HISTORY" as dmf 
inner join "MAJORASSIGNMENT"."MAJORASSIGN"."MUTUAL_FUND" as mf on dmf.code = mf.code
where dmf.code not in (select merge.codef from merge)
order by mf.name asc