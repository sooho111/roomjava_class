package com.room.member.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class FaqTypeDTO {

	private String 	faq_class; // 질문종류번호
	private String	faq_name; 		// 질문종류
}
