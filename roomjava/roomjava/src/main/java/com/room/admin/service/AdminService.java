package com.room.admin.service;

import java.util.List;



import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.main.dto.BookDTO;
import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;
import com.room.member.dto.FaqDTO;
import com.room.member.dto.FaqTypeDTO;
import com.room.member.dto.MemberDTO;
import com.room.member.dto.QnaDTO;
import com.room.admin.dto.RoomKindDTO;
import com.room.admin.dto.PaymentDTO;


public interface AdminService {
	
	// 방 종류 뿌려주기
	public List<RoomKindDTO> roomKind() throws Exception;

	// 공지사항 작성
	public void noticeWrite(BoardDTO boardDTO) throws Exception;
	// faq 작성
	public void faqWrite(FaqDTO faqDTO) throws Exception;
	
	// 공지사항 목록 조회
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;

	// 공지사항 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	// faq 목록 조회
	public List<FaqDTO> faqlist(SearchCriteria scri) throws Exception;

	// faq 총 갯수
	public int faqlistCount(SearchCriteria scri) throws Exception;
	//faq 수정
	public void faqUpdate(FaqDTO faqDTO) throws Exception;
	
	//faq 삭제
	public void faqDelete(FaqDTO faqDTO) throws Exception;
	//faq 상세페이지
	public FaqDTO faqdetailView(int faq_bno) throws Exception;
	
	// 공지사항 상세보기
	public BoardDTO detailView(int notice_bno) throws Exception;
	
	//공지사항 수정
	public void noticeUpdate(BoardDTO boardDTO) throws Exception;
	
	//공지사항 삭제
	public void noticeDelete(BoardDTO boardDTO) throws Exception;

	// 회원 목록 보기 (Paging 처리)

	public List<MemberDTO> memberListPaging(SearchCriteria cri) throws Exception;

	
	// 회원 목록 수 구하기 (Paging 처리)
	public int memberListTotalCount(SearchCriteria cri) throws Exception;
	
	//회원 번호에 해당하는 상세정보화면
	public MemberDTO memberDetail(String m_bno) throws Exception;
	
	//회원 수정
	public void memberUpdate(MemberDTO memberDTO) throws Exception;
	
	//회원 삭제
	public void memberDelete(String m_bno) throws Exception;
	//회원 등급찾기
	public int searchM_power(String m_id)throws Exception;
	// 결제항목 목록 조회
	public List<PaymentDTO> paymentList(SearchCriteria scri) throws Exception;
	// 결제항목 총 갯수
	public int paymentListCount(SearchCriteria scri) throws Exception;
	//결제항목 상세페이지
	public PaymentDTO paymentdetailView(int pay_bno) throws Exception;
	
	//결제항목 수정
	public void paymentUpdate(PaymentDTO paymentDTO) throws Exception;
	
	//결제항목 삭제
	public void paymentDelete(PaymentDTO paymentDTO) throws Exception;
	//결제항목 추가
	public void insertPayment(PaymentDTO paymentDTO) throws Exception;
	// 기능항목 목록 조회
	public List<Room_fncDTO> fncList(SearchCriteria scri) throws Exception;	
	// 대여항목 목록 조회
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
	// -------------------------------------------------------------------------------------------------
	// FAQ 유형 목록
	// -------------------------------------------------------------------------------------------------
	public List<FaqTypeDTO> selectFaqType() throws Exception;
	//  회원들이 예약한 방 목록
	public List<BookDTO> memberBookList() throws Exception;
	// 예약 상세정보를 가져온다.
	public List<BookDTO> memberBookView(String book_order) throws Exception;
	// 예약 상태 변경
	public void bookOk(BookDTO bookDTO) throws Exception;


	

} // end interface AdminService
