Q.1 Consider table Employee(name,dept,salary), and the SQL statement: update Employee set salary = salary+100 where dept='CS' Which of the following privileges on table Employee is NOT needed to execute this statement?
a. update(salary)
b. read(name)
c. read(dept)
d. read(salary)

ANS = b

Q.2 Consider table Employee(name,dept,salary). Is it possible to grant a user modification privileges only on those employees whose salary is above average?
a. Yes
b. No

ANS = b

Q.3  Consider table R with owner A. Suppose we have the sequence: (1) A grants select(R) to B with grant option; (2) A grants select(R) to C with grant option; (3) B grants select(R) to D; (4) C grants select(R) to D; (5) A revokes select(R) from B with restrict. Does step (5) generate an error?
a. Yes
b. No

ANS = b

[Q3] The following SQL statement over tables R(c,d), S(f,g), and T(a,b) requires certain privileges to execute:

   UPDATE T
   SET a=1, b=2
   WHERE a <= ALL (SELECT d FROM R)
   OR EXISTS (SELECT f FROM S WHERE f > T.a)

Which of the following privileges is not useful for execution of this SQL statement?

a. SELECT ON R
b. SELECT ON S(f)
c. UPDATE ON T(a)
d. SELECT ON T(b)

ANS = d

[Q4] Consider a set of users U, V, W, X, and Y. Suppose user U creates a table T and thus is the owner of T. Now suppose the following set of statements is executed in order:

  1. User U: grant select on T to V,W with grant option
  2. User V: grant select on T to W
  3. User W: grant select on T to X,Y
  4. User U: grant select on T to Y
  5. User U: revoke select on T from V restrict
  6. User U: revoke select on T from W cascade

Which of the following statements is true?

a. X does not have SELECT ON T privilege after statement 5
b. Y does not have privilege SELECT ON T after statement 6
c. W does not have privilege SELECT ON T after statement 5
d. X does not have privilege SELECT ON T after statement 6

ANS = d

Q.5 The following SQL statement over tables R(a,b), S(b,c), and T(a,c) requires certain privileges to execute:

   UPDATE R
   SET a = 10
   WHERE b IN (SELECT c FROM S)
   AND NOT EXISTS (SELECT a FROM T WHERE T.a = R.a)

Which of the following privileges is not useful for execution of this SQL statement?

a. SELECT ON R(a)
b. INSERT ON R(a)
c. SELECT ON S
d. SELECT ON S(c)

ANS = b

Q.6 Consider a set of users A, B, C, D, E. Suppose user A creates a table T and thus is the owner of T. Now suppose the following set of statements is executed in order:

  1. User A: grant update on T to B,C with grant option
  2. User B: grant update on T to D with grant option
  3. User C: grant update on T to D with grant option
  4. User D: grant update on T to E
  5. User A: revoke update on T from C cascade

After execution of statement 5, which of the following is true? After execution of statement 5, which of the following is true? After execution of statement 5, which of the following is true? After execution of statement 5, which of the following is true? After execution of statement 5, which of the following is true? After execution of statement 5, which of the following is true? After execution of statement 5, which of the following is true? After execution of statement 5, which of the following is true?

a. B no longer has privilege UPDATE ON T
b. A no longer has privilege UPDATE ON T
c. D and E do not have privilege UPDATE ON T, but B does
d. Both D and E have privilege UPDATE ON T, but C doesnt

ANS = b
















































































