package com.room.admin.dao;

import java.util.List;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.member.dto.MemberDTO;
import com.room.admin.dto.RoomKindDTO;
import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;

public interface AdminDAO {
	// 게시글 작성
	public void noticeWrite(BoardDTO boardDTO) throws Exception;
	
	// 게시물 목록 조회
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 방 종류 뿌려주기
	public List<RoomKindDTO> roomKind() throws Exception;
	
	//공지사항 상세페이지
	public BoardDTO detailView(int notice_bno) throws Exception;
	
	//공지사항 수정
	public void noticeUpdate(BoardDTO boardDTO) throws Exception;
	
	//공지사항 삭제
	public void noticeDelete(BoardDTO boardDTO) throws Exception;
	//회원 목록 보기 (Paging 처리)
	public List<MemberDTO> memberListPaging(SearchCriteria cri) throws Exception;

	//회원 목록 수 구하기 (Paging 처리)
	public int memberListTotalCount(SearchCriteria cri) throws Exception;
	
	//회원 번호에 해당하는 상세정보화면
	public MemberDTO memberDetail(String m_bno) throws Exception;
	
	//회원 수정
	public void memberUpdate(MemberDTO memberDTO) throws Exception;
	
	//회원 삭제
	public void memberDelete(String m_bno) throws Exception;
	//회원 등급찾기
	public int searchM_power(String m_id)throws Exception;
	// 게시물 목록 조회
	public List<PaymentDTO> paymentList(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int paymentListCount(SearchCriteria scri) throws Exception;
	//결제항목 상세페이지
	public PaymentDTO paymentdetailView(int pay_bno) throws Exception;
	
	//결제항목 수정
	public void paymentUpdate(PaymentDTO paymentDTO) throws Exception;
	
	//결제항목 삭제
	public void paymentDelete(PaymentDTO paymentDTO) throws Exception;
	// 게시글 작성
	public void insertPayment(PaymentDTO paymentDTO) throws Exception;
	// 기능 목록 조회
	public List<Room_fncDTO> fncList(SearchCriteria scri) throws Exception;
	// 대여 목록 조회
	public List<Room_rentDTO> rentList(SearchCriteria scri) throws Exception;
	//기능항목 추가
	public void insertfnc(Room_fncDTO room_fncDTO) throws Exception;
	//대여항목 추가
	public void insertrent(Room_rentDTO room_rentDTO) throws Exception;
	//기능항목 상세페이지
	public Room_fncDTO fncdetailView(int fnc_bno) throws Exception;
	//대여항목 상세페이지
	public Room_rentDTO rentdetailView(int rent_bno) throws Exception;
	//기능항목 수정
	public void fncUpdate(Room_fncDTO room_fncDTO) throws Exception;
	//대여항목 수정
	public void rentUpdate(Room_rentDTO room_rentDTO) throws Exception;
	//기능항목 삭제
	public void fncDelete(Room_fncDTO room_fncDTO) throws Exception;
	//대여항목 삭제
	public void rentDelete(Room_rentDTO room_rentDTO) throws Exception;
	
	


	
	
} // end interface AdminDAO
