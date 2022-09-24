Q.1 Consider two tables Dorm(name,address), Student(name,dormName,roommateName). Suppose some students live in single rooms (roommateName is NULL) and no dorms are empty. Which of the following referential integrity constraints does NOT hold?
a. Student.dormName to Dorm.name
b. Dorm.name to Student.dormName
c. Student.name to Student.roommateName
d. Student.roommateName to Student.name

ANS = c


Q.2 Consider tables Dorm(name,address) and Student(name,dormName,roommateName) with referential integrity constraints: (1) Student.dormName to Dorm.name; (2) Dorm.name to Student.dormName; (3) Student.roommateName to Student.name. Which of the following modifications can NOT cause a referential integrity violation?
a. insertion into Student
b. deletion from Student
c. update Student.roommateName
d. All of them can cause violations

ANS = d
