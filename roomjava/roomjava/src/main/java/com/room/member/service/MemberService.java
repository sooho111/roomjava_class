package com.room.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.main.dto.BookDTO;
import com.room.member.dto.MemberDTO;
import com.room.member.dto.FaqDTO;

public interface MemberService {
	
	// -------------------------------------------------------------------------------------------------
	// 로그인
	// -------------------------------------------------------------------------------------------------
	public MemberDTO login(MemberDTO memberDTO) throws Exception;
	// -------------------------------------------------------------------------------------------------
	// 아이디 중복 검사
	// -------------------------------------------------------------------------------------------------
	public int idCheck(MemberDTO memberDTO) throws Exception;
	// -------------------------------------------------------------------------------------------------
	// 이메일 중복 검사
	// -------------------------------------------------------------------------------------------------
	public int eCheck(MemberDTO memberDTO) throws Exception;
	// -------------------------------------------------------------------------------------------------
	// 회원 가입
	// -------------------------------------------------------------------------------------------------
	public int memberInsert(MemberDTO memberDTO) throws Exception;
	// -------------------------------------------------------------------------------------------------
	// 회원 상세 정보
	// -------------------------------------------------------------------------------------------------
	public MemberDTO view(String m_id) throws Exception;
	// -------------------------------------------------------------------------------------------------
	// 회원 정보 수정
	// -------------------------------------------------------------------------------------------------
	public void update(MemberDTO memberDTO) throws Exception;
	// -------------------------------------------------------------------------------------------------
	// 회원 정보 삭제
	// ------------------------------------------------------------------------------------------------
	public int memberDelete(String m_id) throws Exception;
	// -------------------------------------------------------------------------------------------------
	// 아이디 찾기
	//-------------------------------------------------------------------------------------------------
	public String findidform(HttpServletResponse response, String m_email) throws Exception; 
	//-------------------------------------------------------------------------------------------------
	// 비밀번호 찾기
	//-------------------------------------------------------------------------------------------------
	public String memberfindpwform(HttpServletResponse response, MemberDTO memberDTO) throws Exception; 
	//-------------------------------------------------------------------------------------------------
	// 공지사항 목록 조회
	//-------------------------------------------------------------------------------------------------
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;
	//-------------------------------------------------------------------------------------------------
	// 공지사항 총 갯수
	//-------------------------------------------------------------------------------------------------
	public int listCount(SearchCriteria scri) throws Exception;
	//-------------------------------------------------------------------------------------------------
	// 공지사항 디테일 뷰
	//-------------------------------------------------------------------------------------------------	
	public BoardDTO detailView(int notice_bno) throws Exception;
	
	public List<BookDTO> getBooks(String m_name) throws Exception; 	

	public List<BookDTO> bookView(String book_order) throws Exception; 	
	
	public List<BookDTO> belogin(String book_name) throws Exception;
	//-------------------------------------------------------------------------------------------------
	// FAQ 페이징 처리
	//-------------------------------------------------------------------------------------------------
	public int faqListTotalCount(SearchCriteria cri) throws Exception;
		
	/*-------------------------------------------------------------------------------------------------
	* FAQ 목록 보기 (Paging 처리)
	-------------------------------------------------------------------------------------------------*/
	public List<FaqDTO> faqListPaging(SearchCriteria cri) throws Exception;

}
