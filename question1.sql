                                         -- Question 1
use assignment;
set SQL_SAFE_UPDATES = 0;

-- creating a temporary table to convert date variable into date formate
create table bt select str_to_date(Date,'%d-%M-%Y') Date,Close_Price from bajaj; 
create table et select str_to_date(Date,'%d-%M-%Y') Date,Close_Price from eicher_motors;
create table ht select str_to_date(Date,'%d-%M-%Y') Date,Close_Price from hero;
create table it select str_to_date(Date,'%d-%M-%Y') Date,Close_Price from infosys;
create table tt select str_to_date(Date,'%d-%M-%Y') Date,Close_Price from tcs;
create table tvt select str_to_date(Date,'%d-%M-%Y') Date,Close_Price from tvs_motors;

                                         -- for Bajaj table
-- calculating 20 day moving avg and 50 day moving avg from the close_price
-- using row_number() function to assign numbers to the rows
set sql_mode=' ';
create table bajaj1
select  row_number() over wind as `ROW_Number`,date, close_price, avg (close_price) over( rows between 19 preceding and current row) as 20_Day_MA ,
avg (close_price) over(rows between 49 preceding and current row) as 50_Day_MA
from bajaj
window wind as (order by Date asc);
show warnings;
select * from bajaj1;

-- setting the first 19 value to null for 20_day_MA
SET SQL_SAFE_UPDATES = 0;
update  bajaj1
set `20_Day_MA`= NULL
where `ROW_Number` between 1 and 19;
 
-- setting the first 49 values to null for 50_day_MA
SET SQL_SAFE_UPDATES = 0;
update  bajaj1
set `50_Day_MA`=NULL
where `ROW_Number` between  1 and 49;
 
 select * from bajaj1 ; -- this will print the null values in first 19 and 49 values of 20dayMA and 50dayMA
 
 
 
                                   --  for Eicher Table
-- calculating 20 day moving avg and 50 day moving avg from the close_price
-- using row_number() function to assign numbers to the rows
set sql_mode=' ';
create table eicher1
select  row_number() over wind as `ROW_Number`,date, close_price, avg (close_price) over( rows between 19 preceding and current row) as 20_Day_MA ,
avg (close_price) over(rows between 49 preceding and current row) as 50_Day_MA
from eicher_motors
window wind as (order by Date asc);
show warnings;
select * from eicher1;

-- setting the first 19 value to null for 20_day_MA
SET SQL_SAFE_UPDATES = 0;
update  eicher1
set `20_Day_MA`= NULL
where `ROW_Number` between 1 and 19;
 
-- setting the first 49 values to null for 50_day_MA
SET SQL_SAFE_UPDATES = 0;
update  eicher1
set `50_Day_MA`=NULL
where `ROW_Number` between  1 and 49;
 
select * from eicher1 ; 
 
 
                                 -- for Hero Table
-- calculating 20 day moving avg and 50 day moving avg from the close_price
-- using row_number() function to assign numbers to the rows
set sql_mode=' ';
create table hero1
select  row_number() over wind as `ROW_Number`,date, close_price, avg (close_price) over( rows between 19 preceding and current row) as 20_Day_MA ,
avg (close_price) over(rows between 49 preceding and current row) as 50_Day_MA
from hero
window wind as (order by Date asc);
show warnings;
select * from hero1;

-- setting the first 19 value to null for 20_day_MA
SET SQL_SAFE_UPDATES = 0;
update  hero1
set `20_Day_MA`= NULL
where `ROW_Number` between 1 and 19;
 
-- setting the first 49 values to null for 50_day_MA
SET SQL_SAFE_UPDATES = 0;
update  hero1
set `50_Day_MA`=NULL
where `ROW_Number` between  1 and 49;
select * from hero1 ; 

										-- for INFOSYS Table
-- calculating 20 day moving avg and 50 day moving avg from the close_price
-- using row_number() function to assign numbers to the rows
set sql_mode=' ';
create table infosys1
select  row_number() over wind as `ROW_Number`,date, close_price, avg (close_price) over( rows between 19 preceding and current row) as 20_Day_MA ,
avg (close_price) over(rows between 49 preceding and current row) as 50_Day_MA
from infosys
window wind as (order by Date asc);
show warnings;
select * from infosys1;

-- setting the first 19 value to null for 20_day_MA
SET SQL_SAFE_UPDATES = 0;
update  infosys1
set `20_Day_MA`= NULL
where `ROW_Number` between 1 and 19;
 
-- setting the first 49 values to null for 50_day_MA
SET SQL_SAFE_UPDATES = 0;
update  infosys1
set `50_Day_MA`=NULL
where `ROW_Number` between  1 and 49;
 
select * from infosys1 ; 

                                        -- for TCS table
-- calculating 20 day moving avg and 50 day moving avg from the close_price
-- using row_number() function to assign numbers to the rows
set sql_mode=' ';
create table tcs1
select  row_number() over wind as `ROW_Number`,date, close_price, avg (close_price) over( rows between 19 preceding and current row) as 20_Day_MA ,
avg (close_price) over(rows between 49 preceding and current row) as 50_Day_MA
from tcs
window wind as (order by Date asc);
show warnings;
select * from tcs1;

-- setting the first 19 value to null for 20_day_MA
SET SQL_SAFE_UPDATES = 0;
update  tcs1
set `20_Day_MA`= NULL
where `ROW_Number` between 1 and 19;
 
-- setting the first 49 values to null for 50_day_MA
SET SQL_SAFE_UPDATES = 0;
update  tcs1
set `50_Day_MA`=NULL
where `ROW_Number` between  1 and 49;
 
 select * from tcs1 ; 
                                        
                                        -- for TVS table
-- calculating 20 day moving avg and 50 day moving avg from the close_price
-- using row_number() function to assign numbers to the rows
set sql_mode=' ';
create table tvs1
select  row_number() over wind as `ROW_Number`,date, close_price, avg (close_price) over( rows between 19 preceding and current row) as 20_Day_MA ,
avg (close_price) over(rows between 49 preceding and current row) as 50_Day_MA
from tvs_motors
window wind as (order by Date asc);
show warnings;
select * from tvs1;

-- setting the first 19 value to null for 20_day_MA
SET SQL_SAFE_UPDATES = 0;
update  tvs1
set `20_Day_MA`= NULL
where `ROW_Number` between 1 and 19;
 
-- setting the first 49 values to null for 50_day_MA
SET SQL_SAFE_UPDATES = 0;
update  tvs1
set `50_Day_MA`=NULL
where `ROW_Number` between  1 and 49;
 
 select * from tvs1 ; 
 
 
 -- now droping the temporary table
 drop table bt;
 drop table et;
 drop table ht;
 drop table it;
 drop table tt;
 drop table tvt;
 

