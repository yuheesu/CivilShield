package com.gsitm.spring.co.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gsitm.spring.co.bldg.dao.BldgRepository;
import com.gsitm.spring.co.bldg.vo.BldgVO;
import com.gsitm.spring.co.dao.CoRepository;
import com.gsitm.spring.co.vo.CoVO;

/**
 * @programName : CoController.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Controller
public class CoController {
	@Autowired
	private CoRepository coRepository;
	
	@Autowired
	private BldgRepository bldgRepository;
	
	@GetMapping("/company.do")
	public String insertCo() {
		CoVO coVO = new CoVO();
		
		coVO.setCoNm("GS ITM");		// 근무지명 입력 값
		//coVO = coRepository.save(coVO);
		coVO = coRepository.saveAndFlush(coVO);
		System.out.println(coVO.toString());

		BldgVO bldgVO = new BldgVO();
		bldgVO.setBldgNm("GS ITM 재동 본사");	// 근무지 건물명 입력 값
		bldgVO.setLatitude(127.123456);		// 근무지 건물 위도 입력 값
		bldgVO.setLongitude(36.123456);		// 근무지 건물 경도 입력 값
		
		bldgRepository.save(bldgVO);
		System.out.println(bldgVO.toString());
		
		return "/board/index";
	}
}
