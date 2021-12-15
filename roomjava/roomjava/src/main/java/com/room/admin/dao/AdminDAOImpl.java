package com.room.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.room.admin.dto.RoomKindDTO;



@Repository
public class AdminDAOImpl implements AdminDAO {

	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);

	@Inject
	SqlSession sqlSession;
	
	private static final String namespace = "com.room.admin.mapper.Adminmapper";
	
	// ----------------------------------------------------------------------------------------------------
	// 방 종류 뿌려주기
	// ----------------------------------------------------------------------------------------------------
	@Override
	public List<RoomKindDTO> roomKind() throws Exception {
		return sqlSession.selectList(namespace + ".roomKind");
		
	} // end RoomKindDTO roomKind()

} // end class AdminDAOImpl implements AdminDAO
