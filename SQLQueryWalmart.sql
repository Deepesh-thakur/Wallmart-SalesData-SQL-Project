select * from walmart

--cost
select distinct(city) from walmart

--city wise gross income
--1 sum
SELECT city, sum(gross_income) as " Gross income"
FROM walmart 
GROUP BY CITY

--2 avg
SELECT city, avg(gross_income) as " Gross income"
FROM walmart 
GROUP BY CITY
--3 product
SELECT product_line, unit_price, quantity, unit_price*quantity as "gross income"
FROM walmart 

SELECT product_line,  sum(unit_price*quantity) as "product wise sale"--,unit_price, quantity
FROM walmart 
GROUP BY product_line
--4 division
select product_line, (unit_price+10)/10 as "new price" 
FROM walmart 
--5 abs
select abs(0.8) as abs_values

select abs(-566789) as abs_values

select abs(null) as abs_values

select abs('666') as abs_values

select asin('abc') as abs_values

select exp(3) as abs_values
--6 ceiling() function
select ceiling(3.2) as CeiilValue
select ceiling(tax_5) as CeiilValue
from walmart

--7 floor() function
select floor(3.2) as FloorlValue

select ceiling(3.2) as CeiilValue,floor(3.2) as FloorlValue
--8 power
select power(2,3) as cube

select power(0.5,3) as cube

select rand() as random

select rand(6) as random

select rand(225+(rand()*9)) as random

select rand()*(10-5)+5

select rand(5)+5 as random

--current date
select current_timestamp as current_date_and_time
--current date+days
select current_timestamp+10 as current_date_and_time
--current date-days
select current_timestamp-14 as current_date_and_time
--current date with format
--select current_timestamp,'dd-MM-yyyy hh:mm:ss' as current_date_and_time
--current date with format
select format( current_timestamp,'dd-MM-yyyy hh:mm:ss' )as current_date_and_time
--current timezone
select current_timezone() as time_zone
--today date
select getdate() as time_date
--cutomise format to am/pm
select format( getdate(),'dd-MM-yyyy hh:mm:ss tt' )as current_date_and_time
--convert() function to return only date and time
select convert(date,getdate()) as 'current date',
convert(time,getdate()) as 'current time'
--add and sub days from getdate()
select getdate()+10 as DateADD,getdate()-5 as DateSUB

select getdate() as current_day,
getdate()+7 as lastweek,
getdate()-7 as nextweek

select format( getdate()+7,'dd-MM-yyyy' )as currentdate,
format( getdate(),'dd-MM-yyyy' )as currentdate,
format( getdate()-7,'dd-MM-yyyy' )as currentdate

select year(getdate()) as year,month(getdate()) as month,day(getdate()) as day

--add 7 year to given date
select dateadd(year,7,'2023/12/14') as result_date
--add 7 month to given date
select dateadd(month,7,'2023/12/14') as result_date
--add 1 month to given date
select dateadd(week,1,'2023/12/14') as result_date
--add 1 hour to given date
select dateadd(hour,1,'2023/12/14 09:00:30.430') as result_date
--add 7 month to current date
select dateadd(month,7,getdate()) as result_date
--sub 1 month to given date
select dateadd(month,-1,'2023/12/14') as result_date

--date diff
select datediff(year,'2022/11/12','2023/12/14') as result_date

select datediff(quarter,'2022/11/12','2023/12/14') as result_date

select datediff(month,'2022/11/12','2023/12/14') as result_date

select datediff(day,'2022/11/12','2023/12/14') as result_date

select datediff(hour,'2022/11/12 09:00:30.430','2023/12/14 08:00:10.430') as result_date

--
select format(getdate(),'dd--MM--yyyy') as today,date,datediff(month,getdate(),date) as date_diff
from walmart

select product_line,
format(getdate(),'dd--MM--yyyy') as today,
date,
datediff(month,getdate(),date) as month_diff,
datediff(year,getdate(),date) as year_diff
from walmart

select 
format(getdate(),'dd') as 'Current Date',
format(getdate(),'MM') as 'Current Month',
format(getdate(),'yyyy') as 'Current Year',
format(getdate()+7,'dd--MM--yyyy') as Next_Week,
format(dateadd(month,-5,getdate()),'dd--MM--yyyy') as last_5_months_date,
date as product_sales_date,
datediff(day,getdate(),date) as Days_Diff
from walmart

--5 DateFromParts()
select datefromparts(2023,02,16) as date
--return null value
select datefromparts(null,02,16) as date
--return error
select datefromparts(2023,02,-16) as date
--return error
select datefromparts(2023,02,56) as date


--datename()
SELECT DATENAME(YEAR,'2023/02/16') as date_in_year--year

SELECT DATENAME(yy,'2023/02/16') as date_in_year--year

SELECT DATENAME(month,'2023/02/16') as date_in_month--month
--retrieve day
SELECT DATENAME(day,CURRENT_TIMESTAMP) as date_in_day--day
--retrieve hour
SELECT DATENAME(hour,'2023/02/16 10:15:20') as time_in_hours--hour

--7 datepart()
--year SEGMENT
SELECT DATEPART(YEAR,'2023/02/16') as date_in_year
--month
SELECT DATEPART(MONTH,'2023/02/16') as date_in_month
--day segment
SELECT DATEPART(DAY,'2023/02/16') as date_in_day

SELECT DATENAME(minute,'2023/02/16 10:15:20') as time_in_minute
--hour with getdate
SELECT DATENAME(hour,getdate()) as time_in_hours

SELECT DATEPART(DAY,getdate()+1) as date_in_day
--8 day()
SELECT DAY('2023/02/16') as day_of_month
--9 month()
SELECT MONTH('2023/02/16') as month

SELECT Date, MONTH(Date) as MONTH_OF_SALE from walmart
--10 year()
select date,year(date) as year from walmart

select date,year(date) as year,month(date) as month, day(date) as day from walmart
order by date
--order by year,month,day

--11 EMONTH()
SELECT EOMONTH(getdate()) as end_of_MONTH

SELECT EOMONTH(getdate(),-2) as end_of_MONTH

SELECT DAY(EOMONTH(CURRENT_TIMESTAMP)) as end_of_MONTH

Select date,year(date) as Year,
month(date) as Month_Of_Sale,
EOMONTH(date) as LAST_DATE_OF_MONTH,
DAY(EOMONTH(DATE)) as NO_OF_DAYS_IN_MONTH
from walmart

--12 DATETRUNC() function

SELECT DATETRUNC(YEAR,'2023/02/16') as Result

SELECT DATETRUNC(Quarter,'2023/02/16') as Result

SELECT DATETRUNC(MONTH,'2023/02/16') as Result

SELECT DATETRUNC(DAY,'2023/02/16') as Result

SELECT DATETRUNC(HOUR,'2023/02/16 14:15:20') as Result

--getUTCdate() function
Select GETUTCDATE() as UTC_Date_time

--CAST() FUNCTION
Select Cast(22.4 as int) AS RESULT

Select Cast(25.65 as varchar) AS RESULT

Select Cast('2017-08-25' as DATETIME) AS RESULT

Select Cast('2017-08-25' as DATE) AS RESULT

Select Cast(5.95446 as dec(5,4)) AS RESULT

Select Cast(5.95 as dec(3,1)) AS RESULT

Select Cast(10.3496847 as money) AS RESULT

select city,cast(sum(quantity*unit_price) as int) amount from walmart
group by city

--2 convert() function

Select Convert(int,22.4) AS RESULT

Select Convert(VARCHAR,25.65) AS RESULT

Select Convert(varchar(30),getdate(),110) AS UsDate,
	Convert(varchar(30),getdate(),112) AS isoDate,
	Convert(varchar(30),getdate(),113) AS EuroDate

Select substring(product_line,1,30) as ProductName,
	Cast(Unit_Price as int) AS unitprice
	from walmart
	where convert(int,unit_price) like '3%'

select city,concat('The total sale is ', cast (ceiling(sum(gross_income))as int)) as computed
	from walmart
	where unit_price between 35.00 and 40.00
	group by city
--3 iif() function
select iif(50>60,'50 is greater','60 is greater')

select product_line,
	concat('the total sale is ',cast(ceiling(sum(gross_income)) as int)) as Computed,
	iif(gross_income>15,'good','bad') as Tags
	from walmart
	where unit_price between 35.00 and 40.00
	group by  product_line,gross_income
	order by tags desc,computed desc

--4 nullif() function---it returns null if both are equal expressions otherwise returns first expression
select nullif('Hello','Hello')

select nullif('Hello','World')

select nullif('2017-08-25','2017-08-25')

--5 case
select product_line,sum(quantity) as Total_Quantity,
CASE
	when sum(quantity)> 950 then 'quantity is greater than 950'
	when sum(quantity)> 900 then 'quantity is greater than 900'
	when sum(quantity)= 900 then 'quantity is 900'
	else 'quantity is less than 900'
	end as quantity_info
	from walmart
	group by product_line
	order by total_quantity


select  distinct product_line,count( distinct city) as CITY_COUNT,ceiling(sum(gross_income)) as total_gross,
	iif(sum(gross_income)>2500,'met target','not met target') as Tags
	from walmart
	group by product_line
	order by total_gross desc

select product_line,payment,
CASE
	when payment='cash' then 'C'
	when payment='credit card'then 'CC'
	when payment='Ewallet'then 'E'
	else 'null'
	end as PAYMENT_MODE
	from walmart


--6 coalesce()
select coalesce(Null,1,2,'sql')