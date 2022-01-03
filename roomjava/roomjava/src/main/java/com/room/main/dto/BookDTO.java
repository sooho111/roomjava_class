package com.room.main.dto;

import lombok.Data;

@Data
public class BookDTO {
	
	private int	 	book_bno;
	private String 	book_order;		// 예약번호
	private String 	m_name;		// 예약자 이름
	private int	 	book_people;	// 예약 인원
	private String 	book_tel;		// 예약자 전화번호
	private String 	book_ok;		// 예약 상태(입금여부-가예약,예약완료,입실,퇴실)
	private String 	start_date;		// 예약시작일자
	private String 	end_date;		// 예약종료일자
	private int		r_bno;			// 방 번호
	private String 	room_class;
	private String 	r_name;
	private int		r_kind;
	private String 	r_rent;
	private String	r_fnc;
}
