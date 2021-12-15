package com.room.member.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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
	/*
	// -----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사
	// -----------------------------------------------------------------------------------------------------------
	@Override
	public int idCheck(MemberDTO memberDTO) throws Exception {

		logger.info("MemberDAOImpl 아이디 중복 검사()");
		return sqlSession.selectOne(namespace + ".idCheck", memberDTO);

	} // End - public int idCheck(MemberDTO memberDTO)

	// -------------------------------------------------------------------------------------------------
	// 회원 가입
	// -------------------------------------------------------------------------------------------------
	@Override
	public int memberInsert(MemberDTO memberDTO) throws Exception {
		logger.info("MemberDAOImpl memberInsert(MemberDTO memberDTO).....");
		return sqlSession.insert(namespace + ".insert", memberDTO);
	}

	// -------------------------------------------------------------------------------------------------
	// 회원가입 POST (Ajax)
	// -------------------------------------------------------------------------------------------------
	@Override
	public int register(MemberDTO memberDTO) throws Exception {
		logger.info("회원가입(Ajax) : " + memberDTO);
		return sqlSession.insert(namespace + ".register", memberDTO);
	}

	// -------------------------------------------------------------------------------------------------
	// 회원 정보 수정
	// -------------------------------------------------------------------------------------------------
	@Override
	public void update(MemberDTO memberDTO) throws Exception {
		sqlSession.update(namespace + ".update", memberDTO);
	}

	// 아이디 찾기
	public String findidform(String userEmail) throws Exception{
		return sqlSession.selectOne(namespace + ".findidform", userEmail);
	}

	// 비밀번호 찾기
		public String memberfindpwform(MemberDTO memberDTO) throws Exception {
			return sqlSession.selectOne(namespace + ".memberfindpwform", memberDTO);
	}

	// -------------------------------------------------------------------------------------------------
	// 회원 가입
	// -------------------------------------------------------------------------------------------------
	@Override
	public int memberDelete(String userId) throws Exception {
		logger.info("MemberDAOImpl memberInsert(MemberDTO memberDTO).....");
		return sqlSession.delete(namespace + ".delete", userId);
	}

	// -----------------------------------------------------------------------------------------------------------
	//이메일 중복 검사
	// -----------------------------------------------------------------------------------------------------------
	@Override
	public int eCheck(MemberDTO memberDTO) throws Exception {

		logger.info("MemberDAOImpl 이메일 중복 검사()");
		return sqlSession.selectOne(namespace + ".eCheck", memberDTO);

	}
*/

}
