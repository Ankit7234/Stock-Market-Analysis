                                      -- Question 4
-- i have made a user define function which takes the values in the form of date and return 
-- return the signal on that perticular date (wheather to Buy / Sell / Hold the stock)

use assignment;
delimiter &&
create function Date_input ( dt Date)  -- function name is Date_input
returns char(30) deterministic
begin
declare dt_value char(50); -- declaring a variable who takes the input
set dt_value = (select `Signal` from bajaj2 where Date = dt);  -- this is to select the signal from bajaj2 table where the input date in matching
return dt_value;
end
&&
delimiter ;

-- here i m calling the function by passing the dates;
select Date_input('2015-12-21') as `signal` ; -- give the output as 'Sell'
select Date_input('2017-04-21') as `signal` ; -- give the output as 'Buy'
select Date_input('2015-04-01') as `signal` ; -- give the output as 'Hold'


