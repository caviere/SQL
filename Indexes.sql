Q.1 Consider the following query:

Select * From Apply, College
Where Apply.cName = College.cName
And Apply.major = 'CS' and College.enrollment < 5000

Which of the following indexes could NOT be useful in speeding up query execution?

a. Tree-based index on Apply.cName
b. Hash-based index on Apply.major
c. Hash-based index on College.enrollment
d. Hash-based index on College.cName

ANS = c

Q.2 Consider the following query:

Select * From Student, Apply, College
Where Student.sID = Apply.sID and Apply.cName = College.cName
And Student.GPA > 1.5 And College.cName < 'Cornell'


Suppose we are allowed to create two indexes, and assume all indexes are tree-based. Which two indexes do you think would be most useful for speeding up query execution?

a. Student.sID, College.cName
b. Student.sID, Student.GPA
c. Apply.cName, College.cName
d. Apply.sID, Student.GPA

 ANS = a
 
Q.3  Consider the following relational schema:

   Course(courseName unique, department, instrID)
   Instructor(instrID unique, office)
   Student(studentID unique, major)
   Enroll(studentID, courseName, unique (studentID,courseName))

Suppose there are five types of queries commonly asked on this schema:

    Given a course name, find the department offering that course.
    List all studentIDs together with all of the departments they are taking courses in.
    Given a studentID, find the names of all courses the student is enrolled in.
    List the offices of instructors teaching at least one course.
    Given a major, return the studentIDs of students in that major.

Which of the following indexes could NOT be useful in speeding up execution of one or more of the above queries?

a. Index on Instructor.office
b. Index on Course.courseName
c. Index on Course.instrID
d. Index on Instructor.instrID

ANS = a

Q.4 Consider a table storing temperature readings taken by sensors:

   Temps(sensorID, time, temp)

Assume the pair of attributes [sensorID,time] is a key. Consider the following query:

   select * from Temps
   where sensorID = 'sensor541'
   and time = '05:11:02'

Consider the following scenarios:

A - No index is present on any attribute of Temps

B - An index is present on attribute sensorID only

C - An index is present on attribute time only

D - Separate indexes are present on attributes sensorID and time

E - A multi-attribute index is present on (sensorID,time)

Suppose table Temps has 50 unique sensorIDs and each sensorID has exactly 20 readings. Furthermore there are exactly 10 readings for every unique time in Temps.

For each scenario A-E, determine the maximum number of tuples that might be accessed to answer the query, assuming one "best" index is used whenever possible. (Dont count the number of index accesses.) Which of the following combinations of values is correct?

a. A:500, B:20, D:10
b. A:1000, C:10, E:1
c. C:1000, D:20, E:1
d. A:100, C:10, E:10

ANS = b




