drop database if exists pmp;
create database pmp;
use pmp;

CREATE TABLE `todayeat` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  shopname CHAR(200) NOT NULL,
  menuname CHAR(100) NOT NULL,
  location CHAR(100) NOT NULL,
  `usergender` char(10) NOT null,
  `date` DATE NOT NULL,
  `userage` int(10) NOT NULL,
   PRIMARY KEY (id)
  );
INSERT INTO todayeat (shopname, menuname, location, usergender, date, userage)
VALUES 
( '김가네', '제육볶음', '월평동','man', CURDATE(),33 ),
( '롯데리아', '햄버거', '월평동','woman', CURDATE(),22 ),
( '김가네', '제육볶음', '월평동','man', CURDATE(),15 ),
( '선사삼계탕', '삼계탕', '월평동','woman', CURDATE(),22 ),
( '선사삼계탕', '삼계탕', '월평동','man', CURDATE(),25 ),
( '선사삼계탕', '삼계탕', '월평동','woman', CURDATE(),44 ),
( '5.5닭갈비', '닭갈비', '월평동','man', CURDATE(),55 ),
( '진달래반점', '짜장면', '월평동','man', CURDATE(),67 ),
( '진달래반점', '짬뽕', '월평동','man', CURDATE(),23 ),
( 'bbq', '치킨', '월평동','man', CURDATE(),33 ),
( '롯데리아', '햄버거', '월평동','woman', CURDATE(),48 ),
( '김가네', '제육볶음', '월평동','man', CURDATE(),23 ),
( '선사삼계탕', '삼계탕', '월평동','woman', CURDATE(),14 );


CREATE TABLE `member` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  regDate DATETIME NOT NULL,
  updateDate DATETIME NOT NULL,
  userid CHAR(100) NOT NULL,
  userpw CHAR(150) NOT NULL,
  username CHAR(100) NOT NULL,
  location CHAR(100) NOT NULL,
  userage INT(20) NOT NULL,
  usergender CHAR(10) NOT NULL,
  useremail char(100) NOT null,
  `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
  nickname CHAR(20) NOT NULL,
  cellphoneNum CHAR(20) NOT NULL,
  delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
  delDate DATETIME COMMENT '탈퇴 날짜'

  PRIMARY KEY (id)
);
INSERT INTO member ( userid, userpw, username, location, userage, usergender,
   useremail, `authLevel`, nickname, cellphoneNum )
VALUES 
('test1', 'test1', '홍길동', 'test1', 25 , 'man', 'hongkil04@gmail.com', 7, '관리자', '01012341234'),
('test2', 'test2', '임꺽정', 'test2', 35 , 'man', 'lgj992@hanmail.net',3,'회원2','01043214321'),
('test3', 'test3', '심사임', 'test3', 45 , 'woman', 'llmom44@lycos.com',3,'회원3','01011112222');

CREATE TABLE `location` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  locationname CHAR(100) NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO location (locationname)
VALUES ('월평동'), ('둔산동'), ('노은동');

CREATE TABLE `usergender` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  usergender CHAR(100) NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO `usergender` (usergender)
VALUES ('man'), ('woman');

CREATE TABLE menu (
  id INT(11) NOT NULL AUTO_INCREMENT,
  menuname CHAR(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (menuname)
);
INSERT INTO menu (menuname)
VALUES ('닭갈비'), ('칼국수'), ('제육볶음'),('삼계탕'),('햄버거'),('짜장면'),('치킨');

CREATE TABLE shop (
  id INT(11) NOT NULL AUTO_INCREMENT,
  shopname CHAR(100) NOT NULL,
  locationid INT(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (locationid) REFERENCES location(id)
);
INSERT INTO shop ( shopname, locationid)
VALUES ( '김가네', 1 ), ('5.5닭갈비',1), ('동원칼국수',1),('선사삼계탕',1),('롯데리아',1),('bbq',1),('진달래반점',1);

select * from usergender;
SELECT * from member;
SELECT * from shop;
SELECT * from menu;
SELECT * from todayeat;
select * from location;

SELECT menuname, COUNT(*) FROM todayeat, usergender
where usergender.usergender=todayeat.usergender and todayeat.usergender='man'
GROUP BY menuname
ORDER BY COUNT(*) DESC LIMIT 5;

SELECT menuname, COUNT(*) FROM todayeat
GROUP BY menuname
ORDER BY COUNT(*) DESC LIMIT 5;

SELECT * FROM todayeat
GROUP BY menuname
ORDER BY COUNT(*) DESC LIMIT 5;

select * from member where usergender='man';

# 게시물 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# 게시물 테스트데이터 생성
INSERT INTO article 
SET regDate = NOW(),
updateDate = NOW(),
title = '제목 1',
`body` = '내용 1';

INSERT INTO article 
SET regDate = NOW(),
updateDate = NOW(),
title = '제목 2',
`body` = '내용 2';

INSERT INTO article 
SET regDate = NOW(),
updateDate = NOW(),
title = '제목 3',
`body` = '내용 3';





# 게시물 테이블 구조 변경 - memberId 추가
ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER `updateDate`;

UPDATE article 
SET memberId = 2
WHERE id IN(1,2);

UPDATE article 
SET memberId = 3
WHERE id = 3;

# 게시판 테이블 생성
CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), qna(질의응답), ....',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
    delDate DATETIME COMMENT '삭제 날짜'
);

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'NOTICE',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QNA',
`name` = '질의응답';

ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

UPDATE article
SET boardId = 1
WHERE id IN (1,2);

UPDATE article
SET boardId = 2
WHERE id = 3;

ALTER TABLE article ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0;

# reactionPoint 테이블 생성
CREATE TABLE reactionPoint (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `point` INT(10) NOT NULL
);

# reactionPoint 테스트 데이터
# 1번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 1번 회원이 2번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 2,
`point` = 1;

# 2번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 2번 회원이 2번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`point` = -1;

# 3번 회원이 1번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`point` = 1;

# 게시물 테이블에 추천 관련 컬럼 추가
ALTER TABLE article ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE article ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# 기존 게시물의 good,bad ReactionPoint 필드의 값을 채운다
UPDATE article AS A
INNER JOIN (
    SELECT RP.relTypeCode, RP.relId,
    SUM(IF(RP.point > 0, RP.point,0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1,0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON A.id = RP_SUM.relId
SET A.goodReactionPoint = RP_SUM.goodReactionPoint,
A.badReactionPoint = RP_SUM.badReactionPoint;

# reply 테이블 생성
CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `body`TEXT NOT NULL
);

# 2번 회원이 1번 글에 
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 1';

# 2번 회원이 1번 글에 
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 2';

# 3번 회원이 1번 글에 
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 3';

# 3번 회원이 1번 글에 
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`body` = '댓글 4';

# 댓글 테이블에 추천 관련 컬럼 추가
ALTER TABLE reply ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE reply ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# 댓글 테이블에 인덱스 추가
ALTER TABLE `SB_AM_04`.`reply` ADD KEY `relTypeCodeId` (`relTypeCode` , `relId`);

# 기존의 회원 비번을 암호화
UPDATE `member`
SET loginPw = SHA2(loginPw,256);

# 파일 테이블 추가
CREATE TABLE genFile (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT, # 번호
  regDate DATETIME DEFAULT NULL, # 작성날짜
  updateDate DATETIME DEFAULT NULL, # 갱신날짜
  delDate DATETIME DEFAULT NULL, # 삭제날짜
  delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0, # 삭제상태(0:미삭제,1:삭제)
  relTypeCode CHAR(50) NOT NULL, # 관련 데이터 타입(article, member)
  relId INT(10) UNSIGNED NOT NULL, # 관련 데이터 번호
  originFileName VARCHAR(100) NOT NULL, # 업로드 당시의 파일이름
  fileExt CHAR(10) NOT NULL, # 확장자
  typeCode CHAR(20) NOT NULL, # 종류코드 (common)
  type2Code CHAR(20) NOT NULL, # 종류2코드 (attatchment)
  fileSize INT(10) UNSIGNED NOT NULL, # 파일의 사이즈
  fileExtTypeCode CHAR(10) NOT NULL, # 파일규격코드(img, video)
  fileExtType2Code CHAR(10) NOT NULL, # 파일규격2코드(jpg, mp4)
  fileNo SMALLINT(2) UNSIGNED NOT NULL, # 파일번호 (1)
  fileDir CHAR(20) NOT NULL, # 파일이 저장되는 폴더명
  PRIMARY KEY (id),
  KEY relId (relTypeCode,relId,typeCode,type2Code,fileNo)
);

###################################################################
SELECT * FROM article;
SELECT * FROM `member`;
SELECT * FROM board;
SELECT * FROM reactionPoint;
SELECT * FROM `reply`;
SELECT * FROM `genFile`;

SELECT SHA2('1b4f0e9851971998e732078544c96b36c3d01cedf7caa332359d6f1d83567014',256);

SELECT R.*, M.nickname AS extra__writer
				FROM reply AS R
				LEFT JOIN `member` AS M
				ON R.memberId = M.id
				
EXPLAIN SELECT R.*, M.nickname AS extra__writer
FROM reply AS R
LEFT JOIN `member` AS M
ON R.memberId = M.id
WHERE R.relTypeCode = 'article'
AND R.relId = 1
ORDER BY R.id DESC

SELECT *
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode, RP.relId;

SELECT IF(RP.point > 0, '큼','작음')
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode, RP.relId;

# 각 게시물 별 좋아요, 싫어요의 갯수
SELECT RP.relTypeCode, RP.relId,
SUM(IF(RP.point > 0, RP.point,0)) AS goodReactionPoint,
SUM(IF(RP.point < 0, RP.point * -1,0)) AS badReactionPoint
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode, RP.relId;


SELECT IFNULL(SUM(RP.point),0)
FROM reactionPoint AS RP
WHERE RP.relTypeCode = 'article'
AND RP.relId = 3
AND RP.memberId = 2



UPDATE article
SET `body` = '내용4'
WHERE id= 1;

UPDATE article
SET `body` = '내용5'
WHERE id= 2;

UPDATE article
SET `body` = '내용6'
WHERE id= 3;


# 게시물 갯수 늘리기
INSERT INTO article 
( 
    regDate, updateDate, memberId, boardId, title, `body`
)
SELECT NOW(), NOW(), FLOOR(RAND() * 2) + 2, FLOOR(RAND() * 2) + 1, CONCAT('제목_',RAND()), CONCAT('내용_',RAND())
FROM article;

SELECT COUNT(*) FROM article;

DESC article;



SELECT COUNT(*) AS cnt
FROM article AS A
WHERE 1
AND A.boardId = 1

SELECT *
		  FROM article
		  WHERE boardId = 1
		  ORDER BY id DESC
		  LIMIT 0, 10

DESC `member`;

SELECT LAST_INSERT_ID();

SELECT  CONCAT('%' 'abc' '%');

# left join
SELECT A.*, M.nickname, RP.point
FROM article AS A
INNER JOIN `member` AS M 
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP 
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

# 서브쿼리 버전
SELECT A.*, 
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0, RP.point, 0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0, RP.point, 0)),0) AS extra__badReactionPoint
FROM (
	SELECT A.*, M.nickname AS extra__writerName
	FROM article AS A
	LEFT JOIN `member` AS M
	ON A.memberId= M.id 
			) AS A
LEFT JOIN reactionPoint AS RP
ON RP.relTypeCode = 'article'
AND A.id = RP.relId
GROUP BY A.id
ORDER BY id DESC;

# join 버전
SELECT A.*,
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0,RP.point,0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0,RP.point,0)),0) AS extra__badReactionPoint,
M.nickname
FROM article AS A
INNER JOIN `member` AS M 
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP 
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

SELECT A.*,
SUM(RP.point) AS extra__sumReactionPoint,
SUM(IF(RP.point > 0,RP.point,0)) AS extra__goodReactionPoint,
SUM(IF(RP.point < 0,RP.point,0)) AS extra__badReactionPoint,
M.nickname
FROM article AS A
INNER JOIN `member` AS M 
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP 
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;
