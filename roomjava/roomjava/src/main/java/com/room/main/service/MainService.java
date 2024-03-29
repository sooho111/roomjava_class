package com.room.main.service;

import java.util.List;

import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.RoomKindDTO;
import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;
import com.room.main.dto.BookDTO;
import com.room.main.dto.RoomInfraDTO;

public interface MainService {

	//-------------------------------------------------------------------------------------------------
	// 방 종류 가져오기 room_class
	//-------------------------------------------------------------------------------------------------
	public List<RoomKindDTO> getKind() throws Exception;
	
	//------------------------------------------------------------------------------------------------
	// 방 리스트를 종류대로 뿌려주기
	//------------------------------------------------------------------------------------------------
	public List<RoomInfraDTO> allRooms() throws Exception;
	
	//-------------------------------------------------------------------------------------------------
	// 방 소분류 가져오기
	//-------------------------------------------------------------------------------------------------
	public List<RoomInfraDTO> kindRooms(String room_bno) throws Exception;
	
	//-------------------------------------------------------------------------------------------------
	// 방 소분류 제목 가져오기
	//-------------------------------------------------------------------------------------------------
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
	
	//-------------------------------------------------------------------------------------------------
	// 예약하기 누르면 bookDTO에 담아주기
	//-------------------------------------------------------------------------------------------------
	public void insertBook(BookDTO bookDTO) throws Exception;
	
	//-------------------------------------------------------------------------------------------------
	// DB에 예약정보 유무
	//-------------------------------------------------------------------------------------------------
	public List<BookDTO> manyBook() throws Exception;
	
	//-------------------------------------------------------------------------------------------------
	// 예약날 중복 불가
	//-------------------------------------------------------------------------------------------------
	public int haveBookDay(BookDTO bookDTO) throws Exception;
	
	//-------------------------------------------------------------------------------------------------
	// 비회원 예약하기
	//-------------------------------------------------------------------------------------------------
	public void insertBmemBook(BookDTO bookDTO) throws Exception;
	
}
