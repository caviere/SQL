The schema:

Highschooler ( ID, name, grade )
English: There is a high school student with unique ID and a given first name in a certain grade.

Friend ( ID1, ID2 )
English: The student with ID1 is friends with the student with ID2. Friendship is mutual, so if (123, 456) is in the Friend table, so is (456, 123).

Likes ( ID1, ID2 )
English: The student with ID1 likes the student with ID2. Liking someone is not necessarily mutual, so if (123, 456) is in the Likes table, there is no guarantee that (456, 123) is also present.

Q.1 Find the names of all students who are friends with someone named Gabriel. 
select name
from Highschooler
where ID in (select ID1 from Friend
            where ID2 in (select ID from Highschooler where name = 'Gabriel'))

Q.2 For every student who likes someone 2 or more grades younger than themselves, return that student name and grade, and the name and grade of the student they like.
select h1.name, h1.grade, h2.name, h2.grade
from Highschooler as h1, Highschooler as h2, Likes
where h1.ID = Likes.ID1 and h2.ID = Likes.ID2 and h1.grade = h2.grade+2

Q.3 For every pair of students who both like each other, return the name and grade of both students. Include each pair only once, with the two names in alphabetical order. 
SELECT H1.name, H1.grade, H2.name, H2.grade
FROM Highschooler H1, Highschooler H2, Likes L1, Likes L2
WHERE (H1.ID = L1.ID1 AND H2.ID = L1.ID2) AND 
(H2.ID = L2.ID1 AND H1.ID = L2.ID2) AND H1.name < H2.name
ORDER BY H1.name, H2.name;

Q.4 Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades. Sort by grade, then by name within each grade. 
select name, grade 
from highschooler
where ID not in (select ID1 from likes)and ID not in (select ID2 from likes)
order by grade, name

Q.5 For every situation where student A likes student B, but we have no information about whom B likes (that is, B does not appear as an ID1 in the Likes table), return A and B names and grades.
select h1.name, h1.grade, h2.name, h2.grade
from highschooler h1, highschooler h2, likes l1
where (h1.ID = l1.ID1 and h2.ID = l1.ID2) and h2.ID not in
(select ID1 from likes)
order by h1.name

Q.6 Find names and grades of students who only have friends in the same grade. Return the result sorted by grade, then by name within each grade. 
select name,grade
from Highschooler
where ID not in (select h1.ID from Highschooler as h1,Highschooler as h2,Friend as f1
            where h1.ID = f1.ID1 and h2.ID = f1.ID2 and h1.grade <> h2.grade)
order by grade, name

Q.7  For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!). For all such trios, return the name and grade of A, B, and C.
select distinct h1.name, h1.grade, h2.name, h2.grade, h3.name, h3.grade
from Highschooler as h1, Highschooler as h2, Highschooler as h3, Likes as l1, Friend as f1
where h1.ID = l1.ID1 and h2.ID = l1.ID2 and
      h2.ID not in (select ID2 from Friend where h1.ID = ID1)
      and h3.ID in (select ID2 from Friend where h1.ID = ID1)
      and h3.ID in (select ID2 from Friend where h2.ID = ID1)

Q.8 Find the difference between the number of students in the school and the number of different first names. 
select count(ID)-count(distinct name)
from Highschooler

Q.9 Find the name and grade of all students who are liked by more than one other student. 
select name, grade
from Highschooler
where ID in 
(select ID2 from Likes group by ID2 having count(distinct ID1)>1)

Q.10 For every situation where student A likes student B, but student B likes a different student C, return the names and grades of A, B, and C. 
select distinct h1.name, h1.grade, h2.name, h2.grade, h3.name, h3.grade
from Highschooler h1, Highschooler h2, Highschooler h3, Likes l1, 
Likes l2
where h1.ID = l1.ID1 and h2.ID = l1.ID2 and 
h2.ID = l2.ID1 and h3.ID = l2.ID2
            and h1.ID <> l2.ID2

Q.11 Find those students for whom all of their friends are in different grades from themselves. Return the students names and grades. 
select name, grade
from highschooler where ID not in
(select h1.ID from highschooler h1, highschooler h2,
 friend f1 where
 h1.ID = f1.ID1 and h2.ID = f1.ID2 and h1.grade = h2.grade)

Q.12 What is the average number of friends per student? (Your result should be just one number.) 
select avg(f)
from (select count(ID2) as f from Friend group by ID1)

Q.13 ind the number of students who are either friends with Cassandra or are friends of friends of Cassandra. Do not count Cassandra, even though technically she is a friend of a friend. 
SELECT COUNT(*)
FROM Friend
WHERE ID1 IN (
  SELECT ID2
  FROM Friend
  WHERE ID1 IN (
    SELECT ID
    FROM Highschooler
    WHERE name = 'Cassandra'
  )
);

Q.14 Find the name and grade of the student(s) with the greatest number of friends.
SELECT name, grade
FROM Highschooler
INNER JOIN Friend ON Highschooler.ID = Friend.ID1
GROUP BY ID1
HAVING COUNT(*) = (
  SELECT MAX(count)
  FROM (
    SELECT COUNT(*) AS count
    FROM Friend
    GROUP BY ID1
  )
);




