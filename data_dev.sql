drop database if exists data_dev;
create database data_dev;
use data_dev;
CREATE TABLE roles(
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) COLLATE utf8_bin NOT NULL,
    UNIQUE (name),
    permissions INT(11),
    `default` BOOLEAN DEFAULT FALSE,
    INDEX(`default`),
    PRIMARY KEY (id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;
CREATE TABLE users(
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) COLLATE utf8_bin NOT NULL,
    UNIQUE (username),
    email VARCHAR(255) COLLATE utf8_bin NOT NULL,
    UNIQUE (email),
    INDEX(username,email),
    password_hash VARCHAR(255) COLLATE utf8_bin NOT NULL,
    role_id INT(11),
    confirmed BOOLEAN DEFAULT FALSE,
    name VARCHAR(255),
    location VARCHAR(255),
    about_me TEXT,
    member_since datetime DEFAULT CURRENT_TIMESTAMP,
    last_seen datetime DEFAULT CURRENT_TIMESTAMP,
    avatar_hash VARCHAR(255),
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;
CREATE TABLE posts(
    id INT(11) NOT NULL AUTO_INCREMENT,
    body TEXT,
    timestamp datetime DEFAULT CURRENT_TIMESTAMP,
    INDEX(timestamp),
    author_id INT(11),
    FOREIGN KEY (author_id) REFERENCES users(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;
