package com.room.main.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.RoomKindDTO;
import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;
import com.room.main.dao.MainDAO;
import com.room.main.dto.BookDTO;
import com.room.main.dto.RoomInfraDTO;

@Service
public class MainServiceImpl implements MainService {

	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Inject
	MainDAO mainDAO;
	
	//-------------------------------------------------------------------------------------------------
	// 방 종류 가져오기
	//-------------------------------------------------------------------------------------------------4
	@Override
	public List<RoomKindDTO> getKind() throws Exception {
		return mainDAO.getKind();
	}
	
	//------------------------------------------------------------------------------------------------
	// 방 리스트를 종류대로 뿌려주기
	//------------------------------------------------------------------------------------------------
	@Override
	public List<RoomInfraDTO> allRooms() throws Exception {
		return mainDAO.allRooms();
	}
	
	//------------------------------------------------------------------------------------------------
	// 방 소분류 종류대로 뿌려주기
	//------------------------------------------------------------------------------------------------
	@Override
	public List<RoomInfraDTO> kindRooms(String room_bno) throws Exception {
		return mainDAO.kindRooms(room_bno);
	}
	
	//------------------------------------------------------------------------------------------------
	// 방 소분류 제목 뿌려주기
	//------------------------------------------------------------------------------------------------
	@Override
	public RoomKindDTO soKind(String room_bno) throws Exception {
		return mainDAO.soKind(room_bno);
	}
	
	//------------------------------------------------------------------------------------------------
	// 방 상세보기
	//------------------------------------------------------------------------------------------------
	@Override
	public RoomInfraDTO getRoomView(int r_bno) throws Exception {
		RoomInfraDTO roominfraDTO = mainDAO.getRoomView(r_bno);
		return roominfraDTO;
	}
	
	//-------------------------------------------------------------------------------------------------
	// 방 기능 가져오기 room_fnc
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<Room_fncDTO> getFnc() throws Exception {
		return mainDAO.getFnc();
	}
	
	//-------------------------------------------------------------------------------------------------
	// 방 렌트할 것 가져오기 room_rent
	//-------------------------------------------------------------------------------------------------
	@Override
	public List<Room_rentDTO> getRent() throws Exception {
		return mainDAO.getRent();
	}
	
	//-------------------------------------------------------------------------------------------------
	// 결제수단 가져오기 payment
	//-------------------------------------------------------------------------------------------------
	public List<PaymentDTO> getPayment() throws Exception {
		return mainDAO.getPayment();
	}
	
	//-------------------------------------------------------------------------------------------------
	// 예약하기 누르면 bookDTO에 담아주기
	//-------------------------------------------------------------------------------------------------
	@Override
	public void insertBook(BookDTO bookDTO) throws Exception {
		logger.info("서비스" + bookDTO);
		mainDAO.insertBook(bookDTO);
	}
	
}
