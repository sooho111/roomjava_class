package com.room.admin.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.PageMaker;
import com.room.admin.dto.SearchCriteria;
import com.room.admin.service.AdminService;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
    @Inject    //서비스를 호출하기 위해서 의존성을 주입
    AdminService adminService;
    //--------------------------------------------------------------------------------------------------
    // 관리자페이지 get
    //--------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/adminMain", method = RequestMethod.GET)
    public String adminMain() throws Exception {
    	return "/admin/adminMain";
    }
	
	// -------------------------------------------------------------------------------------------------
	// 공지사항 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/notice/noticeInsert", method = RequestMethod.GET)
	public String getNotice() throws Exception {
		return "/admin/notice/noticeInsert";
	}
	// -------------------------------------------------------------------------------------------------
	// 공지사항 POST
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/notice/noticeInsert", method = RequestMethod.POST)
	public String writeNoitce(BoardDTO boardDTO) throws Exception {
		
		adminService.noticeWrite(boardDTO);
		
		return "/admin/noticeList";
	}
	// -------------------------------------------------------------------------------------------------
	// 공지사항 list 페이징
	// -------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/notice/noticeList", method = RequestMethod.GET)
		public String noticeList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
			logger.info("noticeList");
			
			model.addAttribute("list", adminService.list(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(adminService.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/notice/noticeList";
		}
}
