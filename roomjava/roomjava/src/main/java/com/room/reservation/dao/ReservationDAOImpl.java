package com.room.reservation.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.room.member.service.MemberServiceImpl;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	private static final String namespace = "com.room.reservation.mapper.reservationMapper";
	
	@Inject
	private SqlSession sqlSession;
	//-------------------------------------------------------------------------------------------------
	//
	//-------------------------------------------------------------------------------------------------
}
