package com.room.member.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	private int rep_bno;
	private String rep_content;
	private String m_id;
	private Date   rep_date;
	private int qna_bno;
	
}
