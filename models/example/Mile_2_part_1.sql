with
mutual_fund_perf as (select code, sum(nav) as sum_nav from "MAJORASSIGNMENT"."MAJORASSIGN"."NAV_HISTORY" where nav_date = '2018-12-01'
                     group by code),
                     second_table as (select code,  sum(nav) as sum_of_nav from "MAJORASSIGNMENT"."MAJORASSIGN"."NAV_HISTORY" where nav_date = '2019-02-28'
                                     group by code),
                     calculate as (
                     select second_table.code as stc, ((second_table.sum_of_nav - mutual_fund_perf.sum_nav)/mutual_fund_perf.sum_nav)*100 as cagr from
                       second_table inner join mutual_fund_perf on mutual_fund_perf.code = second_table.code order by cagr desc
                     )
   select name from "MAJORASSIGNMENT"."MAJORASSIGN"."MUTUAL_FUND" as mf inner join calculate on mf.code = calculate.stc
   order by calculate.cagr desc