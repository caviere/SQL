Q.1 
Suppose client C1 issues transactions T1;T2 and client C2 concurrently issues transactions T3;T4. How many different "equivalent sequential orders" are there for these four transactions?
a. 2
b. 4
c. 6
d. 24

ANS = c

Q.2 Consider a relation R(A) containing {(5),(6)} and two transactions: T1: Update R set A = A+1; T2: Update R set A = 2*A. Suppose both transactions are submitted under the isolation and atomicity properties. Which of the following is NOT a possible final state of R?
a. {(10,12)}
b. {(11,13)}
c. {(11,12)}
d. {(12,14)}

ANS = c

Q.3 Consider tables R(A) and S(B) and the following transaction T1:

T1: set transaction isolation level repeatable read;
    select * from R;
    select * from R;
    select * from S;
    commit;

Suppose table R initially has one tuple with value A=3 and table S initially has one tuple with value B=6. Consider the following possible transactions T2, executed around the same time as T1. Which one of them can cause the two transactions to exhibit nonserializable behavior?

a. T2: set transaction isolation level serializable; update S set B=7; commit;
b. T2: set transaction isolation level serializable; update S set B=5; delete from R; commit;
c. T2: set transaction isolation level serializable; update R set A=4; update S set B=5 where B<5; commit;
d. T2: set transaction isolation level serializable; insert into S values (5); delete from R where A=2; commit;

ANS = b

Q.4 Consider a relation R(x) containing integers. Suppose Alice runs a transaction that is a query:

   select sum(x) from R;
   commit;

Betty's transaction is a sequence of inserts:

   insert into R values (10);
   insert into R values (20);
   insert into R values (30);
   commit;

Carol's transaction is a sequence of deletes:

   delete from R where x=30;
   delete from R where x=20;
   commit;

Before any of these transactions execute, the sum of the integers in R is 1000, and none of the integers are 10, 20, or 30. If Alice's, Betty's, and Carol's transactions run at about the same time, and each runs under isolation level READ COMMITTED, which of the following sums could be produced by Alice's transaction?

a. 970
b. 1030
c. 1020
d. 1040

ANS = d

Q.4 Consider a relation R(x) containing integers. Suppose Alice runs a transaction that is a query:

   select sum(x) from R;
   commit;

Betty's transaction is a sequence of inserts:

   insert into R values (10);
   insert into R values (20);
   insert into R values (30);
   commit;

Carol's transaction is a sequence of deletes:

   delete from R where x=30;
   delete from R where x=20;
   commit;

Before any of these transactions execute, the sum of the integers in R is 1000, and none of these integers are 10, 20, or 30. Alice's, Betty's, and Carol's transactions run at about the same time. Which of the following sums could be returned by Alice's transaction if all three transactions run under isolation level READ UNCOMMITTED, but not if all three run under isolation level SERIALIZABLE?

a. 1000
b. 1010
c. 950
d. 1040

ANS = d

