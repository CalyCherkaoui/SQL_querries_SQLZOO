/*           Tuto 5 -Aggregate functins _ SUM _ COUNT.              */
/*                                                                */
/* Table world(name, continent, area, population, gdp)            */
/*  Using SUM, Count, MAX, DISTINCT and ORDER BY GROUP BY and HAVING.*/
/* ***************************************************************/

/* 1 - total population 
Show the total population of the world. */

SELECT SUM(population)
  FROM world;

/* 2 - List all the continents - just once each. */

SELECT DISTINCT(continent)
  FROM world;

/* 3 - Give the total GDP of Africa */

SELECT SUM(gdp) AS afri_gdp
  FROM world
  WHERE continent = 'Africa';

/* 4 - Count the big countries*/

SELECT COUNT(name)
  FROM world
 WHERE area >= 1000000;

/* 5 - Baltic states population 
What is the total population of ('Estonia', 'Latvia', 'Lithuania') */

SELECT SUM(population) AS baltic_pop
  FROM world
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

/* 6 Using GROUP BY and HAVING - 
For each continent show the continent and number of countries */

SELECT continent, COUNT(name)
  FROM world
 GROUP BY continent; 

/* 7 - Counting big countries in each continent 
For each continent show the continent and number of countries with populations of at
 least 10 million.*/

 SELECT continent, COUNT(name)
   FROM world
  WHERE population >= 10000000
  GROUP BY continent; 

/* 8 - Counting big continents
List the continents that have a total population of at least 100 million. */

 SELECT continent
   FROM world
  GROUP BY continent
  HAVING SUM(population) > 100000000; 
