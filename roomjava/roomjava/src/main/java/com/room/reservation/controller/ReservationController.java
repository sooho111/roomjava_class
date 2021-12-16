package com.room.reservation.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.room.member.controller.MemberController;
import com.room.reservation.service.ReservationService;

@Controller
@RequestMapping(value = "/reservation")
public class ReservationController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	ReservationService reservationService;
	
	//------------------------------------------------------------------------------------------------
	// 달력으로 이동
	//------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/calen", method = RequestMethod.GET)
    public String adminMain() throws Exception {
    	return "/reservation/calen";
    }
	
}
