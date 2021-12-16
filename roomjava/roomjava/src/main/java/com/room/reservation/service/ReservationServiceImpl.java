package com.room.reservation.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.room.member.service.MemberServiceImpl;
import com.room.reservation.dao.ReservationDAO;

@Service
public class ReservationServiceImpl implements ReservationService {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Inject
	ReservationDAO reservationDAO;
	//-------------------------------------------------------------------------------------------------
	//
	//-------------------------------------------------------------------------------------------------
}
