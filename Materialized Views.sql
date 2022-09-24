Q.1 Consider a materialized view on tables Faculty(name,homeDept) and Teaches(prof,course,dept): create materialized view V as select name from Faculty where name not in (select prof from Teaches where dept = homeDept) Which of the following modifications can NOT cause a change to V?
a. insertion into Teaches
b. deletion from Teaches
c. insertion into Faculty
d. update to Teaches.course

ANS = d

Q.2 Consider a materialized view on table Item(category,price): create view V as select category from Item group by category having min(price) < 25 Which of the following modifications can NOT cause tuples to be deleted from V?
a. deletion from Item
b. update to Item.category
c. update to Item.price that increases value
d. update to Item.price that decreases value

ANS = d

Q.3 Consider tables R(A,B) and S(B,C) and a query Q = select A,C from R,S where R.B=S.B and A < 10 and C > 20. Which of the following materialzed views can NOT be used to help evaluate Q?
a. V1 = select A,C from R,S where R.B=S.B
b. V2 = select A,C from R,S where A < 10 and C > 20
c. V3 = select A,R.B,S.B,C from R,S where A < 10 and C > 20
d. V4 = select * from R where A < 10

ANS = b
