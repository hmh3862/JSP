select password('1234'), length(password('1234'));

create table guestbook(
      idx int primary key auto_increment,
      name varchar(30) not null,
      password varchar(50) not null,
      content text not null,
      regDate timestamp default now(),
      ip varchar(20) not null
   );
   
desc   guestbook;

-- 샘플로 데이터를 3개만 넣어보자
insert into	guestbook 
	(name,password,content,ip)
values
	('주인장', password('1234'), '방명록입니다. 인사말을 남겨주세요','192.168.0.55'),
	('나그네', password('1234'), '방명록이구나. 흔적이라도 남겨야지 하하하','192.168.0.55'),
	('지나는이', password('1234'), '방명록이네 잘보고 갑니다.','192.168.0.55');
	
select * from guestbook;
-- 비번이 암로화되어 다음과 같이하면 비번이 틀려서 가져오지 못한다.
select * from guestbook where idx=53 and password = '1234';
-- 다음과 같이해야 데이터를 가져온다.
select * from guestbook where idx=53 and password = password('1234');
-- 가져오는 갯를세면 암호 일치 여부를 알 수 있다.
-- 1이면 일치하는 것이고
select count(*) from guestbook where idx=53 and password = password('1234');
-- 0이면 비번 불일치 한다는 것이다.
select count(*) from guestbook where idx=53 and password = password('12345');


delete from guestbook;
select * from guestbook;