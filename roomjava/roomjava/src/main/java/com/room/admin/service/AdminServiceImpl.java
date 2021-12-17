package com.room.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.room.admin.dao.AdminDAO;
import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.member.dto.MemberDTO;
import com.room.admin.dto.RoomKindDTO;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Inject
	AdminDAO adminDAO;

	//공지사항 작성
	@Override
	public void noticeWrite(BoardDTO boardDTO) throws Exception {
		
		adminDAO.noticeWrite(boardDTO);
	}
	//공지사항 페이징
	@Override
	public List<BoardDTO> list(SearchCriteria scri) throws Exception {
		
		return adminDAO.list(scri);
	}
	//공지사항 갯수확인
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return adminDAO.listCount(scri);
	} 	
	
	// ----------------------------------------------------------------------------------------------------
	// 방 종류 뿌려주기
	// ----------------------------------------------------------------------------------------------------
	@Override
	public List<RoomKindDTO> roomKind() throws Exception {
		return adminDAO.roomKind();
		
	} // end RoomKindDTO roomKind()
	
	//공지사항 상세페이지
	@Override
	public BoardDTO detailView(int notice_bno) throws Exception {
		
		return adminDAO.detailView(notice_bno);
	}
	
	//공지사항 수정
	@Override
	public void noticeUpdate(BoardDTO boardDTO) throws Exception {
		
		adminDAO.noticeUpdate(boardDTO);
		
	}
	
	//공지사항 삭제
	@Override
	public void noticeDelete(BoardDTO boardDTO) throws Exception {
		
		adminDAO.noticeDelete(boardDTO);
		
	}
	//회원 목록 보기 (Paging 처리)
	@Override
	public List<MemberDTO> memberListPaging(SearchCriteria cri) throws Exception {
		return adminDAO.memberListPaging(cri);
	}

	// 회원 목록 수 구하기 (Paging 처리)
	@Override
	public int memberListTotalCount(SearchCriteria cri) throws Exception {
		return adminDAO.memberListTotalCount(cri);
	}
	
	//회원 번호에 해당하는 상세정보화면

	@Override
	public MemberDTO memberDetail(String m_bno) throws Exception {
		return adminDAO.memberDetail(m_bno);
	}
	

	// 회원 수정
	@Override
	public void memberUpdate(MemberDTO memberDTO) throws Exception {
		adminDAO.memberUpdate(memberDTO);
	}
	
	//회원 삭제
	@Override
	public void memberDelete(String m_bno) throws Exception {
		adminDAO.memberDelete(m_bno);
	}
	//회원 등급 찾기
	@Override
	public int searchM_power(String m_id) throws Exception {
		return adminDAO.searchM_power(m_id);
	}

	
	
	
} // end class AdminServiceImpl implements AdminService
