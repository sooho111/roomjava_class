package com.room.main.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.room.admin.dto.RoomKindDTO;
import com.room.main.dao.MainDAO;
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
	public List<RoomInfraDTO> allRooms() throws Exception {
		return mainDAO.allRooms();
	}
	
	//------------------------------------------------------------------------------------------------
	// 방 상세보기
	//------------------------------------------------------------------------------------------------
	public RoomInfraDTO getRoomView(int r_bno) throws Exception {
		RoomInfraDTO roominfraDTO = mainDAO.getRoomView(r_bno);
		return roominfraDTO;
	}

}
