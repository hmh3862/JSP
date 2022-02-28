show tables;
-- 게시판 테이블
create table board2(
	idx int primary key auto_increment,
	name varchar(30) not null,
	password varchar(50) not null,
	subject varchar(100) not null,
	content text not null,
	hit int default 0,
	regDate timestamp default now(),
	ip varchar(20) not null
); 

desc board2;
select * from board2;

-- 댓글 테이블
create table comment(
	idx int primary key auto_increment,
	ref int not null, -- 원본글 번호
	name varchar(30) not null,
	password varchar(50) not null,
	content text not null,
	regDate timestamp default now(),
	ip varchar(20) not null,
	FOREIGN KEY(ref) REFERENCES board2(idx)	-- 외래키 지정
); 

desc comment;
select * from comment;

-- 샘플데이터를 넣어보자
insert into board2  (name,password,subject,content,ip) values 
('주인장', password('1234'), '자유게시판 입니다','내용입니다.','192.168.5.25'),
('나그네', password('1234'), '자유게시판 좋구나','내용입니다.','192.168.5.25'),
('지나는이', password('1234'), '자유게시판 어디에써요?','내용입니다.','192.168.5.25');

select * from board2;


insert into comment (ref,name,password,content,ip) values 
(1,'나야나', password('1234'),'와 1빠에요','192.168.2.123'),
(2,'너구나', password('1234'),'와 1빠에요','192.168.2.123'),
(1,'한사람', password('1234'),'와 2빠에요','192.168.2.123'),
(1,'두사람', password('1234'),'와 3빠에요','192.168.2.123');

select * from comment;
select * from comment where ref=1; -- 1번글에 댓글들
select * from comment where ref=2; -- 2번글에 댓글들
select * from comment where ref=3; -- 3번글에 댓글들


