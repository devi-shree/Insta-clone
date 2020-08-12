------------------- #  1  Finding five oldest users ---------------------------------
SELECT * 
FROM users 
ORDER BY created_at 
LIMIT 5;

-------------------#  2 Find max. users registered on which week day ---------------------------
select id, username, DAYNAME(created_at) AS DAY, created_at, COUNT(DAYNAME(created_at)) 
from users 
GROUP BY DAY;


select id, username, DAYNAME(created_at) AS DAY, created_at, COUNT(DAYNAME(created_at))AS "Max. registered users on" 
from users 
GROUP BY DAY;



select id, username, DAYNAME(created_at) AS DAY, created_at, CONCAT(COUNT(DAYNAME(created_at))," ","USERS REGISTERED ON"," ",(DAYNAME(created_at))) AS "Max. registered users on" 
from users 
GROUP BY DAY;


#Alternate METHOD (Simple way)
select DAYNAME(created_at) AS DAY from users GROUP BY DAY;

select DAYNAME(created_at)AS DAY, COUNT(*) from users GROUP BY DAY;

select DAYNAME(created_at)AS DAY, COUNT(*)AS TOTAL from users GROUP BY DAY ORDER BY TOTAL;

select DAYNAME(created_at)AS DAY, COUNT(*)AS TOTAL from users GROUP BY DAY ORDER BY TOTAL DESC LIMIT 2;



------------------ # 3  Find the registered user who never posted any photos -------------


SELECT * FROM users INNER JOIN photos ON users.id = photos.user_id;

SELECT username, image_URL, user_id FROM users LEFT JOIN photos ON users.id = photos.user_id; 


SELECT username, image_URL, user_id FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE photos.id is NULL; 



----------------# 4. Identify most popular photo and user who created it ------------

SELECT photos.id,photos.image_URL, COUNT(*) AS total
FROM photos        
INNER JOIN likes
ON likes.photo_id = photos.id
GROUP BY photos.id
ORDER BY total DESC 
LIMIT 1;

#And also which user we wanna find

SELECT username,photos.id,photos.image_URL, COUNT(*) AS total
FROM photos        
INNER JOIN likes
ON likes.photo_id = photos.id
INNER JOIN users
ON users.id = photos.user_id 
GROUP BY photos.id
ORDER BY total DESC 
LIMIT 1;




-----------------# 5 Calculate avg. no of post per users -------------


#Average = Total no.of photos/ Total no. of users 

SELECT (select count(*) from photos)/(select count(*) from users);


--------------------# 6 what are the top 5 most used hashtags ----------------------

SELECT tags.tag_name, COUNT(*) AS "top_hashtags" FROM tags JOIN photo_tags ON tags.id = photo_tags.tag_id GROUP BY tags.id ORDER BY top_hashtags DESC LIMIT 5;

------------------------# 7 Find the users who liked every single photo on the site ---------------

SELECT * from users INNER JOIN likes ON likes.user_id = users.id GROUP BY users.id;


SELECT user_id,username from users INNER JOIN likes ON likes.user_id = users.id GROUP BY users.id;

SELECT user_id,username,COUNT(*) from users INNER JOIN likes ON likes.user_id = users.id GROUP BY users.id;

SELECT username,COUNT(*) AS num_likes from users INNER JOIN likes ON likes.user_id = users.id GROUP BY users.id HAVING num_likes = 257;

---# OR (STANDARD METHOD WITHOUT MENTIONING ANY PARTICULAR NUMBER-----
SELECT username,COUNT(*) AS num_likes from users INNER JOIN likes ON likes.user_id = users.id GROUP BY users.id HAVING num_likes = (SELECT COUNT(*) FROM photos);



      
     















