package com.room.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;

import com.room.admin.dto.RoomKindDTO;




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
	// 공지사항 리스트
	@Override
	public List<BoardDTO> list(SearchCriteria scri) throws Exception {

		return sqlSession.selectList(namespace + ".noticePaging", scri);
	}
	// 공지사항 카운트
	@Override
	public int listCount(SearchCriteria scri) throws Exception {

		return sqlSession.selectOne(namespace + ".noticeTotalCount", scri);
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
	

} // end class AdminDAOImpl implements AdminDAO
