/*                      Tuto 7 - JOIN OPERATION.                     */
/*                                                                   */
/* https://napier.sqlzoo.net/wiki/More_JOIN_operations               */
/* *******************************************************************/

/* 1 1962 movies
List the films where the yr is 1962 [Show id, title] */

/* 2 - Give year of 'Citizen Kane'. */

/* 3 - List all of the Star Trek movies, include the id, title and yr (all of these movies
 include the words Star Trek in the title). Order results by year. */

/* 4 - What id number does the actor 'Glenn Close' have? */

/* 5 - What is the id of the film 'Casablanca' */

/* 6 - Obtain the cast list for 'Casablanca'.
what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question) */

/* 7 - Obtain the cast list for the film 'Alien' */

/* 8 - List the films in which 'Harrison Ford' has appeared */

/* 9 - List the films where 'Harrison Ford' has appeared - but not in the starring role.
 [Note: the ord field of casting gives the position of the actor. If ord=1 then this
  actor is in the starring role] */

/* 10 - List the films together with the leading star for all 1962 films. */

/* 11 - Which were the busiest years for 'Rock Hudson', show the year and the number of
 movies he made each year for any year in which he made more than 2 movies.*/

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1;

/* 12 - List the film title and the leading actor for all of the films 'Julie Andrews' 
played in.
Did you get "Little Miss Marker twice"?*/

SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')

/* 13 - Obtain a list, in alphabetical order, of actors who've had at least 15 
starring roles. */

/* 14 - List the films released in the year 1978 ordered by the number of actors in the
 cast, then by title. */

/* 15 - List all the people who have worked with 'Art Garfunkel'. */


