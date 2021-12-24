package com.room.member.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.main.dto.BookDTO;
import com.room.member.dto.MemberDTO;
import com.room.member.dto.QnaDTO;
import com.room.member.dto.ReplyDTO;
import com.room.member.dto.ReviewDTO;
import com.room.member.dto.FaqDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

	
	private static final String namespace = "com.room.member.mapper.memberMapper";
	  @Inject
	   private SqlSession sqlSession;


	// -------------------------------------------------------------------------------------------------
	// 로그인
	// -------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		logger.info("로그인 : " + memberDTO);
		return sqlSession.selectOne(namespace + ".login", memberDTO);
	}
	
	// -----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사
	// -----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {

		logger.info("MemberDAOImpl 아이디 중복 검사()");
		return sqlSession.selectOne(namespace + ".idCheck", memberDTO);

	} 
	// -----------------------------------------------------------------------------------------------------------
	//이메일 중복 검사
	// -----------------------------------------------------------------------------------------------------------
	@Override
	public int eCheck(MemberDTO memberDTO) throws Exception {

		logger.info("MemberDAOImpl 이메일 중복 검사()");
		return sqlSession.selectOne(namespace + ".eCheck", memberDTO);

	}
	// -------------------------------------------------------------------------------------------------
	// 회원 가입
	// -------------------------------------------------------------------------------------------------
	@Override
	public int memberInsert(MemberDTO memberDTO) throws Exception {
		logger.info("MemberDAOImpl memberInsert(MemberDTO memberDTO).....");
		return sqlSession.insert(namespace + ".insert", memberDTO);
	}


	// -------------------------------------------------------------------------------------------------
	// 회원 정보 수정
	// -------------------------------------------------------------------------------------------------
	@Override
	public void update(MemberDTO memberDTO) throws Exception {
		sqlSession.update(namespace + ".update", memberDTO);
	}
	// -------------------------------------------------------------------------------------------------
	// 회원 탈퇴
	// -------------------------------------------------------------------------------------------------
	@Override
	public int memberDelete(MemberDTO memberDTO) throws Exception {
		logger.info("MemberDAOImpl memberInsert(MemberDTO memberDTO).....");
		return sqlSession.delete(namespace + ".delete", memberDTO);
	}
	// -------------------------------------------------------------------------------------------------
	// 회원 상세 정보
	// -------------------------------------------------------------------------------------------------
	@Override
	public MemberDTO view(String m_id) throws Exception {
		return sqlSession.selectOne(namespace + ".view", m_id);
	}

	// 아이디 찾기
	public String findidform(String m_email) throws Exception{
		return sqlSession.selectOne(namespace + ".findidform", m_email);
	}

	// 비밀번호 찾기
		public String memberfindpwform(MemberDTO memberDTO) throws Exception {
			return sqlSession.selectOne(namespace + ".memberfindpwform", memberDTO);
	}
	//공지사항 목록 조회
	@Override
	public List<BoardDTO> list(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList(namespace + ".noticePaging", scri);
	}
	//공지사항 카운트
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectOne(namespace + ".noticeTotalCount", scri);
	}

	
	@Override
	public BoardDTO detailView(int board_notice) throws Exception {
		
		return sqlSession.selectOne(namespace + ".detailView", board_notice);
	}
	
	// -------------------------------------------------------------------------------------------------
	// 예약 리스트
	// -------------------------------------------------------------------------------------------------
	@Override
	public List<BookDTO> getBooks(String m_name) throws Exception{
		return sqlSession.selectList(namespace + ".getBooks", m_name);
	}

	// -------------------------------------------------------------------------------------------------
	// 예약 뷰
	// -------------------------------------------------------------------------------------------------
	@Override
	public List<BookDTO> bookView(String book_order) throws Exception{
		return sqlSession.selectList(namespace + ".bookView", book_order);
	}
	
	// -------------------------------------------------------------------------------------------------
	// 비로그인
	// -------------------------------------------------------------------------------------------------
	@Override
	public List<BookDTO> belogin(String book_name) throws Exception{
		logger.info("MemberDAOImpl memberInsert(MemberDTO memberDTO)....."+book_name);
		return sqlSession.selectList(namespace + ".belogin", book_name);
	}
	//-------------------------------------------------------------------------------------------------
	// faq글 갯수 구하기 (Paging 처리)
	//-------------------------------------------------------------------------------------------------
	@Override
	public int faqListTotalCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".faqListTotalCount", cri);
	}
	
	/*-------------------------------------------------------------------------------------------------
	* faq 목록 보기 (Paging 처리)
	-------------------------------------------------------------------------------------------------*/
	@Override
	public List<FaqDTO> faqListPaging(SearchCriteria cri) throws Exception {
		logger.info("*** ManagerDAOImpl Criteria ==> " + cri);
		logger.info("***** ManagerDAOImpl Criteria cri.getSearchType() ==> " + cri.getSearchType());
		
		return sqlSession.selectList(namespace + ".faqListPaging", cri);
	}
	//-------------------------------------------------------------------------------------------------
	// review 글 갯수 구하기 (Paging 처리)
	//-------------------------------------------------------------------------------------------------
	@Override
	public int reviewListTotalCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".reviewListTotalCount", cri);
	}
	
	/*-------------------------------------------------------------------------------------------------
	* review 목록 보기 (Paging 처리)
	-------------------------------------------------------------------------------------------------*/
	@Override
	public List<ReviewDTO> reviewListPaging(SearchCriteria cri) throws Exception {
		
		return sqlSession.selectList(namespace + ".reviewListPaging", cri);
	}
	/*-------------------------------------------------------------------------------------------------
	* qna 작성
	-------------------------------------------------------------------------------------------------*/
	@Override
	public void qnaWrite(QnaDTO qnaDTO) throws Exception {
		
		sqlSession.insert(namespace + ".qnaInsert", qnaDTO);
	}

	/*-------------------------------------------------------------------------------------------------
	* qna list
	-------------------------------------------------------------------------------------------------*/
	@Override
	public List<QnaDTO> qnaList(SearchCriteria cri) throws Exception {
		
		return sqlSession.selectList(namespace + ".qnaListPaging", cri);
	}
	/*-------------------------------------------------------------------------------------------------
	* qna count
	-------------------------------------------------------------------------------------------------*/
	@Override
	public int qnaListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".qnaListTotalCount", scri);
	}
	/*-------------------------------------------------------------------------------------------------
	* qna 게시판 상세보기
	-------------------------------------------------------------------------------------------------*/
	@Override
	public String qnaOne(int qna_bno) throws Exception {
		
		return sqlSession.selectOne(namespace + ".UserIdCheck", qna_bno);
	}
	/*-------------------------------------------------------------------------------------------------
	* qna 게시판 상세보기
	-------------------------------------------------------------------------------------------------*/
	@Override
	public QnaDTO qnaDetail(int qna_bno) throws Exception {
		
		return sqlSession.selectOne(namespace + ".qnaDetail", qna_bno);
	}
	/*-------------------------------------------------------------------------------------------------
	* qna 게시판 수정
	-------------------------------------------------------------------------------------------------*/
	@Override
	public void qnaUpdate(QnaDTO qnaDTO) throws Exception {
		sqlSession.update(namespace + ".qnaUpdate", qnaDTO);
		
	}
	/*-------------------------------------------------------------------------------------------------
	* qna 게시판 삭제
	-------------------------------------------------------------------------------------------------*/
	@Override
	public void qnaDelete(QnaDTO qnaDTO) throws Exception {
		sqlSession.delete(namespace + ".qnaDelete", qnaDTO);
		
	}
	//리뷰 체크
	@Override
	public Integer checkReview(String book_order) throws Exception {

		return sqlSession.selectOne(namespace +".checkReview", book_order);
	}
	//리뷰 추가
	public void insertReview(ReviewDTO reviewDTO) throws Exception {
		sqlSession.insert(namespace+".insertReview",reviewDTO);
	}

	//리뷰 보기
	@Override
	public ReviewDTO getReview(String book_order) throws Exception {
		
		return sqlSession.selectOne(namespace+".getReview",book_order);
	}
	//리뷰 수정
	public void updateReview(ReviewDTO reviewDTO)throws Exception {
		sqlSession.update(namespace+".updateReview",reviewDTO);
	}	
	@Override
	//리뷰 삭제
	public String deleteReview(String book_order)throws Exception {
		sqlSession.delete(namespace + ".deleteReview", book_order);
		return null;
		
	}	
	//qna 답변 작성
	@Override
	public void registReply(ReplyDTO replyDTO) throws Exception {
		sqlSession.insert(namespace + ".registReply", replyDTO);
		
	}
	//qna 답변 리스트
	@Override
	public List<ReplyDTO> replyList(int qna_bno) throws Exception {
		
		return sqlSession.selectList(namespace + ".replyList", qna_bno);
	}
	// qna 답변 삭제
	@Override
	public void deleteReply(ReplyDTO replyDTO) throws Exception {
		sqlSession.delete(namespace + ".deleteReply", replyDTO);
		
	}
	// qna 답변 수정
	@Override
	public void modifyReply(ReplyDTO replyDTO) throws Exception {
		sqlSession.update(namespace + ".modifyReply", replyDTO);
		

	}

}
