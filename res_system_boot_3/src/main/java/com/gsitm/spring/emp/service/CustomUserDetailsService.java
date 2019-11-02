package com.gsitm.spring.emp.service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.gsitm.spring.emp.dao.EmpPermRepository;
import com.gsitm.spring.emp.dao.EmpRepository;
import com.gsitm.spring.emp.dao.PasswordRepository;
import com.gsitm.spring.emp.vo.EmpPermVO;
import com.gsitm.spring.emp.vo.EmpVO;
import com.gsitm.spring.emp.vo.PasswordVO;
import com.gsitm.spring.emp.vo.SecurityEmpVO;

/**
 * @programName : CustomUserDetailsService.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private EmpRepository empRepository;
	@Autowired
	private PasswordRepository passwordRepository;
	@Autowired
	private EmpPermRepository empPermRepository;
	
	@Override
	public UserDetails loadUserByUsername(String uid) throws UsernameNotFoundException {
		EmpVO empVO = empRepository.findByEmpId(uid.toUpperCase());
		PasswordVO passwordVO = passwordRepository.findById(empVO.getEmpNo()).get();
		List<EmpPermVO> perms = empPermRepository.findByEmpVO(empVO);
		return new SecurityEmpVO(empVO.getEmpId(), passwordVO.getPwd(), perms);
//		return Optional.ofNullable(empRepository.findByEmpId(uid))
//				.filter(m -> m!= null)
//				.map(m -> new SecurityEmpVO(m)).get();
	}
} 