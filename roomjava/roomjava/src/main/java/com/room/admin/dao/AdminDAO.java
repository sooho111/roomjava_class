package com.room.admin.dao;

import java.util.List;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;

public interface AdminDAO {
	// 게시글 작성
	public void noticeWrite(BoardDTO boardDTO) throws Exception;
	
	// 게시물 목록 조회
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

}
