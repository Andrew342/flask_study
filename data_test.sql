drop database if exists data_test;
create database data_test;
use data_test;
CREATE TABLE roles(
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) COLLATE utf8_bin NOT NULL,
    permissions INT(11),
    `default` BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;
CREATE TABLE users(
    id INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) COLLATE utf8_bin NOT NULL,
    email VARCHAR(255) COLLATE utf8_bin NOT NULL,
    password_hash VARCHAR(255) COLLATE utf8_bin NOT NULL,
    role_id INT(11),
    confirmed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    PRIMARY KEY (id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
AUTO_INCREMENT=1;
