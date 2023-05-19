drop database if exists pmp;
create database pmp;
use pmp;

CREATE TABLE `todayeat` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  userid CHAR(50) NOT NULL,
  shopname CHAR(200) NOT NULL,
  menuname CHAR(100) NOT NULL,
  `location` CHAR(100) NOT NULL,
  `date` DATE NOT NULL,
   PRIMARY KEY (id)
  );
INSERT INTO todayeat (userid, shopname, menuname, location, date)
VALUES 
( 'test1', '김가네', '제육볶음', '월평동', CURDATE() ),
( 'test2', '동원칼국수', '칼국수', '월평동', CURDATE() ),
( 'test3', '5.5닭갈비', '닭갈비', '월평동', CURDATE() );


CREATE TABLE `member` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  userid CHAR(100) NOT NULL,
  userpw CHAR(150) NOT NULL,
  username CHAR(100) NOT NULL,
  userlocation CHAR(100) NOT NULL,
  userage INT(20) NOT NULL,
  usergender CHAR(10) NOT NULL,
  useremail char(100) NOT null,
  PRIMARY KEY (id)
);
INSERT INTO member ( userid, userpw, username, userlocation, userage, usergender, useremail )
VALUES 
('test1', 'test1', '홍길동', 'test1', 25 , 'man', 'hongkil04@gmail.com'),
('test2', 'test2', '임꺽정', 'test2', 35 , 'man', 'lgj992@hanmail.net'),
('test3', 'test3', '심사임', 'test3', 45 , 'woman', 'llmom44@lycos.com');


CREATE TABLE `location` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  locationname CHAR(100) NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO location (locationname)
VALUES ('월평동'), ('둔산동'), ('노은동');


CREATE TABLE menu (
  id INT(11) NOT NULL AUTO_INCREMENT,
  menuname CHAR(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (menuname)
);
INSERT INTO menu (menuname)
VALUES ('닭갈비'), ('칼국수'), ('제육볶음');

CREATE TABLE shop (
  id INT(11) NOT NULL AUTO_INCREMENT,
  shopname CHAR(100) NOT NULL,
  locationid INT(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (locationid) REFERENCES location(id)
);
INSERT INTO shop ( shopname, locationid)
VALUES ( '김가네', 1 ), ('5.5닭갈비',1), ('동원칼국수',1);

SELECT * from member;
SELECT * from shop;
SELECT * from menu;
SELECT * from todayeat;
select * from location;
