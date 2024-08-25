SELECT * FROM spending.spendings;

-- sum of total spending by gender,year in school, and major

select gender, year_in_school, major, sum(housing + food + transportation + entertainment + personal_care + technology + health_wellness + miscellaneous) as total_spending
from spendings
group by 1,2,3 ;

select gender, count(gender) total_gender
from spendings
group by 1;

-- Max total count of preferred payment method by gender

select gender, preferred_payment_method, max(total_payments) as Max_count
from (
	select gender, preferred_payment_method, count(preferred_payment_method) as total_payments
	from spendings
	group by 1,2) AB
group by 1, 2;

-- year in school and their preferred payment method

select year_in_school, preferred_payment_method, count(preferred_payment_method) as total_payments
from spendings
group by 1, 2
order by 3;

-- Gender and year in school divided by 3 groups: Low Money, Mid Money, High Money. Division based on how much Financial Aid they received

Select  gender,year_in_school, SUM(housing + food + transportation + entertainment + personal_care + technology + health_wellness + miscellaneous) as Total_spending,
       Case
           When financial_aid >= 700 THEN 'Low Money'
           When financial_aid >= 400 AND financial_aid < 700 THEN 'Mid Money'
           when financial_aid >= 0 AND financial_aid < 400 THEN 'High Money'
       End as Finance_Given
from spendings
group by gender,year_in_school, finance_given
order by 4;

-- Percentage of gender in dataset

Select round(count(*) * 100.0 / (select count(*) from spendings),1) as percentage
from spendings
group by year_in_school


-- Spenders by years in school

select year_in_school, SUM(housing + food + transportation + entertainment + personal_care + technology + health_wellness + miscellaneous) as Total_spending
from spendings
group by 1
order by 2





