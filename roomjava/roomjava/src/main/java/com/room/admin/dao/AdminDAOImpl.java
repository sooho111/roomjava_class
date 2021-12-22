package com.room.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.member.dto.FaqDTO;
import com.room.member.dto.MemberDTO;
import com.room.member.dto.FaqTypeDTO;
import com.room.admin.dto.RoomKindDTO;
import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;




@Repository
public class AdminDAOImpl implements AdminDAO {

	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);

	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.room.admin.mapper.adminMapper";

	// 공지사항 작성
	@Override
	public void noticeWrite(BoardDTO boardDTO) throws Exception {
		sqlSession.insert(namespace + ".notice", boardDTO);	
	}
	// faq 작성
	@Override
	public void faqWrite(FaqDTO faqDTO) throws Exception {
		sqlSession.insert(namespace + ".faq", faqDTO);	
	}
	// 공지사항 리스트
	@Override
	public List<BoardDTO> list(SearchCriteria scri) throws Exception {

		logger.info("DAO => " + sqlSession.selectList(namespace + ".noticePaging", scri));
		return sqlSession.selectList(namespace + ".noticePaging", scri);
	}
	// 공지사항 카운트
	@Override
	public int listCount(SearchCriteria scri) throws Exception {

		return sqlSession.selectOne(namespace + ".noticeTotalCount", scri);
	}
	// faq 리스트
	@Override
	public List<FaqDTO> faqlist(SearchCriteria scri) throws Exception {

		logger.info("DAO => " + sqlSession.selectList(namespace + ".noticePaging", scri));
		return sqlSession.selectList(namespace + ".faqPaging", scri);
	}
	// faq 카운트
	@Override
	public int faqlistCount(SearchCriteria scri) throws Exception {

		return sqlSession.selectOne(namespace + ".faqTotalCount", scri);
	}
	// faq 상세페이지
	@Override
	public FaqDTO faqdetailView(int faq_bno) throws Exception {
		
		return sqlSession.selectOne(namespace + ".faqdetailView", faq_bno);
	}
	
	//faq 수정
	@Override
	public void faqUpdate(FaqDTO faqDTO) throws Exception {
		
		sqlSession.update(namespace + ".faqUpdate", faqDTO);
			
	}
	//faq 삭제
	@Override
	public void faqDelete(FaqDTO faqDTO) throws Exception {
		sqlSession.delete(namespace + ".faqDelete", faqDTO);
		
	}
	
	
	// ----------------------------------------------------------------------------------------------------
	// 방 종류 뿌려주기
	// ----------------------------------------------------------------------------------------------------
	@Override
	public List<RoomKindDTO> roomKind() throws Exception {
		return sqlSession.selectList(namespace + ".roomKind");
		
	} // end RoomKindDTO roomKind()
	
	// 공지사항 상세페이지
	@Override
	public BoardDTO detailView(int notice_bno) throws Exception {
		
		return sqlSession.selectOne(namespace + ".detailView", notice_bno);
	}
	
	//공지사항 수정
		@Override
		public void noticeUpdate(BoardDTO boardDTO) throws Exception {
			
			sqlSession.update(namespace + ".noticeUpdate", boardDTO);
			
		}
		
		//공지사항 삭제
		@Override
		public void noticeDelete(BoardDTO boardDTO) throws Exception {
			sqlSession.delete(namespace + ".noticeDelete", boardDTO);
		
	}
		//회원 목록 보기 (Paging 처리)
		@Override
		@SuppressWarnings("unchecked")
		public List<MemberDTO> memberListPaging(SearchCriteria cri) throws Exception {

			return sqlSession.selectList(namespace + ".memberListPaging", cri);
		}

		//회원 목록 수 구하기 (Paging 처리)
		@Override
		public int memberListTotalCount(SearchCriteria cri) throws Exception {
			return sqlSession.selectOne(namespace + ".memberListTotalCount", cri);
		}
		
		//회원 번호에 해당하는 상세정보화면
		@Override
		public MemberDTO memberDetail(String m_bno) throws Exception {
			return sqlSession.selectOne(namespace + ".memberDetail", m_bno);
		}
		
		//회원 수정
		public void memberUpdate(MemberDTO memberDTO) throws Exception {
			sqlSession.update(namespace + ".memberUpdate", memberDTO);
		}
		
		//회원 삭제
		public void memberDelete(String m_bno) throws Exception {
			sqlSession.delete(namespace + ".memberDelete", m_bno);
		}
		//회원 등급 찾기
		public int searchM_power (String m_id) throws Exception {
			return sqlSession.selectOne(namespace + ".searchM_power", m_id);
		}
		// 공지사항 리스트
		@Override
		public List<PaymentDTO> paymentList(SearchCriteria scri) throws Exception {

			return sqlSession.selectList(namespace + ".paymentPaging", scri);
		}
		// 공지사항 카운트
		@Override
		public int paymentListCount(SearchCriteria scri) throws Exception {

			return sqlSession.selectOne(namespace + ".paymentTotalCount", scri);
		}
		// 공지사항 작성
		@Override
		public void insertPayment(PaymentDTO paymentDTO) throws Exception {
			sqlSession.insert(namespace + ".payment", paymentDTO);
			
			
		}
		// 공지사항 상세페이지
		@Override
		public PaymentDTO paymentdetailView(int pay_bno) throws Exception {
			
			return sqlSession.selectOne(namespace + ".paymentdetailView", pay_bno);
		}
		
		//공지사항 수정
		@Override
		public void paymentUpdate(PaymentDTO paymentDTO) throws Exception {
			
			sqlSession.update(namespace + ".paymentUpdate", paymentDTO);
				
		}
			
		//공지사항 삭제
		@Override
		public void paymentDelete(PaymentDTO paymentDTO) throws Exception {
			sqlSession.delete(namespace + ".paymentDelete", paymentDTO);
			
		}
		// 기능 리스트
		@Override
		public List<Room_fncDTO> fncList(SearchCriteria scri) throws Exception {

			return sqlSession.selectList(namespace + ".fncList", scri);
		}
		// 대여 리스트
		@Override
		public List<Room_rentDTO> rentList(SearchCriteria scri) throws Exception {

			return sqlSession.selectList(namespace + ".rentList", scri);
		}
		// 기능 추가
		@Override
		public void insertfnc(Room_fncDTO room_fncDTO) throws Exception {
			sqlSession.insert(namespace + ".insertFnc", room_fncDTO);
		}
		// 대여 추가
		@Override
		public void  insertrent(Room_rentDTO room_rentDTO) throws Exception {
			sqlSession.insert(namespace + ".insertRent", room_rentDTO);
			
			
		}
		// 공지사항 상세페이지
		@Override
		public Room_fncDTO fncdetailView(int fnc_bno) throws Exception {
			
			return sqlSession.selectOne(namespace + ".fncdetailView", fnc_bno);
		}
		
		//기능 수정
		@Override
		public void fncUpdate(Room_fncDTO room_fncDTO) throws Exception {
			
			sqlSession.update(namespace + ".fncUpdate", room_fncDTO);
				
		}
		// 대여 상세페이지
		@Override
		public Room_rentDTO rentdetailView(int rent_bno) throws Exception {
			
			return sqlSession.selectOne(namespace + ".rentdetailView", rent_bno);
		}
		
		//대여 수정
		@Override
		public void rentUpdate(Room_rentDTO room_rentDTO) throws Exception {
			
			sqlSession.update(namespace + ".rentUpdate", room_rentDTO);
				
		}
		//기능 삭제
		@Override
		public void fncDelete(Room_fncDTO room_fncDTO) throws Exception {
			sqlSession.delete(namespace + ".fncDelete", room_fncDTO);
			
		}
		//대여 삭제
		@Override
		public void rentDelete(Room_rentDTO room_rentDTO) throws Exception {
			sqlSession.delete(namespace + ".rentDelete", room_rentDTO);
			
		}
		// -------------------------------------------------------------------------------------------------
		// Faq 유형 목록 보기
		// -------------------------------------------------------------------------------------------------
		@Override
		public List<FaqTypeDTO> selectFaqType() throws Exception {
			logger.info("ManagerDAOImpl selectFaqType() Start....");
			return sqlSession.selectList(namespace + ".selectFaqType");
		}
			

} // end class AdminDAOImpl implements AdminDAO
