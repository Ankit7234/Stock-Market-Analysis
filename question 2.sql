
                                    -- question 2
use assignment;
create table `master` as select b.`date` as `DATE`,b.close_price as Bajaj,T.close_price as TCS,
TV.close_price as TVS , i.close_price as Infosys, e.close_price as Eicher,  h.close_price as Hero
 from bajaj b, eicher_motors e,hero h, 
infosys i,tcs t, tvs_motors tv 
where b.`date`=e.`date` and e.`date`=h.`date` and h.`date`=i.`date` and i.`date`=T.`date` and 
T.`date`=TV.`date`;

select * from `master`;


