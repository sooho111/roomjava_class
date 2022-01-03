package com.room.main.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.room.main.dto.BookDTO;
import com.room.main.dto.RoomInfraDTO;
import com.room.main.service.MainService;
import com.room.member.dto.MemberDTO;
import com.room.member.service.MemberService;
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
	
	@Inject
	MemberService memberSerivce;
	
	@RequestMapping("/0")
	public void infra() throws Exception {
	}
	@RequestMapping("/1")
	public void ps( ) throws Exception {
	}
	@RequestMapping("/2")
	public void kb() throws Exception {
	}
	@RequestMapping("/3")
	public void dk() throws Exception {
	}
	@RequestMapping("/4")
	public void kbgp() throws Exception {
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
    public String roomList(String room_bno, Model model, BookDTO bookDTO) throws Exception {
	
    	if(room_bno == null) { // (예약된 날 제외)방 리스트를 종류대로 뿌려주기
        	List<RoomInfraDTO> roominfraDTO = mainService.allRooms();
        	List<RoomKindDTO> roomkindDTO = mainService.getKind();
        	model.addAttribute("allRooms", roominfraDTO);
        	model.addAttribute("kinds", roomkindDTO);
        	
    	} else { // 방 리스트를 종류대로 뿌려주기
    		List<RoomInfraDTO> kindroominfraDTO = mainService.kindRooms(room_bno);
    		RoomKindDTO list = mainService.soKind(room_bno);
    		List<RoomKindDTO> roomkindDTO = mainService.getKind();
        	model.addAttribute("allRooms", kindroominfraDTO);
        	model.addAttribute("kinds", roomkindDTO);
        	model.addAttribute("list", list);
    	}
    	
		return "main/roomList";    	
		
    } // end String roomList(String room_bno, Model model, BookDTO bookDTO)
    
	//------------------------------------------------------------------------------------------------
	// roomView로 이동
	//------------------------------------------------------------------------------------------------
	@RequestMapping("/roomView")
	public String roomView(Model model, HttpSession session, BookDTO bookDTO) throws Exception {

		RoomInfraDTO roomInfraDTO = mainService.getRoomView(bookDTO.getR_bno());
		List<RoomKindDTO> roomkindDTO = mainService.getKind();
		// MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		
		cal.setTime(sdformat.parse(bookDTO.getEnd_date()));
		cal.add(Calendar.DATE, +1);
		
		bookDTO.setEnd_date(sdformat.format(cal.getTime()));
		
		model.addAttribute("room", roomInfraDTO);
		model.addAttribute("kinds", roomkindDTO);
		model.addAttribute("start_date", bookDTO.getStart_date());
		model.addAttribute("end_date", bookDTO.getEnd_date());
		
		return "main/roomView";
	}
	
	//------------------------------------------------------------------------------------------------
	// roomView에서 goBook으로 이동 (postBook)
	//------------------------------------------------------------------------------------------------
	@RequestMapping(value="/goBook", method=RequestMethod.POST)
	public String postBook(@RequestParam("r_bno") int r_bno, BookDTO bookDTO, Model model, HttpSession session) throws Exception {

		// 회원정보 가져오기
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
				
		if(memberDTO == null) {
			// 방 기능 가져오기 room_fnc
	    	List<Room_fncDTO> room_fncDTO = mainService.getFnc();
	    	model.addAttribute("fnc", room_fncDTO);
	    	
	    	// 방 렌트할 것 가져오기 roon_rent
	       	List<Room_rentDTO> room_rentDTO = mainService.getRent();
	    	model.addAttribute("rent", room_rentDTO);
	    	
	    	// 결제수단가져오기 payment
	       	List<PaymentDTO> paymentDTO = mainService.getPayment();
	    	model.addAttribute("payment", paymentDTO);
	    	
	    	// 방 가져오기
			RoomInfraDTO roomInfraDTO = mainService.getRoomView(r_bno);
			model.addAttribute("room", roomInfraDTO);
			
			// 방 종류가져오기
			List<RoomKindDTO> roomkindDTO = mainService.getKind();
			model.addAttribute("kinds", roomkindDTO);
			
			// 시작, 끝 날짜 담아주기
			model.addAttribute("start_date", bookDTO.getStart_date());
			model.addAttribute("end_date", bookDTO.getEnd_date());

			return "main/goBook";
			
		} else {
			MemberDTO member = memberSerivce.view(memberDTO.getM_id());
			model.addAttribute("member", member);
		}
    	
		// 방 기능 가져오기 room_fnc
    	List<Room_fncDTO> room_fncDTO = mainService.getFnc();
    	model.addAttribute("fnc", room_fncDTO);
    	
    	// 방 렌트할 것 가져오기 roon_rent
       	List<Room_rentDTO> room_rentDTO = mainService.getRent();
    	model.addAttribute("rent", room_rentDTO);
    	
    	// 결제수단가져오기 payment
       	List<PaymentDTO> paymentDTO = mainService.getPayment();
    	model.addAttribute("payment", paymentDTO);
    	
    	// 방 가져오기
		RoomInfraDTO roomInfraDTO = mainService.getRoomView(r_bno);
		model.addAttribute("room", roomInfraDTO);
		
		// 방 종류가져오기
		List<RoomKindDTO> roomkindDTO = mainService.getKind();
		model.addAttribute("kinds", roomkindDTO);
		
		// 시작, 끝 날짜 담아주기
		model.addAttribute("start_date", bookDTO.getStart_date());
		model.addAttribute("end_date", bookDTO.getEnd_date());
		
		return "main/goBook";
	}
	
	//------------------------------------------------------------------------------------------------
	// 예약날 중복 불가
	//------------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping("/haveBookDay")
	public int haveBookDay(BookDTO bookDTO) throws Exception {
		int result = mainService.haveBookDay(bookDTO);
		return result;

	} // end int haveBookDay(BookDTO bookDTO)
	
/*
	//------------------------------------------------------------------------------------------------
	// 예약하기 누르면 book테이블에 담아주는거 getBook, 여기가 get인가요 죄성해여
	//------------------------------------------------------------------------------------------------
	@RequestMapping(value="/goBook", method=RequestMethod.GET)
	public String getBook(@RequestParam("r_bno") int r_bno, BookDTO bookDTO, Model model, HttpSession session) throws Exception {


		//-------------------------------------------------------------------------------------------------
		// book_order 예약번호 만드는 메서드
		//-------------------------------------------------------------------------------------------------
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
      
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		String book_order = ymd + "_" + subNum;
		bookDTO.setBook_order(book_order);
		
		logger.info("예약번호 만들어지나요" + book_order);
		
		//-------------------------------------------------------------------------------------------------
		// book테이블에 예약정보 담기
		//-------------------------------------------------------------------------------------------------
		mainService.insertBook(bookDTO);
		
		
		
		return "/main/goBook";
	}
	 */	
	
	//------------------------------------------------------------------------------------------------
	// 예약하기 DB에 정보 담기
	//------------------------------------------------------------------------------------------------
	@RequestMapping(value="/okBook", method=RequestMethod.POST)
	public String okBook(BookDTO bookDTO, HttpSession session) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
      
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		String book_order = ymd + "_" + subNum;
		bookDTO.setBook_order(book_order);
		
		if(memberDTO == null) {
			mainService.insertBmemBook(bookDTO);
		} else {
			mainService.insertBook(bookDTO);
		}
		
		return "/main/okBook";
		
	} // end String okBook() throws Exception	

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
	

