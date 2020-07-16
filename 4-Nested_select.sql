/*           Tuto 4 -SELECT within SELECT Tutorial.              */
/*                                                                */
/* Table world(name, continent, area, population, gdp)            */
/* ***************************************************************/

/* 1- Bigger than Russia
List each country name where the population is larger than that of 'Russia'.*/

SELECT name FROM world
 WHERE population >
                   (SELECT population 
                      FROM world
                     WHERE name='Russia');

/* 2 - Richer than UK
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.*/

/* 3 - Neighbours of Argentina and Australia
List the name and continent of countries in the continents containing either Argentina 
or Australia. Order by name of the country.*/


/* 4 - Between Canada and Poland
Which country has a population that is more than Canada but less than Poland? Show 
the name and the population.*/

/* 5 - Percentages of Germany
Germany (population 80 million) has the largest population of the countries in Europe. 
Austria (population 8.5 million) has 11% of the population of Germany.
Show the name and the population of each country in Europe. Show the population as a 
percentage of the population of Germany.
Decimal places
Percent symbol %
You can use the function CONCAT to add the percentage symbol.
We can use the word ALL to allow >= or > or < or <=to act over a list.*/

/* 6 - Bigger than every country in Europe
Which countries have a GDP greater than every country in Europe? [Give the name only.] 
(Some countries may have NULL gdp values) 
We can refer to values in the outer SELECT within the inner SELECT. We can name the 
tables so that we can tell the difference between the inner and outer versions. */

/* 7 - Largest in each continent
Find the largest country (by area) in each continent, show the continent, the name and 
the area.
he above example is known as a correlated or synchronized sub-query. */

/* 8 - First country of each continent
List each continent and the name of the country that comes first alphabetically.*/

/* 9 - 
Find the continents where all countries have a population <= 25000000. Then find the 
names of the countries associated with these continents. Show name, continent and 
population. */

/* 10 - Some countries have populations more than three times that of any of their 
neighbours (in the same continent). Give the countries and continents.*/
