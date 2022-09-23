The schema:

Movie ( mID, title, year, director )
English: There is a movie with ID number mID, a title, a release year, and a director.

Reviewer ( rID, name )
English: The reviewer with ID number rID has a certain name.

Rating ( rID, mID, stars, ratingDate )
English: The reviewer rID gave the movie mID a number of stars rating (1-5) on a certain ratingDate. 

Q.1 Find the titles of all movies directed by Steven Spielberg. 
select title
from movie
where director like "%steven spielberg%";

Q.2 Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. 
select distinct year 
from movie
join rating
on movie.mID = rating.mID
where stars >= 4
order by year asc;

Q.3 Find the titles of all movies that have no ratings. 
select title
from movie
left join rating
on movie.mID = rating.mID
where movie.mID not in (select mID from rating);

Q.4 Some reviewers didnt provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date. 
select name
from reviewer
join rating 
on reviewer.rID = rating.rID
where ratingDate is Null;

Q.5 Write a query to return the ratings data in a more readable format: reviewer name, movie title, stars, and ratingDate. Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. 
select name, title, stars, ratingDate
from reviewer join rating
on reviewer.rID = rating.rID 
join movie
on rating.mID = movie.mID
order by name asc, title asc;

Q.6 For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time, return the reviewer name and the title of the movie. 
select
	Reviewer.name, Movie.title
from Rating R1
inner join Rating R2 on
	R1.rID = R2.rID
	and R1.mID = R2.mID
	and R1.ratingDate > R2.ratingDate
	and R1.stars > R2.stars
inner join Reviewer on R1.rID = Reviewer.rID
inner join Movie on R1.mID = Movie.mID;

Q.7 For each movie that has at least one rating, find the highest number of stars that movie received. Return the movie title and number of stars. Sort by movie title. 
select title, max(stars)
from movie
join rating 
on movie.mID = rating.mID
group by rating.mID
order by title asc;

Q.8 For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie. Sort by rating spread from highest to lowest, then by movie title. 
select title, max(stars) - min(stars) as "rating spread" 
from movie
join rating
on movie.mID = rating.mID
group by rating.mID
order by "rating spread" desc, title asc;

Q.9 Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980. (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies after. Dont just calculate the overall average rating before and after 1980.) 
select avg(year)
from movie
      (select avg(distinct stars)
           from rating)

Q.10 Find the names of all reviewers who rated Gone with the Wind. 
select distinct name
from reviewer 
join rating
on reviewer.rID = rating.rID
where mID = 101;

Q.11 For any rating where the reviewer is the same as the director of the movie, return the reviewer name, movie title, and number of stars. 
select name, title, stars
from reviewer
join rating
on reviewer.rID = rating.rID
join movie on rating.mID = movie.mID 
where name = director;

Q.12 Return all reviewer names and movie names together in a single list, alphabetized. (Sorting by the first name of the reviewer and first word in the title is fine; no need for special processing on last names or removing "The".) 
select title from movie
union 
select name from reviewer
order by name asc;

Q.13 Find the titles of all movies not reviewed by Chris Jackson. 
select distinct title
from Movie
where Movie.mID not in
(select mID from Rating,Reviewer 
 where Reviewer.rID = Rating.rID and 
 Reviewer.name = 'Chris Jackson')

Q.14 For all pairs of reviewers such that both reviewers gave a rating to the same movie, return the names of both reviewers. Eliminate duplicates, dont pair reviewers with themselves, and include each pair only once. For each pair, return the names in the pair in alphabetical order. 
select distinct r1.name,r2.name
from (Rating join Reviewer using(rID)) as r1,
(Rating join Reviewer using(rID)) as r2
where r1.name < r2.name and r1.mID = r2.mId
							order by r1.name

Q.15  For each rating that is the lowest (fewest stars) currently in the database, return the reviewer name, movie title, and number of stars.
select name, title, stars
from (Reviewer join Rating using(rID) join Movie using(mID)) as r1
where not exists 
(select stars from Rating r2 where r1.stars > r2.stars)

Q.16 List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order. 
select title, avg(stars) as "average ratings"
from movie natural join rating 
group by title
order by "average ratings" desc, title asc;

Q.17 Find the names of all reviewers who have contributed three or more ratings. (As an extra challenge, try writing the query without HAVING or without COUNT.) 
select name
from Reviewer
where rID in (select rID from Rating group by rID having count(stars)>2);

Q.18 Some directors directed more than one movie. For all such directors, return the titles of all movies directed by them, along with the director name. Sort by director name, then movie title. 
select title,director
from Movie
where director in (select director from Movie group by director
            having count(director)>1)
order by director,title

Q.19  Find the movie(s) with the highest average rating. Return the movie title(s) and average rating. (Hint: This query is more difficult to write in SQLite than other systems; you might think of it as finding the highest average rating and then choosing the movie(s) with that average rating.)
select M.title, M.avgStars
from (select title, avg(stars) as avgStars from Movie join Rating using(mID)
      group by mID) as M
where M.avgStars = (select max(avgStars)
      from (select avg(stars) as avgStars from Rating
      group by mID))

Q.20 Find the movie(s) with the lowest average rating. Return the movie title(s) and average rating. (Hint: This query may be more difficult to write in SQLite than other systems; you might think of it as finding the lowest average rating and then choosing the movie(s) with that average rating.) 
select M.title, M.avgStars
from (select title, avg(stars) as avgStars from Movie join Rating using(mID)
      group by mID) as M
where M.avgStars = (select min(avgStars)
      from (select avg(stars) as avgStars from Rating
      group by mID))

Q.21 For each director, return the director name together with the title(s) of the movie(s) they directed that received the highest rating among all of their movies, and the value of that rating. Ignore movies whose director is NULL. 
select distinct m1.director, m1.title, m1.stars
from (Movie join Rating using(mID)) as m1
where m1.director is not null and
not exists (select stars from (Movie join Rating using(mID)) as m2
            where m1.stars<m2.stars and m1.director = m2.director)


