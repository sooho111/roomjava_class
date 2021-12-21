package com.room.main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.room.main.dto.RoomInfraDTO;
import com.room.main.service.MainService;
import com.room.member.dto.MemberDTO;
import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.RoomKindDTO;

import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;
import com.room.admin.service.AdminService;


import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;

import com.room.admin.service.AdminService;



@Controller
@RequestMapping(value="/main")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	MainService mainService;
	
	@Inject
	AdminService adminService;
	
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
	// room_list로 이동
	//------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/roomList")
    public String roomList(String room_bno, Model model) throws Exception {

    	List<RoomKindDTO> roomkindDTO = mainService.getKind();
    	model.addAttribute("kinds", roomkindDTO);
    	
    	if(room_bno == null) {
        	// 방 리스트를 종류대로 뿌려주기
        	List<RoomInfraDTO> roominfraDTO = mainService.allRooms();
        	model.addAttribute("allRooms", roominfraDTO);
        	
    	} else {
    		List<RoomInfraDTO> kindroominfraDTO = mainService.kindRooms(room_bno);
    		RoomKindDTO list = mainService.soKind(room_bno);
        	model.addAttribute("allRooms", kindroominfraDTO);
        	model.addAttribute("list", list);
    	}


    	return "main/roomList";    	
    }
    
    
	//------------------------------------------------------------------------------------------------
	// roomView로 이동
	//------------------------------------------------------------------------------------------------
	@RequestMapping("/roomView")

	public String roomView(@RequestParam("r_bno") int r_bno, Model model, HttpSession session) throws Exception {
		logger.info("동균아!!" + r_bno);
		

		RoomInfraDTO roomInfraDTO = mainService.getRoomView(r_bno);
		List<RoomKindDTO> roomkindDTO = mainService.getKind();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");

		return "main/roomView";
	}
	//------------------------------------------------------------------------------------------------
	// goBook으로 이동
	//------------------------------------------------------------------------------------------------
	@RequestMapping(value="/goBook")
	public String goBook(Model model) throws Exception {
    	
		// 방 기능 가져오기 room_fnc
    	List<Room_fncDTO> room_fncDTO = mainService.getFnc();
    	model.addAttribute("fnc", room_fncDTO);
    	logger.info("방 기능 잘 가져오나요? room_fncDTO => " + room_fncDTO);
    	
    	// 방 렌트할 것 가져오기 roon_rent
       	List<Room_rentDTO> room_rentDTO = mainService.getRent();
    	model.addAttribute("rent", room_rentDTO);
    	logger.info("방 렌트할 것 잘 가져오나요? room_rentDTO => " + room_rentDTO);
    	
    	// 결제수단가져오기 payment
       	List<PaymentDTO> paymentDTO = mainService.getPayment();
    	model.addAttribute("payment", room_rentDTO);
    	logger.info("결제수단 잘 가져오나요? paymentDTO => " + paymentDTO);
    	
		return "main/goBook";
	}
	
	
	
}
//	@RequestMapping(value = "/book_ps")
//	public void book_ps( ) throws Exception {
//	}
//	@RequestMapping("/book_gp")
//	public void book_gp() throws Exception {
//	}
//	@RequestMapping("/book_dk")
//	public void book_dk() throws Exception {
//	}
//	@RequestMapping("/book_kb")
//	public void book_kb() throws Exception {
//	}
	//------------------------------------------------------------------------------------------------
	// 달력에서 "펜션" 예약하기로 가는 페이지 
	//------------------------------------------------------------------------------------------------
	

