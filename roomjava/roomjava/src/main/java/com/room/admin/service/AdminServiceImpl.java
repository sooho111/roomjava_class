package com.room.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.room.admin.dao.AdminDAO;
import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.main.dto.BookDTO;
import com.room.member.dto.FaqDTO;
import com.room.member.dto.FaqTypeDTO;
import com.room.member.dto.MemberDTO;
import com.room.admin.dto.RoomKindDTO;
import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	AdminDAO adminDAO;

	//공지사항 작성
	@Override
	public void noticeWrite(BoardDTO boardDTO) throws Exception {
		
		adminDAO.noticeWrite(boardDTO);
	}
	//공지사항 작성
	@Override
	public void faqWrite(FaqDTO faqDTO) throws Exception {
		
		adminDAO.faqWrite(faqDTO);
	}
	//공지사항 페이징
	@Override
	public List<BoardDTO> list(SearchCriteria scri) throws Exception {
		
		return adminDAO.list(scri);
	}
	//공지사항 갯수확인
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return adminDAO.listCount(scri);
	} 	
	//faq 페이징
	@Override
	public List<FaqDTO> faqlist(SearchCriteria scri) throws Exception {
		
		return adminDAO.faqlist(scri);
	}
	//faq 갯수확인
	@Override
	public int faqlistCount(SearchCriteria scri) throws Exception {
		
		return adminDAO.faqlistCount(scri);
	} 	
	//결제 삭제
	@Override
	public void faqDelete(FaqDTO faqDTO) throws Exception {
		
	adminDAO.faqDelete(faqDTO);
	}	
	//기능 수정
	@Override
	public void faqUpdate(FaqDTO faqDTO) throws Exception {
		
		adminDAO.faqUpdate(faqDTO);
		
	}
	//기능 상세페이지
	@Override
	public FaqDTO faqdetailView(int faq_bno) throws Exception {
		
		return adminDAO.faqdetailView(faq_bno);
	}
	
	// ----------------------------------------------------------------------------------------------------
	// 방 종류 뿌려주기
	// ----------------------------------------------------------------------------------------------------
	@Override
	public List<RoomKindDTO> roomKind() throws Exception {
		return adminDAO.roomKind();
		
	} // end RoomKindDTO roomKind()
	
	//공지사항 상세페이지
	@Override
	public BoardDTO detailView(int notice_bno) throws Exception {
		
		return adminDAO.detailView(notice_bno);
	}
	
	//공지사항 수정
	@Override
	public void noticeUpdate(BoardDTO boardDTO) throws Exception {
		
		adminDAO.noticeUpdate(boardDTO);
		
	}
	
	//공지사항 삭제
	@Override
	public void noticeDelete(BoardDTO boardDTO) throws Exception {
		
		adminDAO.noticeDelete(boardDTO);
		
	}
	//회원 목록 보기 (Paging 처리)
	@Override
	public List<MemberDTO> memberListPaging(SearchCriteria cri) throws Exception {
		return adminDAO.memberListPaging(cri);
	}

	// 회원 목록 수 구하기 (Paging 처리)
	@Override
	public int memberListTotalCount(SearchCriteria cri) throws Exception {
		return adminDAO.memberListTotalCount(cri);
	}
	
	//회원 번호에 해당하는 상세정보화면

	@Override
	public MemberDTO memberDetail(String m_bno) throws Exception {
		return adminDAO.memberDetail(m_bno);
	}
	

	// 회원 수정
	@Override
	public void memberUpdate(MemberDTO memberDTO) throws Exception {
		adminDAO.memberUpdate(memberDTO);
	}
	
	//회원 삭제
	@Override
	public void memberDelete(String m_bno) throws Exception {
		adminDAO.memberDelete(m_bno);
	}
	//회원 등급 찾기
	@Override
	public int searchM_power(String m_id) throws Exception {
		return adminDAO.searchM_power(m_id);
	}
	//결제항목 페이징
	@Override
	public List<PaymentDTO> paymentList(SearchCriteria scri) throws Exception {
		
		return adminDAO.paymentList(scri);
	}
	//결제항목 갯수확인
	@Override
	public int paymentListCount(SearchCriteria scri) throws Exception {
		
		return adminDAO.paymentListCount(scri);
	} 	
	//공지사항 작성
	@Override
	public void insertPayment(PaymentDTO paymentDTO) throws Exception {
		
		adminDAO.insertPayment(paymentDTO);
	}
	//공지사항 상세페이지
	@Override
	public PaymentDTO paymentdetailView(int pay_bno) throws Exception {
		
		return adminDAO.paymentdetailView(pay_bno);
	}
	
	//공지사항 수정
	@Override
	public void paymentUpdate(PaymentDTO paymentDTO) throws Exception {
		
		adminDAO.paymentUpdate(paymentDTO);
		
	}
	
	//결제 삭제
	@Override
	public void paymentDelete(PaymentDTO paymentDTO) throws Exception {
		
		adminDAO.paymentDelete(paymentDTO);
		
	}
	//기능항목 조회
	@Override
	public List<Room_fncDTO> fncList(SearchCriteria scri) throws Exception {
		
		return adminDAO.fncList(scri);
	}
	//대여항목 조회
	@Override
	public List<Room_rentDTO> rentList(SearchCriteria scri) throws Exception {
		
		return adminDAO.rentList(scri);
	}
	//기능 추가
	@Override
	public void insertfnc(Room_fncDTO room_fncDTO) throws Exception {
		
		adminDAO.insertfnc(room_fncDTO);
	}
	//대여 추가
	@Override
	public void insertrent(Room_rentDTO room_rentDTO) throws Exception {
		
		adminDAO.insertrent(room_rentDTO);
	}
	//기능 상세페이지
	@Override
	public Room_fncDTO fncdetailView(int fnc_bno) throws Exception {
		
		return adminDAO.fncdetailView(fnc_bno);
	}
	
	//기능 수정
	@Override
	public void fncUpdate(Room_fncDTO room_fncDTO) throws Exception {
		
		adminDAO.fncUpdate(room_fncDTO);
		
	}
	//대여 상세페이지
	@Override
	public Room_rentDTO rentdetailView(int rent_bno) throws Exception {
		
		return adminDAO.rentdetailView(rent_bno);
	}
	
	//대여 수정
	@Override
	public void rentUpdate(Room_rentDTO room_rentDTO) throws Exception {
		
		adminDAO.rentUpdate(room_rentDTO);
		
	}
	//결제 삭제
	@Override
	public void fncDelete(Room_fncDTO room_fncDTO) throws Exception {
	
	adminDAO.fncDelete(room_fncDTO);
	}
	//결제 삭제
	@Override
	public void rentDelete(Room_rentDTO room_rentDTO) throws Exception {
		
	adminDAO.rentDelete(room_rentDTO);
	}	
	// -------------------------------------------------------------------------------------------------
	// Faq 목록 가져오기
	// -------------------------------------------------------------------------------------------------
	@Override
	public List<FaqTypeDTO> selectFaqType() throws Exception {
		logger.info("ManagerDAOImpl selectFaqType() Start....");
		return adminDAO.selectFaqType();
	}

	//-----------------------------------------------------------------------------------------------------------
	// 회원들이 예약한 방 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<BookDTO> memberBookList() throws Exception {
		return adminDAO.memberBookList();
	}
	
	//-------------------------------------------------------------------------------------------------
	// 예약 상세정보를 가져온다.
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<BookDTO> memberBookView(String book_order) throws Exception {
		return adminDAO.memberBookView(book_order);
	}
	
	//-------------------------------------------------------------------------------------------------
	// 배송 상태 변경
	//-------------------------------------------------------------------------------------------------
	@Override
	public void bookOk(BookDTO bookDTO) throws Exception {
		adminDAO.bookOk(bookDTO);
	}

	
	
	
} // end class AdminServiceImpl implements AdminService
