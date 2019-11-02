package com.gsitm.ex01.service;

import java.util.ArrayList;
import java.util.Collection;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.gsitm.ex01.controller.LoginController;
import com.gsitm.ex01.dao.BoardDao;
import com.gsitm.ex01.vo.BoardVO;
import com.gsitm.ex01.vo.LoginVO;

public class LoginService implements UserDetailsService {
	
	@Resource(name="boardDao")
	private BoardDao BoardDao;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("username="+username);
		
//		LoginVO result = BoardDao.login(id);
		
		//validation
//		if (id == null) {
//			throw new UsernameNotFoundException("No user found with username");
//		}
//
//		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
//		
//
//		UserDetails user = new User(result.getId(), result.getPassword(), roles);
//
//		if(user.getAuthorities().equals("ROLE_USER")) {
//			roles.add(new SimpleGrantedAuthority("ROLE_USER"));
//		}
//		
//		return user;
		if (username == null) {
			throw new UsernameNotFoundException("No user found with username");
		}

		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));

		UserDetails user = new User(username, "1234", roles);

		return user;

	}

}