package com.room.admin.dto;

import java.util.Date;

import lombok.Data;


@Data
public class BoardDTO {

	private int notice_bno;
	private String notice_title;
	private String notice_content;
	private Date norice_date;
}
