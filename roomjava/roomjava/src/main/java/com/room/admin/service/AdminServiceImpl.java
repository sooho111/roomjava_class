package com.room.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.room.admin.dao.AdminDAO;
import com.room.admin.dto.RoomKindDTO;
import com.room.member.dao.MemberDAO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	AdminDAO adminDAO;
	
	// ----------------------------------------------------------------------------------------------------
	// 방 종류 뿌려주기
	// ----------------------------------------------------------------------------------------------------
	@Override
	public List<RoomKindDTO> roomKind() throws Exception {
		return adminDAO.roomKind();
		
	} // end RoomKindDTO roomKind()
	
	
} // end class AdminServiceImpl implements AdminService
