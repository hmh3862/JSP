-- 자유 게시판 테이블 작성
create table board(
   		idx int primary key auto_increment,
   		name varchar(30) not null,
   		password varchar(50) not null,
   		subject varchar(100) not null,
   		content text not null,
   		hit int default 0,
   		regDate timestamp default now(),
   		ip varchar(20) not null
   ); 

  desc board;
  select * from board;
 
 -- 샘플데이터를 넣어보자
 insert into board  (name,password,subject,content,ip) values ('주인장', password('1234'), '자유게시판 입니다. 자유롭게 욕해라!','내용입니다.','192.168.5.25');

select * from board;
  
 