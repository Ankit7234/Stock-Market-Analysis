use assignment;
                                          -- question 3
-- create a temp table to get the previous day value of the moving averages
-- here i use the lag() function to access the previous row's average value
-- for bajaj
create table bt
select `ROW_Number`, Date, Close_Price, 20_Day_MA, lag(20_Day_MA,1) over w as 20_MA_previous, 50_Day_MA, lag(50_Day_MA,1) over w as 50_MA_prev
from bajaj1
window w as (order by `ROW_Number`);
select * from bt;

-- for eicher
create table et
select `ROW_Number`, Date, Close_Price, 20_Day_MA, lag(20_Day_MA,1) over w as 20_MA_previous, 50_Day_MA, lag(50_Day_MA,1) over w as 50_MA_prev
from eicher1
window w as (order by `ROW_Number`);
select * from et;

-- for hero
create table ht
select `ROW_Number`, Date, Close_Price, 20_Day_MA, lag(20_Day_MA,1) over w as 20_MA_previous, 50_Day_MA, lag(50_Day_MA,1) over w as 50_MA_prev
from hero1
window w as (order by `ROW_Number`);
select * from ht;

-- for infosys
create table it
select `ROW_Number`, Date, Close_Price, 20_Day_MA, lag(20_Day_MA,1) over w as 20_MA_previous, 50_Day_MA, lag(50_Day_MA,1) over w as 50_MA_prev
from infosys1
window w as (order by `ROW_Number`);
select * from it;

-- for TCS
create table tt
select `ROW_Number`, Date, Close_Price, 20_Day_MA, lag(20_Day_MA,1) over w as 20_MA_previous, 50_Day_MA, lag(50_Day_MA,1) over w as 50_MA_prev
from tcs1
window w as (order by `ROW_Number`);
select * from tt;

-- for TVS
create table tvt
select `ROW_Number`, Date, Close_Price, 20_Day_MA, lag(20_Day_MA,1) over w as 20_MA_previous, 50_Day_MA, lag(50_Day_MA,1) over w as 50_MA_prev
from tvs1
window w as (order by `ROW_Number`);
select * from tvt;


                                   -- question 3 ( Buy / Sell / Hold )
-- here i create another table bajaj2 to represent the signal wheather to buy , sell or hold the stock
-- I check wheather the 20 day MA is greater than 50 day MA and the 20 day prev is smaller then 50 day prev
-- if 20 day MA is greater than 50 day MA and the 20 day prev is smaller then 50 day prev == 'BUY'
-- if 20 day MA is smaller than 50 day MA and the 20 day prev is greater then 50 day prev == 'sell'
-- otherwise 'Hold' the stock
-- i m taking row_number greater then 49 because before that we can't get a valid result when we compare a value with null.

-- for bajaj
create table bajaj2
select str_to_date(Date,'%d-%M-%Y')as Date ,Close_Price,
(case when `Row_number` > 49 and 20_Day_MA > 50_Day_MA and 20_MA_previous < 50_MA_prev then 'Buy'
when `Row_number`  > 49 and 20_Day_MA < 50_Day_MA and 20_MA_previous > 50_MA_prev then 'Sell'
else 'Hold' end) as 'Signal'
from bt;
select * from bajaj2;

-- for eicher
create table eicher2
select str_to_date(Date,'%d-%M-%Y')as Date ,Close_Price,
(case when `Row_number` > 49 and 20_Day_MA > 50_Day_MA and 20_MA_previous < 50_MA_prev then 'Buy'
when `Row_number`  > 49 and 20_Day_MA < 50_Day_MA and 20_MA_previous > 50_MA_prev then 'Sell'
else 'Hold' end) as 'Signal'
from et;
select * from eicher2;

-- for hero
create table hero2
select str_to_date(Date,'%d-%M-%Y')as Date ,Close_Price,
(case when `Row_number` > 49 and 20_Day_MA > 50_Day_MA and 20_MA_previous < 50_MA_prev then 'Buy'
when `Row_number`  > 49 and 20_Day_MA < 50_Day_MA and 20_MA_previous > 50_MA_prev then 'Sell'
else 'Hold' end) as 'Signal'
from ht;
select * from hero2;

-- for infosys
create table infosys2
select str_to_date(Date,'%d-%M-%Y')as Date ,Close_Price,
(case when `Row_number` > 49 and 20_Day_MA > 50_Day_MA and 20_MA_previous < 50_MA_prev then 'Buy'
when `Row_number`  > 49 and 20_Day_MA < 50_Day_MA and 20_MA_previous > 50_MA_prev then 'Sell'
else 'Hold' end) as 'Signal'
from it;
select * from infosys2;

-- for TCS
create table tcs2
select str_to_date(Date,'%d-%M-%Y')as Date ,Close_Price,
(case when `Row_number` > 49 and 20_Day_MA > 50_Day_MA and 20_MA_previous < 50_MA_prev then 'Buy'
when `Row_number`  > 49 and 20_Day_MA < 50_Day_MA and 20_MA_previous > 50_MA_prev then 'Sell'
else 'Hold' end) as 'Signal'
from tt;
select * from tcs2;

-- for TVS
create table tvs2
select str_to_date(Date,'%d-%M-%Y')as Date ,Close_Price,
(case when `Row_number` > 49 and 20_Day_MA > 50_Day_MA and 20_MA_previous < 50_MA_prev then 'Buy'
when `Row_number`  > 49 and 20_Day_MA < 50_Day_MA and 20_MA_previous > 50_MA_prev then 'Sell'
else 'Hold' end) as 'Signal'
from tvt;
select * from tvs2;

-- now i dont require the temporary tables so better to drop them

drop table bt;
drop table et;
drop table ht;
drop table it;
drop table tt;
drop table tvt;

