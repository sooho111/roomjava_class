package com.room.admin.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		
	//-------------------------------------------------------------------------------------------------------
	//공지사항 상세페이지	
	//-------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/notice/noticeDetail", method = RequestMethod.GET)
		public String noticeDetail( Model model, @RequestParam("n") int notice_bno, BoardDTO boardDTO) throws Exception {
		
		logger.info("noticeDetail");
		
		boardDTO.setNotice_bno(notice_bno);
		model.addAttribute("detail", adminService.detailView(boardDTO.getNotice_bno()));
		
		return "admin/notice/noticeDetail";
		
		}
	//-------------------------------------------------------------------------------------------------------
	//공지사항 수정 GET	
	//-------------------------------------------------------------------------------------------------------		
		@RequestMapping(value = "/notice/noticeUpdate", method = RequestMethod.GET)
		public String noticeUpdateView(@RequestParam("n") int notice_bno, BoardDTO boardDTO, Model model) throws Exception {
			logger.info("noticeUpdateView");
			
			boardDTO.setNotice_bno(notice_bno);
			model.addAttribute("update", adminService.detailView(boardDTO.getNotice_bno()));
			
			
			return "admin/notice/noticeUpdate";
		}
		//-------------------------------------------------------------------------------------------------------
		//공지사항 수정 POST	
		//-------------------------------------------------------------------------------------------------------		
		@RequestMapping(value = "/notice/noticeUpdate", method = RequestMethod.POST)
		public String noticeUpdate(@RequestParam("n") int notice_bno, BoardDTO boardDTO, Model model) throws Exception {
			logger.info("noticeUpdate");
			
			boardDTO.setNotice_bno(notice_bno);
			
			adminService.noticeUpdate(boardDTO);
			
			return "redirect:/admin/notice/noticeList";
		}
		
		//-------------------------------------------------------------------------------------------------------
		//공지사항 삭제 GET	
		//-------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/notice/noticeDelete", method = RequestMethod.GET)
		public String noticeDelete(@RequestParam("n") int notice_bno, BoardDTO boardDTO, Model model) throws Exception {
			logger.info("noticeDelete");
			
			boardDTO.setNotice_bno(notice_bno);
			
			adminService.noticeDelete(boardDTO);
			
			return "redirect:/admin/notice/noticeList";
		}
}
