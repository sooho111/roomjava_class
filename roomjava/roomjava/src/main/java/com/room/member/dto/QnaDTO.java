package com.room.member.dto;

import java.util.Date;

import lombok.Data;
@Data
public class QnaDTO {

	private int qna_bno;
	private int qna_seceret;
	private String qna_title;
	private String qna_content;
	private Date  qna_date;
	private String m_id;
	private String qna_class;
}
