package com.gsitm.spring.emp.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;

/**
 * @programName : SecurityEmpVO.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Getter
@Setter
public class SecurityEmpVO extends User {
	private static final String ROLE_PREFIX = "ROLE_";
	private static final long serialVersionUID = 1L;
	
//	public SecurityEmpVO(EmpVO empVO) {
////		super(empVO.getEmpId(), empVO.getPasswordVO().get(0).getPwd(), makeGrantedAuthority(empVO.getPerms()));
//	}
	
	public SecurityEmpVO(String empid, String pwd, List<EmpPermVO> list) {
		super(empid, pwd, makeGrantedAuthority(list));
	}
	
	private static List<GrantedAuthority> makeGrantedAuthority(List<EmpPermVO> perms){
		List<GrantedAuthority> list = new ArrayList<>();
		perms.forEach(role -> list.add(new SimpleGrantedAuthority(ROLE_PREFIX + role.getPerm())));
		return list;
	}
}