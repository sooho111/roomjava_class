package com.room.main.dao;

import java.util.List;

import com.room.admin.dto.RoomKindDTO;
import com.room.main.dto.RoomInfraDTO;

public interface MainDAO {

	//-------------------------------------------------------------------------------------------------
	// 방 종류 가져오기
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
	
}
