package com.room.main.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.room.main.dao.MainDAO;

@Service
public class MainServiceImpl implements MainService {

	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);
	
	@Inject
	MainDAO mainDAO;
	//-------------------------------------------------------------------------------------------------
	//
	//-------------------------------------------------------------------------------------------------
}
