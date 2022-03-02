package kr.green.board.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
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
 */
@Data
@XmlRootElement
public class BoardVO {
	private int idx;
	private String name;
	private String password;
	private String subject;
	private String content;
	private Date   regDate;
	private String ip;
	private int hit;
	
	// 댓글의 개수
	private int commentCount;
}
