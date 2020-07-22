/*                      Tuto 7 - JOIN OPERATION.                     */
/*                                                                   */
-- Table movie (id 	title 	yr 	director 	budget 	gross)
-- Table actor (id 	name)
-- Table casting(movieid 	actorid 	ord)

/* https://napier.sqlzoo.net/wiki/More_JOIN_operations               */
/* *******************************************************************/

/* 1 1962 movies
List the films where the yr is 1962 [Show id, title] */

SELECT id, title
  FROM movie
 WHERE yr=1962; 

/* 2 - Give year of 'Citizen Kane'. */

SELECT yr
  FROM movie
 WHERE title LIKE 'Citizen Kane';

/* 3 - List all of the Star Trek movies, include the id, title and yr (all of these movies
 include the words Star Trek in the title). Order results by year. */

SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr;

/* 4 - What id number does the actor 'Glenn Close' have? */

SELECT id
  FROM actor
 WHERE name LIKE 'Glenn Close';

/* 5 - What is the id of the film 'Casablanca' */

SELECT id
  FROM movie
 WHERE title LIKE 'Casablanca';

/* 6 - Obtain the cast list for 'Casablanca'.
what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question) */

SELECT name
  FROM actor
  JOIN casting
    ON id = actorid
 WHERE movieid=11768;


/* 7 - Obtain the cast list for the film 'Alien' */

SELECT name
  FROM actor
  JOIN casting
    ON id = actorid
 WHERE movieid=(SELECT id 
                  FROM movie
                 WHERE title LIKE 'Alien');

/* 8 - List the films in which 'Harrison Ford' has appeared */

SELECT title
  FROM movie
  JOIN casting
    ON movie.id = casting.movieid
 WHERE actorid = ( SELECT id 
                     FROM actor
                    WHERE name LIKE 'Harrison Ford');

/* 9 - List the films where 'Harrison Ford' has appeared - but not in the starring role.
 [Note: the ord field of casting gives the position of the actor. If ord=1 then this
actor is in the starring role] */

SELECT title
  FROM movie
  JOIN casting
    ON movie.id = casting.movieid
 WHERE actorid = ( SELECT id 
                     FROM actor
                    WHERE name LIKE 'Harrison Ford')
   AND ord != 1;
 

/* 10 - List the films together with the leading star for all 1962 films. */

SELECT movie.title, actor.name
  FROM movie, actor, casting
 WHERE yr = 1962
   AND actorid = actor.id
   AND movieid=movie.id
   AND casting.ord = 1;




/* 11 - Which were the busiest years for 'Rock Hudson', show the year and the number of
 movies he made each year for any year in which he made more than 2 movies.*/

SELECT yr,COUNT(title)
  FROM movie 
  JOIN casting ON movie.id=movieid
  JOIN actor   ON actorid=actor.id
 WHERE name='Rock Hudson'
 GROUP BY yr
HAVING COUNT(title) > 2

/* 12 - List the film title and the leading actor for all of the films 'Julie Andrews' 
played in.
Did you get "Little Miss Marker twice"?*/

-- step 1 get id of julie andrews
--     SELECT id FROM actor where name='Julie Andrews'  ====>> output 179
-- step 2 all the movies id wher actor s id is Julies
--     SELECT movieid FROM casting WHERE actorid IN ( 179) =====> output 20136, 20181...

-- step 3 look for the titles of these movieid
--     SELECT title FROM movie WHERE id IN (20136, 20181...) =====> 'marry Popins', 'victo'

-- step 4 get the actors of all these movies leadong (ord = 1)
--     SELECT title, actorid
--      FROM  movie 
--      JOIN casting ON (movieid= movie.id AND ord = 1)
--     WHERE movie.id IN (20136, 20181...)

-- step 5 looking for actors names withe the selected actorid from table actor
--     SELECT title, name
--       FROM  movie 
--       JOIN casting ON (movieid= movie.id AND ord = 1)
--       JOIN actor ON actor.id = actorid
--      WHERE movie.id IN (20136, 20181...)

-- step 5 replace the list in where condition by its original query
SELECT title, name
  FROM  movie 
  JOIN casting ON (movieid= movie.id AND ord = 1)
  JOIN actor ON actor.id = actorid
 WHERE movie.id IN (
                    SELECT movieid
                      FROM casting 
                     WHERE actorid IN (
                                      SELECT id 
                                        FROM actor 
                                       where name='Julie Andrews')
                    );

/* 13 - Obtain a list, in alphabetical order, of actors who've had at least 15 
starring roles. */

/* 14 - List the films released in the year 1978 ordered by the number of actors in the
 cast, then by title. */

/* 15 - List all the people who have worked with 'Art Garfunkel'. */


