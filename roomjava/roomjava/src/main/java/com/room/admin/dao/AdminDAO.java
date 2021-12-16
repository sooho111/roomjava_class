package com.room.admin.dao;

import java.util.List;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;

import com.room.admin.dto.RoomKindDTO;

public interface AdminDAO {
	// 게시글 작성
	public void noticeWrite(BoardDTO boardDTO) throws Exception;
	
	// 게시물 목록 조회
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	// 방 종류 뿌려주기
	public List<RoomKindDTO> roomKind() throws Exception;
	
	//공지사항 상세페이지
	public BoardDTO detailView(int notice_bno) throws Exception;
	
	//공지사항 수정
	public void noticeUpdate(BoardDTO boardDTO) throws Exception;
	
} // end interface AdminDAO
