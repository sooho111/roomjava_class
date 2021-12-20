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
	public int memberDelete(String m_id) throws Exception {
		logger.info("MemberDAOImpl memberInsert(MemberDTO memberDTO).....");
		return sqlSession.delete(namespace + ".delete", m_id);
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
	
	@Override
	public List<BookDTO> getBooks(String m_name) throws Exception{
		return sqlSession.selectList(namespace + ".getBooks", m_name);
	}



}
