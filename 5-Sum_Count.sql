/*           Tuto 5 -Aggregate functins _ SUM _ COUNT.              */
/*                                                                */
/* Table world(name, continent, area, population, gdp)            */
/*  Using SUM, Count, MAX, DISTINCT and ORDER BY.                *
/* ***************************************************************/

/* 1 - total population 
Show the total population of the world. */

SELECT SUM(population)
  FROM world;

/* 2 - List all the continents - just once each. */

SELECT DISTINCT(continent)
  FROM world;

/* 3 - Give the total GDP of Africa */

SELECT DISTINCT(continent)
  FROM world;

