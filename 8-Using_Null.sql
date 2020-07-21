/*                      Tuto 7 - JOIN OPERATION.                     */
/*                                                                   */
/* https://napier.sqlzoo.net/wiki/Using_Null                         */
/* *******************************************************************/

/* 1 - NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN 
List the teachers who have NULL for their department.
Why we cannot use = */

/* 2 - Note the INNER JOIN misses the teachers with no department and the departments 
with no teacher.*/

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

/* 3 - Use a different JOIN so that all teachers are listed. */

/* 4 - Use a different JOIN so that all departments are listed. */


