DROP DATABASE instagram_clone;
CREATE DATABASE instagram_clone;

use instagram_clone;

CREATE TABLE users
(
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(255) UNIQUE NOT NULL,
created_at TIMESTAMP DEFAULT NOW()     
);

CREATE TABLE photos
(
id INT AUTO_INCREMENT PRIMARY KEY,
image_URL VARCHAR(255) NOT NULL,
user_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
id INT AUTO_INCREMENT PRIMARY KEY,
comment_text varchar(255) NOT NULL,
user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN key (photo_id) REFERENCES photos(id)
);

CREATE TABLE likes (
user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows (
follower_id INT NOT NULL,
followee_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)  
);

CREATE TABLE tags (
id INT AUTO_INCREMENT PRIMARY KEY,
tag_name VARCHAR(255) UNIQUE,
created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
photo_id INT NOT NULL,
tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);