package com.room.member.dao;

import java.util.List;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.main.dto.BookDTO;
import com.room.member.dto.MemberDTO;
import com.room.member.dto.QnaDTO;
import com.room.member.dto.ReviewDTO;
import com.room.member.dto.FaqDTO;

public interface MemberDAO {
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
	// 회원 탈퇴
	// -------------------------------------------------------------------------------------------------
	public int memberDelete(MemberDTO memberDTO) throws Exception;


	// -------------------------------------------------------------------------------------------------
	// 아이디 찾기
	// -------------------------------------------------------------------------------------------------
	public String findidform(String m_email) throws Exception;

	// -------------------------------------------------------------------------------------------------
	// 비밀번호 찾기
	// -------------------------------------------------------------------------------------------------
	public String memberfindpwform(MemberDTO memberDTO) throws Exception;
	//-------------------------------------------------------------------------------------------------
	// 공지사항 목록 조회
	//-------------------------------------------------------------------------------------------------
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;
	//-------------------------------------------------------------------------------------------------
	// 공지사항 총 갯수
	//-------------------------------------------------------------------------------------------------
	public int listCount(SearchCriteria scri) throws Exception;

	//-------------------------------------------------------------------------------------------------
	// 공지사항 상세페이지
	//-------------------------------------------------------------------------------------------------
	public BoardDTO detailView(int board_notice) throws Exception;

	// -------------------------------------------------------------------------------------------------
	// 예약목록
	// -------------------------------------------------------------------------------------------------
	public List<BookDTO> getBooks(String m_name) throws Exception;
	
	// -------------------------------------------------------------------------------------------------
	// 예약 뷰
	// -------------------------------------------------------------------------------------------------
	public List<BookDTO> bookView(String book_order) throws Exception;
	
	// -------------------------------------------------------------------------------------------------
	// 비로그인
	// -------------------------------------------------------------------------------------------------
	public List<BookDTO> belogin(String book_name) throws Exception;
	//-------------------------------------------------------------------------------------------------
	// FAQ 페이징 처리
	//-------------------------------------------------------------------------------------------------
	public int faqListTotalCount(SearchCriteria cri) throws Exception;
		
	/*-------------------------------------------------------------------------------------------------
	* FAQ 목록 보기 (Paging 처리)
	-------------------------------------------------------------------------------------------------*/
	public List<FaqDTO> faqListPaging(SearchCriteria cri) throws Exception;
	
	//-------------------------------------------------------------------------------------------------
	// review 페이징 처리
	//-------------------------------------------------------------------------------------------------
	public int reviewListTotalCount(SearchCriteria cri) throws Exception;
		
	/*-------------------------------------------------------------------------------------------------
	* review 목록 보기 (Paging 처리)
	-------------------------------------------------------------------------------------------------*/
	public List<ReviewDTO> reviewListPaging(SearchCriteria cri) throws Exception;
	
	
	/*-------------------------------------------------------------------------------------------------
	* QnA 작성
	-------------------------------------------------------------------------------------------------*/	
	public void qnaWrite(QnaDTO qnaDTO) throws Exception;
	/*-------------------------------------------------------------------------------------------------
	* QnA List
	-------------------------------------------------------------------------------------------------*/	

	public List<QnaDTO> qnaList(SearchCriteria cri) throws Exception;
	/*-------------------------------------------------------------------------------------------------
	* QnA count
	-------------------------------------------------------------------------------------------------*/		
	public int qnaListCount(SearchCriteria scri) throws Exception;
	/*-------------------------------------------------------------------------------------------------
	* QnA 게시판 상세보기
	-------------------------------------------------------------------------------------------------*/	
	public String qnaOne(int qna_bno) throws Exception;
	/*-------------------------------------------------------------------------------------------------
	* QnA 게시판 상세보기
	-------------------------------------------------------------------------------------------------*/	
	public QnaDTO qnaDetail(int qna_bno) throws Exception;
	/*-------------------------------------------------------------------------------------------------
	* QnA 게시판 수정
	-------------------------------------------------------------------------------------------------*/	
	public void qnaUpdate(QnaDTO qnaDTO) throws Exception;
	/*-------------------------------------------------------------------------------------------------
	* QnA 게시판 삭제
	-------------------------------------------------------------------------------------------------*/	
	public void qnaDelete(QnaDTO qnaDTO) throws Exception;

	//리뷰 체크 
	public Integer checkReview(String book_order) throws Exception;
	//리뷰 작성
	public void insertReview(ReviewDTO reviewdto) throws Exception;
	

}