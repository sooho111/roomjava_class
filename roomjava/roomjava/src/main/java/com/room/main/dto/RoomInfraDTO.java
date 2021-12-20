package com.room.main.dto;

import lombok.Data;

@Data
public class RoomInfraDTO {

	private String 	r_name;		// 방이름
	private String 	r_kind;		// 방 종류
	private int		r_people;	// 방 인원수
	private String 	r_price;	// 방 가격
	private String 	r_base;		// 기본 기능
	private String 	r_rent;		// 대여 항목
}
