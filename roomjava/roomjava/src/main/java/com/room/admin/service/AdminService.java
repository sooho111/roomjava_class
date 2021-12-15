package com.room.admin.service;

import java.util.List;



import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;

import com.room.admin.dto.RoomKindDTO;


public interface AdminService {
	
	// 방 종류 뿌려주기
	public List<RoomKindDTO> roomKind() throws Exception;


	public void noticeWrite(BoardDTO boardDTO) throws Exception;
	
	// 게시물 목록 조회
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

} // end interface AdminService
