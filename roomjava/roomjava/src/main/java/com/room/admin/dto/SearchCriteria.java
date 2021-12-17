package com.room.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchCriteria extends Criteria {

	private String searchType; // 검색 타입
	private String keyword; // 검색 키워드

} // end public class SearchCriteria
