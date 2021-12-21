package com.room.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FaqtypeDTO {

	private int 	faq_bno;		//번호
	private	String  faq_title;		//제목
	private String  faq_content;	//답변
	private	String	faq_class;	//질문목록
	
}
