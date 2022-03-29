
CREATE TABLE `friends` (
  `user_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`friend_id`),
  KEY `FK_FRIENDS_2` (`friend_id`),
  CONSTRAINT `FK_FRIENDS_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_FRIENDS_2` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`)
)

CREATE TABLE 'users' (
  'id' int(10) unsigned NOT NULL AUTO_INCREMENT,
  'name' varchar(255) NOT NULL,
  'email' varchar(255) NOT NULL,
  'password' varchar(255) NOT NULL,
  'created_at' datetime NOT NULL,
  'updated_at' datetime NOT NULL,
  PRIMARY KEY ('id')
)

CREATE TABLE 'posts' (
  'id' int(10) unsigned NOT NULL AUTO_INCREMENT,
  'user_id' int(10) unsigned NOT NULL,
  'title' varchar(255) NOT NULL,
  'body' text NOT NULL,
  'created_at' datetime NOT NULL,
  'updated_at' datetime NOT NULL,
  PRIMARY KEY ('id'),
  KEY 'FK_POSTS_1' ('user_id'),
  CONSTRAINT 'FK_POSTS_1' FOREIGN KEY ('user_id') REFERENCES 'users' ('id')
)