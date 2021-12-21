package com.room.admin.dto;

import java.sql.Timestamp;


import lombok.Data;

@Data
public class BoardDTO {

	private int notice_bno;
	private String notice_title;
	private String notice_content;
	private Timestamp notice_date;
}
