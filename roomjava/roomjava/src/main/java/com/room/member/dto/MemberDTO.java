package com.room.member.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private	String	m_bno;			// 회원 번호
	private	String	m_id;			// 회원 아이디
	private	String	m_pwd;	// 회원 비민번호
	private	String	m_name;		// 회원 이름
	private	String	m_tel;		// 회원 전화번호
	private	String	m_email;		// 회원 이메일
	private	String	m_address;	// 회원 주소
	private	String	m_birth;		// 회원 생년월일
	private	Date	reg_date;	// 회원 생성날짜
	private int		m_power;	// 회원 권한

}
