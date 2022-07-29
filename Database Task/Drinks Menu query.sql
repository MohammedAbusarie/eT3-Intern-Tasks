/* ===|| Mohammed Abusarie Fouad ||=== */
/* MS SQL Server */
use Bulky;

/* Drink has the highest calories */
SELECT TOP(1) Beverage_category,Beverage,Calories FROM dbo.drinksMenu ORDER BY Calories DESC ;

/* Average calorie amount for each drink category */
SELECT Beverage_category, AVG(Calories) AS average_calorie 
FROM  drinksMenu 
GROUP BY Beverage_category;

/* Drinks have below average calorie amount */
SELECT q1.Beverage,q1.Beverage_category, q1.Calories ,q2.average_calorie FROM
(
SELECT Beverage,Beverage_category, Calories 
FROM  drinksMenu 
) q1
INNER JOIN
(
SELECT dm.Beverage_category, AVG(dm.Calories) AS average_calorie 
FROM  drinksMenu dm
GROUP BY dm.Beverage_category
) q2
ON
q1.Beverage_category = q2.Beverage_category
WHERE
q1.Calories < q2.average_calorie








