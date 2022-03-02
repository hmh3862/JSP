   drop sequence board_idx_seq;
   create sequence board_idx_seq;
   DROP TABLE board;
   create table board(
   		idx number primary key,
   		name varchar2(100) not null,
   		password varchar2(100) not null,
   		subject varchar2(1000) not null,
   		content varchar2(2500) not null,
   		regdate timestamp default sysdate,
   		ip varchar2(20) not null,
   		hit number default 0
   ); 
   
  SELECT * FROM board;
  
  -- sample 데이터 3개 넣기
  INSERT INTO board (idx,name,password,subject,content,ip) VALUES 
                    (board_idx_seq.nextval,'나그네','1234','나는 제목1입니다.','나는 아마도 내용일걸요...','192.168.2.123');
  INSERT INTO board (idx,name,password,subject,content,ip) VALUES 
                    (board_idx_seq.nextval,'나그네','1234','나는 제목2입니다.','나는 아마도 내용일걸요...','192.168.2.123');
  INSERT INTO board (idx,name,password,subject,content,ip) VALUES 
                    (board_idx_seq.nextval,'나그네','1234','나는 제목3입니다.','나는 아마도 내용일걸요...','192.168.2.123');
                   
  SELECT * FROM board;
  
--  sample 데이터 333개 넣기
BEGIN 
	FOR i IN 4..333 LOOP
	 INSERT INTO board (idx,name,password,subject,content,ip) VALUES 
                    (board_idx_seq.nextval,'나그네','1234','나는 제목'|| i ||' 입니다.','나는 아마도 내용일걸요...','192.168.2.123');
     COMMIT;
	END LOOP;
END; 	

SELECT count(*) FROM board;

-- ============================================================================
-- 댓글을 달도록 테이블을 추가해보자!!!
-- ============================================================================
   create sequence comment_idx_seq;
   create table board_comment(
   		idx number primary key,
   		REF NUMBER NOT NULL,  -- 원본글 번호
   		name varchar2(100) not null,
   		password varchar2(100) not null,
   		content varchar2(2500) not null,
   		regdate timestamp default sysdate,
   		ip varchar2(20) not null
   ); 
  
  SELECT * FROM board ORDER BY idx DESC;
  -- 임시로 댓글을 몇개 달아보자
  INSERT INTO board_comment VALUES (comment_idx_seq.nextval, 343,'나그네','1234','댓글입니다. 1하하하',SYSDATE,'192.168.0.1');
  INSERT INTO board_comment VALUES (comment_idx_seq.nextval, 343,'나그네','1234','댓글입니다. 2하하하',SYSDATE,'192.168.0.1');
  INSERT INTO board_comment VALUES (comment_idx_seq.nextval, 343,'나그네','1234','댓글입니다. 3하하하',SYSDATE,'192.168.0.1');
  INSERT INTO board_comment VALUES (comment_idx_seq.nextval, 334,'나그네','1234','댓글입니다. 하하하',SYSDATE,'192.168.0.1');
  INSERT INTO board_comment VALUES (comment_idx_seq.nextval, 331,'나그네','1234','댓글입니다. 하하하',SYSDATE,'192.168.0.1');
  INSERT INTO board_comment VALUES (comment_idx_seq.nextval, 330,'나그네','1234','댓글입니다. 하하하',SYSDATE,'192.168.0.1');

 select * FROM  board_comment;







