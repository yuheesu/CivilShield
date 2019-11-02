package com.gsitm.spring.emp.controller;

import java.util.Arrays;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gsitm.spring.emp.dao.EmpPermRepository;
import com.gsitm.spring.emp.dao.EmpRepository;
import com.gsitm.spring.emp.dao.PasswordRepository;
import com.gsitm.spring.emp.vo.EmpPermVO;
import com.gsitm.spring.emp.vo.EmpVO;
import com.gsitm.spring.emp.vo.PasswordVO;

/**
 * @programName : EmpController.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Controller
public class EmpController {
	
	@Autowired
	private EmpRepository empRepository;
	@Autowired
	private PasswordRepository passwordRepository;
	@Autowired
	private EmpPermRepository empPermRepository;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String create(@RequestParam String empid, @RequestParam String password, @RequestParam String empnm, @RequestParam String phonenumber) {
		EmpVO empVO = new EmpVO();
		empVO.setEmpId(empid);

		empVO.setEmpNm(empnm);
		empVO.setPersonalPhone(phonenumber);
		empVO.setHiredate(new Date());
		empVO.setSalary(5000L);
		empRepository.save(empVO);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		PasswordVO passwordVO = new PasswordVO();
		passwordVO.setEmpNo(empVO.getEmpNo());
		passwordVO.setPwd(passwordEncoder.encode(password));
		passwordRepository.save(passwordVO);
		EmpPermVO perm = new EmpPermVO();
		perm.setEmpVO(empVO);
		perm.setPerm("BASIC");
		empPermRepository.save(perm);
//		empVO.setPasswordVO(passwordVO);
//		PasswordVO passwordVO = new PasswordVO();
//		passwordVO.setEmpNo(empVO.getEmpNo());
//		passwordVO.setPwd(password);
//		passwordRepository.save(passwordVO);
		return "redirect:/login/login.do";
	}
	
	@RequestMapping(value="/login/login.do", method=RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value="/login/signup.do", method=RequestMethod.GET)
	public String signup() {
		return "login/signUp";
	}
}