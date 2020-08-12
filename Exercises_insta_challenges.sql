#1

SELECT * FROM users ORDER BY created_at LIMIT 5;

#2

SELECT DAYNAME(created_at)AS DAY, COUNT(*) AS total from users GROUP BY DAY ORDER BY total DESC LIMIT 2;

#3

SELECT users.id, username,photos.id FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE photos.id IS NULL;

#4

select username, users.id, photos.id,image_url, COUNT(*) AS TOTAL from users INNER JOIN photos ON users.id = photos.user_id INNER JOIN likes ON photos.id = likes.photo_id GROUP BY photos.id ORDER BY TOTAL DESC LIMIT 1;

#5

SELECT (SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users) AS avg;

#6

select tags.tag_name , count(*) as counts FROM tags LEFT JOIN photo_tags ON tags.id = photo_tags.tag_id GROUP BY tag_name ORDER BY counts DESC LIMIT 5;

#7

 select username, count(*) as num_likes from users INNER JOIN likes on users.id = likes.user_id GROUP BY likes.user_id HAVING num_likes = (select COUNT(*) from p
hotos);

