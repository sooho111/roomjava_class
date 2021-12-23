package com.room.member.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {

	private int 	review_bno;		//번호
	private	int 	 r_bno;		//제목
	private String  r_name;	//답변
	private	String	review_writer;	//질문목록
	private	int	m_power;	//질문목록
	private	String	review_star;	//질문목록
	private	Date	m_reg;	//질문목록
	private	int	r_kind;	//질문목록
	private	String	r_content;	//질문목록
		
}
