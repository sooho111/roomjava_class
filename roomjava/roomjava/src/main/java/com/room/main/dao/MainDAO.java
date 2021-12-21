package com.room.main.dao;

import java.util.List;

import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.RoomKindDTO;
import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;
import com.room.main.dto.RoomInfraDTO;

public interface MainDAO {

	//-------------------------------------------------------------------------------------------------
	// 방 종류 가져오기 room_class
	//-------------------------------------------------------------------------------------------------
	public List<RoomKindDTO> getKind() throws Exception;

	//------------------------------------------------------------------------------------------------
	// 방 리스트를 종류대로 뿌려주기
	//------------------------------------------------------------------------------------------------
	public List<RoomInfraDTO> allRooms() throws Exception;
	
	//------------------------------------------------------------------------------------------------
	// 방 소분류 제목 뿌려주기
	//------------------------------------------------------------------------------------------------
	public List<RoomInfraDTO> kindRooms(String room_bno) throws Exception;
	
	//------------------------------------------------------------------------------------------------
	// 방 소분류 종류대로 뿌려주기
	//------------------------------------------------------------------------------------------------
	public RoomKindDTO soKind(String room_bno) throws Exception;

	//------------------------------------------------------------------------------------------------
	// 방 상세보기
	//------------------------------------------------------------------------------------------------
	public RoomInfraDTO getRoomView(int r_bno) throws Exception;
	
	//-------------------------------------------------------------------------------------------------
	// 방 기능 가져오기 room_fnc
	//-------------------------------------------------------------------------------------------------
	public List<Room_fncDTO> getFnc() throws Exception;
	
	//-------------------------------------------------------------------------------------------------
	// 방 렌트할 것 가져오기 room_rent
	//-------------------------------------------------------------------------------------------------
	public List<Room_rentDTO> getRent() throws Exception;
	
	//-------------------------------------------------------------------------------------------------
	// 결제수단 가져오기 payment
	//-------------------------------------------------------------------------------------------------
	public List<PaymentDTO> getPayment() throws Exception;
}
