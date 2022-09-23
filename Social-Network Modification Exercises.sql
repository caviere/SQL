The schema:

Highschooler ( ID, name, grade )
English: There is a high school student with unique ID and a given first name in a certain grade.

Friend ( ID1, ID2 )
English: The student with ID1 is friends with the student with ID2. Friendship is mutual, so if (123, 456) is in the Friend table, so is (456, 123).

Likes ( ID1, ID2 )
English: The student with ID1 likes the student with ID2. Liking someone is not necessarily mutual, so if (123, 456) is in the Likes table, there is no guarantee that (456, 123) is also present. 

Q.1 It is time for the seniors to graduate. Remove all 12th graders from Highschooler.
delete from highschooler
where grade = 12

Q.2 If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple. 
delete from Likes
where ID1 in (select l1.ID1
            from Likes as l1, Friend as f
            where l1.ID1 = f.ID1 and l1.ID2 = f.ID2
            and l1.ID2 not in (select ID1 from Likes as l2 where l2.ID2 = l1.ID1))

Q.3 For all cases where A is friends with B, and B is friends with C, add a new friendship for the pair A and C. Do not add duplicate friendships, friendships that already exist, or friendships with oneself.
INSERT INTO Friend
SELECT F1.ID1, F2.ID2
FROM Friend F1
INNER JOIN Friend F2 ON F1.ID2 = F2.ID1
WHERE F1.ID1 <> F2.ID2
EXCEPT
SELECT * FROM Friend;


