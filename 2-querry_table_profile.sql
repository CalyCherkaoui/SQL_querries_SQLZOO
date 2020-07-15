/*         Tuto 2 -Query the World country profile table.        */
/* ***************************************************************/

/* 1 - Introduction
show the name, continent and population of all countries. */

SELECT name, continent, population
From   world;

/* 2 - Large Countries
Show the name for the countries that have a population of at least 200 million.
200 million is 200000000, there are eight zeros. */

SELECT name
From   world
WHERE  population > 200000000;

/* 3 - Per capita GDP
Give the name and the per capita GDP for those countries with a population of at least 
200 million. */

SELECT name, gdp/population
FROM   world
WHERE  population > 200000000;

/* 4 - South America In millions
Show the name and population in millions for the countries of the continent 
'South America'. Divide the population by 1000000 to get population in millions.*/

SELECT name, population/1000000
FROM   world
WHERE  continent LIKE 'South America';

/* 5 - IN (France, Germany, Italy)
Show the name and population for France, Germany, Italy */

SELECT name, population
FROM   world
WHERE  name IN ('France', 'Germany', 'Italy');


