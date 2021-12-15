package com.room.admin.service;

import java.util.List;


import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;

public interface AdminService {

	public void noticeWrite(BoardDTO boardDTO) throws Exception;
	
	// 게시물 목록 조회
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
}
