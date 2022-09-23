The schema:

Movie ( mID, title, year, director )
English: There is a movie with ID number mID, a title, a release year, and a director.

Reviewer ( rID, name )
English: The reviewer with ID number rID has a certain name.

Rating ( rID, mID, stars, ratingDate )
English: The reviewer rID gave the movie mID a number of stars rating (1-5) on a certain ratingDate. 

Q.1 Add the reviewer Roger Ebert to your database, with an rID of 209. 
insert into reviewer
(rID, name)
values (209, "Roger Ebert")

Q.2 For all movies that have an average rating of 4 stars or higher, add 25 to the release year. 
update movie
set year = year+25
where mid in (select mid 
              from rating 
              group by mid 
              having avg(stars) >=4)

Q.3 Remove all ratings where the movie year is before 1970 or after 2000, and the rating is fewer than 4 stars. 
delete from rating
where mid in (select mid 
              from movie 
              where year<1970 or year>2000) 
      and stars <4

