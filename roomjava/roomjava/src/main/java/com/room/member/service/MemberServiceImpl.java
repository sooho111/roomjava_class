package com.room.member.service;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.main.dto.BookDTO;
import com.room.member.dao.MemberDAO;
import com.room.member.dto.MemberDTO;
import com.room.member.dto.QnaDTO;
import com.room.member.dto.ReplyDTO;
import com.room.member.dto.ReviewDTO;
import com.room.member.dto.FaqDTO;


@Service
public class MemberServiceImpl implements MemberService {
@Inject
MemberDAO memberDAO;

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	// -------------------------------------------------------------------------------------------------
	// 로그인
	// -------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return memberDAO.login(memberDTO);
	}
	// -----------------------------------------------------------------------------------------------------------
	// 회원 아이디 중복 검사
	// -----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {

		logger.info("MemberServieImpl 아이디 중복 검사()");
		int result = memberDAO.idCheck(memberDTO);
		return result;

	}
	// -----------------------------------------------------------------------------------------------------------
	// 회원 이메일 중복 검사
	// -----------------------------------------------------------------------------------------------------------
	@Override
	public int eCheck(MemberDTO memberDTO) throws Exception {

		logger.info("MemberServieImpl 이메일 중복 검사()");
		int result = memberDAO.eCheck(memberDTO);
		return result;
	}
	// -------------------------------------------------------------------------------------------------
	// 회원 가입
	// -------------------------------------------------------------------------------------------------
	@Override
	public int memberInsert(MemberDTO memberDTO) throws Exception {
		logger.info("MemberServiceImpl memberInsert(MemberDTO memberDTO).....");

		if (!memberDTO.getM_pwd().equals(memberDTO.getM_pwd())) {
			return -1;
		}
		int result = memberDAO.memberInsert(memberDTO);
		return result;
	}
	// -------------------------------------------------------------------------------------------------
	// 회원 정보 수정
	// -------------------------------------------------------------------------------------------------
	@Override
	public void update(MemberDTO memberDTO) throws Exception {
		logger.info("MemberServiceImpl update(MemberDTO memberDTO).....");
		memberDAO.update(memberDTO);
	}
	// -------------------------------------------------------------------------------------------------
	// 회원 상세 정보
	// -------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO view(String m_id) throws Exception {
		logger.info("MemberServiceImpl view(String id).....");
		return memberDAO.view(m_id);
	}

	// -------------------------------------------------------------------------------------------------
	// 회원탈퇴
	// -------------------------------------------------------------------------------------------------
	@Override
	public int memberDelete(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberDelete(memberDTO);
	}






	// -------------------------------------------------------------------------------------------------
	// 아이디 찾기
	// -------------------------------------------------------------------------------------------------
	public String findidform(HttpServletResponse response, String m_email) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String m_id = memberDAO.findidform(m_email);
		
		if (m_id == null) {
			out.println("<script>");
			out.println("alert('가입된 이메일이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return m_id;
		}
	}

	// -------------------------------------------------------------------------------------------------
		// 비밀번호 찾기
		// -------------------------------------------------------------------------------------------------
		public String memberfindpwform(HttpServletResponse response, MemberDTO memberDTO) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String m_pwd = memberDAO.memberfindpwform(memberDTO);
			
			if(m_pwd == null) {
				out.println("<script>");
				out.println("alert('입력한 id 또는 email을 찾을 수 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}else {
				return m_pwd;
			}
		}
		//-----------------------------------------------------------------------------------------------------
		//공지사항 리스트
		//-----------------------------------------------------------------------------------------------------
		@Override
		public List<BoardDTO> list(SearchCriteria scri) throws Exception {
			
			return memberDAO.list(scri);
		}
		//-----------------------------------------------------------------------------------------------------
		//공지사항 카운트
		//-----------------------------------------------------------------------------------------------------
		@Override
		public int listCount(SearchCriteria scri) throws Exception {
			
			return memberDAO.listCount(scri);
		}
		//-----------------------------------------------------------------------------------------------------
		//공지사항 상세페이지
		//-----------------------------------------------------------------------------------------------------		
		@Override
		public BoardDTO detailView(int notice_bno) throws Exception {
			
			return memberDAO.detailView(notice_bno);
		}
		
		
		// -------------------------------------------------------------------------------------------------
		// 예약 리스트
		// -------------------------------------------------------------------------------------------------
		@Override
		public List<BookDTO> getBooks(String m_name) throws Exception{
			return memberDAO.getBooks(m_name);
		}
		
		// -------------------------------------------------------------------------------------------------
		// 예약 뷰
		// -------------------------------------------------------------------------------------------------
		@Override
		public List<BookDTO> bookView(String book_order) throws Exception{
			return memberDAO.bookView(book_order);
		}

		// -------------------------------------------------------------------------------------------------
		// 비회원
		// -------------------------------------------------------------------------------------------------
		@Override
		public List<BookDTO> belogin(String book_name) throws Exception{
			return memberDAO.belogin(book_name);
		}
		// -------------------------------------------------------------------------------------------------
		// 전체 Faq 수 구하기 (Paging 처리)
		// -------------------------------------------------------------------------------------------------
		@Override
		public int faqListTotalCount(SearchCriteria cri) throws Exception {
			return memberDAO.faqListTotalCount(cri);
		}

		/*-------------------------------------------------------------------------------------------------
		* Faq 목록 보기 (Paging 처리)
		-------------------------------------------------------------------------------------------------*/
		@Override
		public List<FaqDTO> faqListPaging(SearchCriteria cri) throws Exception {
			logger.info("*** Board2ServiceImpl Criteria ==> " + cri);
			return memberDAO.faqListPaging(cri);
		}
		// -------------------------------------------------------------------------------------------------
		// 전체 Faq 수 구하기 (Paging 처리)
		// -------------------------------------------------------------------------------------------------
		@Override
		public int reviewListTotalCount(SearchCriteria cri) throws Exception {
			return memberDAO.reviewListTotalCount(cri);
		}

		/*-------------------------------------------------------------------------------------------------
		* Faq 목록 보기 (Paging 처리)
		-------------------------------------------------------------------------------------------------*/
		@Override
		public List<ReviewDTO> reviewListPaging(SearchCriteria cri) throws Exception {
			return memberDAO.reviewListPaging(cri);
		}
		
		/*-------------------------------------------------------------------------------------------------
		* qna 작성
		-------------------------------------------------------------------------------------------------*/		
		@Override
		public void qnaWrite(QnaDTO qnaDTO) throws Exception {
			
			memberDAO.qnaWrite(qnaDTO);
		}

		/*-------------------------------------------------------------------------------------------------
		* qna list
		-------------------------------------------------------------------------------------------------*/	
		@Override
		public List<QnaDTO> qnaList(SearchCriteria cri) throws Exception {
			return memberDAO.qnaList(cri);
			
		}
		
		/*-------------------------------------------------------------------------------------------------
		* qna counts
		-------------------------------------------------------------------------------------------------*/	
		@Override
		public int qnaListCount(SearchCriteria scri) throws Exception {
			
			return memberDAO.qnaListCount(scri);
		}
		/*-------------------------------------------------------------------------------------------------
		* qna 게시판 상세보기
		-------------------------------------------------------------------------------------------------*/	
		@Override
		public String qnaOne(int qna_bno) throws Exception {
			
			return memberDAO.qnaOne(qna_bno);
		}
		/*-------------------------------------------------------------------------------------------------
		* qna 게시판 상세보기
		-------------------------------------------------------------------------------------------------*/			
		
		@Override
		public QnaDTO qnaDetail(int qna_bno) throws Exception {
			
			return memberDAO.qnaDetail(qna_bno);
		}
		/*-------------------------------------------------------------------------------------------------
		* qna 게시판 수정
		-------------------------------------------------------------------------------------------------*/
		@Override
		public void qnaUpdate(QnaDTO qnaDTO) throws Exception {
			
			memberDAO.qnaUpdate(qnaDTO);
		}
		/*-------------------------------------------------------------------------------------------------
		* qna 게시판 삭제
		-------------------------------------------------------------------------------------------------*/
		@Override
		public void qnaDelete(QnaDTO qnaDTO) throws Exception {
			
			memberDAO.qnaDelete(qnaDTO);
			
		}	

		//리뷰 체크
		@Override
		public Integer checkReview(String book_order) throws Exception {
			return memberDAO.checkReview(book_order);
		}
		//리뷰 작성
		@Override
		public void insertReview(ReviewDTO reviewDTO) throws Exception {
			memberDAO.insertReview(reviewDTO);
		}
<<<<<<< HEAD
		//리뷰 가져오기
		@Override
		public ReviewDTO getReview(String book_order) throws Exception {
			
			return memberDAO.getReview(book_order);
		}
		//리뷰 수정
		public void updateReview(ReviewDTO reviewDTO) throws Exception {
			memberDAO.updateReview(reviewDTO);
		}
=======
		//qna 답변 작성
		@Override
		public void registReply(ReplyDTO replyDTO) throws Exception {
			memberDAO.registReply(replyDTO);
			
		}
		//qna 답변 리스트
		@Override
		public List<ReplyDTO> replyList(int qna_bno) throws Exception {
			
			return memberDAO.replyList(qna_bno);
		}
		//qna 답변 삭제
		@Override
		public void deleteReply(ReplyDTO replyDTO) throws Exception {
			memberDAO.deleteReply(replyDTO);
			
		}
		//qna 답변 수정
		@Override
		public void modifyReply(ReplyDTO replyDTO) throws Exception {
			memberDAO.modifyReply(replyDTO);
			
		}
		

>>>>>>> sooho

	
}
