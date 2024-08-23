use world_life_expectancy;
select*from worldlifeexpectancy;

/*Identifying duplicate..As we don't have any Primary key so we Concat two Attributes to
get primary key*/
select country,year,concat(country,year),count(concat(country,year)) from
worldlifeexpectancy
group by country,year,concat(country,year)
having count(concat(country,year))>1;

/* To remove duplicates we identify row_id of duplicates*/
select* from(select ROW_ID,concat(country,year), row_number() over(partition by concat(country,year) order by
concat(country,year)) as row_num from worldlifeexpectancy) as row_table where row_num >1;

/*Delete those ROW_ID WHERE row_num is greater than one*/
DELETE from worldlifeexpectancy where ROW_ID IN (select ROW_ID from(select ROW_ID,concat(country,year), row_number() over(partition by concat(country,year) order by
concat(country,year)) as row_num from worldlifeexpectancy) as row_table where row_num >1);

select*from worldlifeexpectancy;

/*Next task is to handle blank values present in Status column
Let us find the status of the country where there is not blank*/
select distinct(Status) from worldlifeexpectancy
where status <> '';

select distinct(country) from worldlifeexpectancy
where status ='Developing';

/*Updating status to developing */
Update worldlifeexpectancy set status ='Developing' where country IN 
(select distinct(country)
 from (select distinct(country) from worldlifeexpectancy
where status ='Developing') as country);

/* Do same for the country which is developed*/
Update worldlifeexpectancy set status ='Developed' where country IN 
(select distinct(country)
 from (select distinct(country) from worldlifeexpectancy
where status ='Developed') as country);

/*Now we want to handle blanks in life expectancy.We will use avg of previous 
and former year to populate blank values*/

select t1.country,t1.year,t1.`Life expectancy`,
 t2.country,t3.year,t2.`Life expectancy`,
t3.country,t3.year,t3.`Life expectancy`,
round((t2.`Life expectancy`+t3.`Life expectancy`)/2,1)
from worldlifeexpectancy t1 join worldlifeexpectancy t2
on t1.country = t2.country
and t1.year=t2.year-1
join worldlifeexpectancy t3
on t1.country = t3.country
and t1.year=t3.year+1
where t1.`Life expectancy`='' ;

update worldlifeexpectancy t1 join worldlifeexpectancy t2
on t1.country = t2.country
and t1.year=t2.year-1
join worldlifeexpectancy t3
on t1.country = t3.country
and t1.year=t3.year+1
set t1.`Life expectancy`= round((t2.`Life expectancy`+t3.`Life expectancy`)/2,1)
where t1.`Life expectancy`='';

select* from worldlifeexpectancy;













