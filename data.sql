drop database if exists data;
create database data;
use data;
CREATE TABLE roles(
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;
CREATE TABLE users(
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) COLLATE utf8_bin NOT NULL,
    role_id INT(11) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(id),
    PRIMARY KEY (id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;
