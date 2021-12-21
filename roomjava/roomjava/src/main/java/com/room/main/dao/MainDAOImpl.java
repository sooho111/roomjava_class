package com.room.main.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.RoomKindDTO;
import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;
import com.room.main.dto.RoomInfraDTO;


@Repository
class MainDAOImpl implements MainDAO {

	private static final Logger logger = LoggerFactory.getLogger(MainDAOImpl.class);
	
	private static final String namespace = "com.room.main.mapper.mainMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	//-------------------------------------------------------------------------------------------------
	// 방 종류 가져오기
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<RoomKindDTO> getKind() throws Exception {
		return sqlSession.selectList(namespace + ".kind");
	}
	
	//------------------------------------------------------------------------------------------------
	// 방 리스트를 종류대로 뿌려주기
	//------------------------------------------------------------------------------------------------
	@Override
	public List<RoomInfraDTO> allRooms() throws Exception {
		return sqlSession.selectList(namespace + ".allRooms");
	}
	
	//------------------------------------------------------------------------------------------------
	// 방 소분류 종류대로 뿌려주기
	//------------------------------------------------------------------------------------------------
	@Override
	public List<RoomInfraDTO> kindRooms(String room_bno) throws Exception {
		return sqlSession.selectList(namespace + ".kindRooms", room_bno);
	}
	
	//------------------------------------------------------------------------------------------------
	// 방 소분류 제목 뿌려주기
	//------------------------------------------------------------------------------------------------
	@Override
	public RoomKindDTO soKind(String room_bno) throws Exception {
		return sqlSession.selectOne(namespace + ".soKind", room_bno);
	}
	
	//------------------------------------------------------------------------------------------------
	// 방 상세보기
	//------------------------------------------------------------------------------------------------
	@Override
	public RoomInfraDTO getRoomView(int r_bno) throws Exception {
		RoomInfraDTO roominfraDTO = sqlSession.selectOne(namespace + ".roomView", r_bno);
		return roominfraDTO;
	}
	
	//-------------------------------------------------------------------------------------------------
	// 방 기능 가져오기 room_fnc
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<Room_fncDTO> getFnc() throws Exception {
		return sqlSession.selectList(namespace + ".getFnc");
	}
	
	//-------------------------------------------------------------------------------------------------
	// 방 렌트할 것 가져오기 room_rent
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<Room_rentDTO> getRent() throws Exception {
		return sqlSession.selectList(namespace + ".getRent");
	}
	
	//-------------------------------------------------------------------------------------------------
	// 결제수단 가져오기 payment
	//-------------------------------------------------------------------------------------------------
	public List<PaymentDTO> getPayment() throws Exception {
		return sqlSession.selectList(namespace + ".getPayment");
	}
}