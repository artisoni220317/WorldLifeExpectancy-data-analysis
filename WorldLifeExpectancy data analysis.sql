#World Life expectancy Project (Exploratory Data Analysis)

/*Which country have the MAX and MIN Life expectancy*/
select country,MAX(`Life expectancy`),min(`Life expectancy`)
from worldlifeexpectancy group by country
having max(`Life expectancy`)<>0
and min(`Life expectancy`)<>0
order by country desc;

/* Increase in Life Expectancy in 15 Years*/
select country,MAX(`Life expectancy`),MIN(`Life expectancy`),round(MAX(`Life expectancy`)-MIN(`Life expectancy`),2) AS life_increase
from worldlifeexpectancy group by country
having max(`Life expectancy`)<>0
and min(`Life expectancy`)<>0
order by life_increase desc;

/*Avg Life expectancy with gdp of the country*/
select country,round(avg(`Life expectancy`),2) as life_exp,round(avg(GDP),1) as GDP
from worldlifeexpectancy group by country
having life_exp >0
and GDP>0
order by  life_exp;


/*Avg Life expectancy with status*/
select status,round(avg(`Life expectancy`),1) from worldlifeexpectancy
group by status;

select
 CASE WHEN GDP>=1500 THEN 1 ELSE 0 END AS High_gdp_count,
 AVG(CASE WHEN GDP>=1500 THEN `Life expectancy` ELSE NULL END ) high_gdp_life_expectancy
 from worldlifeexpectancy;
 /*Total Adult Mortality*/

select country,year,`Life expectancy`,`Adult Mortality` , sum(`Adult Mortality`)
over(partition by country order by year) as rolling_total
from worldlifeexpectancy;