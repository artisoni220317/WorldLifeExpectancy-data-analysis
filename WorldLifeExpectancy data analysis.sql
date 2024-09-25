#World Life expectancy Project (Exploratory Data Analysis)

/*Which country have the MAX and MIN Life expectancy*/
select country,MAX(`Life expectancy`),min(`Life expectancy`)
from worldlifeexpectancy group by country
having max(`Life expectancy`)<>0
and min(`Life expectancy`)<>0
order by country desc;

/*Avg Life expectancy with gdp of the country*/
select country,round(avg(`Life expectancy`),2) as life_exp,round(avg(GDP),1) as GDP
from worldlifeexpectancy group by country
having life_exp >0
and GDP>0
order by  life_exp;


/*Avg Life expectancy with status*/
select status,round(avg(`Life expectancy`),1) from worldlifeexpectancy
group by status;

select country,year,`Life expectancy`,`Adult Mortality` , sum(`Adult Mortality`)
over(partition by country order by year) as rolling_total
from worldlifeexpectancy;