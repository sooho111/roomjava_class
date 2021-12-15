package com.room.admin.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.room.admin.service.AdminService;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
    @Inject    //서비스를 호출하기 위해서 의존성을 주입
    AdminService adminService;
	
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
	public String writeNoitce() throws Exception {
		return "/admin/notice/noticeList";
	}
	
}
