  create table  fileBoard(
   	idx int primary key auto_increment,
   	name varchar(50) not null,
   	password varchar(50) not null,
   	subject varchar(100) not null,
   	content text not null,
   	regDate timestamp default now(),
   	ip varchar(15) not null
  );
  
   create table  boardFile(
   	idx int primary key auto_increment,
   	ref int not null,
   	oriName varchar(100) not null,
   	saveName varchar(100) not null
  );
  
 select * from fileboard;
 select * from boardfile;
 
insert into fileBoard(name, password, subject, content, ip) values
('주인장','1234','나 제목이래','나는 내용이라는 구먼~~~','192.168.0.11');

