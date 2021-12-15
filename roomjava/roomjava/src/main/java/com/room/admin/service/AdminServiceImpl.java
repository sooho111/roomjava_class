package com.room.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.room.admin.dao.AdminDAO;
import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.member.dao.MemberDAO;

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
	
	
}
