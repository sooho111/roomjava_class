package com.room.admin.service;

import java.util.List;



import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.member.dto.MemberDTO;
import com.room.admin.dto.RoomKindDTO;


public interface AdminService {
	
	// 방 종류 뿌려주기
	public List<RoomKindDTO> roomKind() throws Exception;

	// 공지사항 작성
	public void noticeWrite(BoardDTO boardDTO) throws Exception;
	
	// 공지사항 목록 조회
	public List<BoardDTO> list(SearchCriteria scri) throws Exception;

	// 공지사항 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 공지사항 상세보기
	public BoardDTO detailView(int notice_bno) throws Exception;
	
	//공지사항 수정
	public void noticeUpdate(BoardDTO boardDTO) throws Exception;
	
	//공지사항 삭제
	public void noticeDelete(BoardDTO boardDTO) throws Exception;

	// 회원 목록 보기 (Paging 처리)

	public List<MemberDTO> memberListPaging(SearchCriteria cri) throws Exception;

	
	// 회원 목록 수 구하기 (Paging 처리)
	public int memberListTotalCount(SearchCriteria cri) throws Exception;
	
	//회원 번호에 해당하는 상세정보화면
	public MemberDTO memberDetail(String m_bno) throws Exception;
	
	//회원 수정
	public void memberUpdate(MemberDTO memberDTO) throws Exception;
	
	//회원 삭제
	public void memberDelete(String m_bno) throws Exception;
	
	//회원 등급찾기
	public int searchM_power(String m_id)throws Exception;
	

} // end interface AdminService
