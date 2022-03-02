package kr.green.board.vo;

import java.util.Date;
import javax.xml.bind.annotation.XmlRootElement;
import lombok.Data;
/*
   create table board_comment(
   		idx number primary key,
   		REF NUMBER NOT NULL,  -- 원본글 번호
   		name varchar2(100) not null,
   		password varchar2(100) not null,
   		content varchar2(2500) not null,
   		regdate timestamp default sysdate,
   		ip varchar2(20) not null
   ); 
 */
@Data
@XmlRootElement
public class CommentVO {
	private int idx;
	private int ref;
	private String name;
	private String password;
	private String content;
	private Date   regDate;
	private String ip;
}
