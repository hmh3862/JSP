package kr.green.freeboard.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
create table freeboard(
	idx int primary key auto_increment,
	name varchar(30) not null,
	password varchar(50) not null,
	subject varchar(100) not null,
	content text not null,
	hit int default 0,
	regDate timestamp default now(),
	ip varchar(20) not null
);
 */
@XmlRootElement
@Data
public class FreeBoardVO {
	private int	   idx;
	private String name;
	private String password;
	private String subject;
	private String content;
	private int	   hit;
	private Date   regDate;
	private String ip;
}
