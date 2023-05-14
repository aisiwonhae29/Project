

CREATE TABLE todayeat (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  userid CHAR(50) NOT NULL,
  shopname CHAR(200) NOT NULL,
  menuname CHAR(100) NOT NULL,
  `location` CHAR(100) NOT NULL,
  `date DATE` NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE `member` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  userid CHAR(100) NOT NULL,
  userpw CHAR(150) NOT NULL,
  username CHAR(100) NOT NULL,
  userlocation CHAR(100) NOT NULL,
  userage INT(20) NOT NULL,
  usergender CHAR(10) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE `location` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  locationname CHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE menu (
  id INT(11) NOT NULL AUTO_INCREMENT,
  menuname CHAR(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (menuname)
);

CREATE TABLE your_table_name (
  id INT(11) NOT NULL AUTO_INCREMENT,
  shopname CHAR(100) NOT NULL,
  locationid INT(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (locationid) REFERENCES your_location_table_name(locationid)
);
select * FROM `member`;
DROP table shop;