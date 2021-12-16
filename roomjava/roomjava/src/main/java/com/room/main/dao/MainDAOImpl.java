package com.room.main.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
class MainDAOImpl implements MainDAO {

	private static final Logger logger = LoggerFactory.getLogger(MainDAOImpl.class);
	
	private static final String namespace = "com.room.main.mapper.mainMapper";
	
	@Inject
	private SqlSession sqlSession;
	//-------------------------------------------------------------------------------------------------
	//
	//-------------------------------------------------------------------------------------------------
	
}
