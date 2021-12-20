package com.room.main.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.room.main.service.MainService;

@Controller
@RequestMapping(value="/main")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	MainService mainService;
	
	@RequestMapping("/1")
	public void ps() throws Exception {
	}
	@RequestMapping("/2")
	public void gp() throws Exception {
	}
	@RequestMapping("/3")
	public void dk() throws Exception {
	}
	@RequestMapping("/4")
	public void kb() throws Exception {
	}

	//------------------------------------------------------------------------------------------------
	// 소개 이동
	//------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/introduce", method = RequestMethod.GET)
    public String goIntroduce() throws Exception {
    	return "/main/introduce";
    }
	//------------------------------------------------------------------------------------------------
	// 달력으로 이동
	//------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/calen", method = RequestMethod.GET)
    public String goCalen() throws Exception {
    	return "/main/calen";
    }
	
	//------------------------------------------------------------------------------------------------
	// 달력에서 "펜션" 예약하기로 가는 페이지 
	//------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/book_ps", method=RequestMethod.GET)
	public String book_ps( ) throws Exception {
		
		
		
	return "/main/book_complete";	
	}
	
	@RequestMapping("/book_gp")
	public void book_gp() throws Exception {
	}
	@RequestMapping("/book_dk")
	public void book_dk() throws Exception {
	}
	@RequestMapping("/book_kb")
	public void book_kb() throws Exception {
	}
	
}
