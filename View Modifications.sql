Q.1 Consider tables R(A,B) and S(B,C) and a view V = select A,C from R,S where R.B=S.B. [[may want to format]] Suppose R={(1,5),(2,5)} and S={(5,10)}, so V={(1,10),(2,10)}. The user wants to delete tuple (2,10) from V. Which of the following modifications to R and/or S does NOT correctly reflect this modification?
a. delete (2,5) from R
b. update (2,5) to (2,6) in R
c. update (2,5) to (1,6) in R
d. delete (5,10) from S

ANS = d
