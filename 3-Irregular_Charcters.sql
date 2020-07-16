/*            Tuto 3 -Table of Nobel Prize winners..             */
/* ***************************************************************/

/* 1 - Winners from 1950
Change the query shown so that it displays Nobel prizes for 1950. */

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

/* 2 - 1962 Literature
Show who won the 1962 prize for Literature. */

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

/* 3 - Albert Einstein
Show the year and subject that won 'Albert Einstein' his prize. */

SELECT yr, subject
  FROM nobel
 WHERE winner LIKE 'Albert Einstein';

/* 4 - Recent Peace Prizes
Give the name of the 'Peace' winners since the year 2000, including 2000. */

SELECT winner
  FROM nobel
 WHERE subject LIKE 'Peace'
   AND yr >= 2000;

/* 5 - Literature in the 1980's
Show all details (yr, subject, winner) of the Literature prize winners for
 1980 to 1989 inclusive. */

SELECT yr, subject, winner
  FROM nobel
 WHERE subject LIKE 'Literature'
   AND yr BETWEEN 1980 and 1989;

/* 6 - Only Presidents
Show all details of the presidential winners: 
    Theodore Roosevelt
    Woodrow Wilson
    Jimmy Carter
    Barack Obama */

SELECT yr, subject, winner
  FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

/* 7 - Show the winners with first name John */

SELECT winner
  FROM nobel
 WHERE winner LIKE 'John %';

/* 9 - Exclude Chemists and Medics
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine*/

SELECT yr, subject, winner
  FROM nobel
 WHERE subject NOT LIKE 'Chemistry'
   AND subject NOT LIKE 'Medicine'
   AND yr = 1980;

/* 11 - Non-ASCII characters
Find all details of the prize won by PETER GRÜNBERG */

SELECT *
  FROM nobel
 WHERE winner LIKE 'PETER GRÜNBERG';

/* 12 - Single quotes

Find all details of the prize won by EUGENE O'NEILL
Escaping single quotes
You can't put a single quote in a quote string directly. You can use two single quotes 
within a quoted string.*/

SELECT *
  FROM nobel
 WHERE winner LIKE 'EUGENE O''NEILL';

/* 13 - Knights in order 
List the winners, year and subject where the winner starts with Sir. Show the the most
 recent first, then by name order.*/

SELECT winner, yr, subject
  FROM nobel
 WHERE winner LIKE 'Sir%'
 ORDER BY yr DESC, winner ASC;

/* 14 - The expression subject IN ('Chemistry','Physics') as a value
The expression subject IN ('Chemistry','Physics') can be used as a value - 
it will be 0 or 1.
Show the 1984 winners and subject ordered by subject and winner name; but list
Chemistry and Physics last.*/

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY 
       CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END,
       subject,
       winner;
