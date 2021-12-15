package com.room.admin.service;

import java.util.List;

import com.room.admin.dto.RoomKindDTO;

public interface AdminService {
	
	// 방 종류 뿌려주기
	public List<RoomKindDTO> roomKind() throws Exception;

} // end interface AdminService
