package com.gsitm.spring;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gsitm.spring.emp.dao.EmpRepository;
import com.gsitm.spring.emp.dao.PasswordRepository;
import com.gsitm.spring.emp.vo.EmpVO;
import com.gsitm.spring.emp.vo.PasswordVO;

/**
 * @programName : DefaultSetController.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Controller
public class DefaultSetController {
	@Autowired
	private PasswordRepository passwordRepository;
	
	@Autowired
	private EmpRepository empRepository;
	
	@ResponseBody @GetMapping("/init.do")
	public String dept() {
		List<EmpVO> list = empRepository.findAll();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		List<PasswordVO> pwdList = new ArrayList<PasswordVO>();
		for(int i = 0; i < list.size(); i++) {
			PasswordVO passwordVO = new PasswordVO();
			passwordVO.setEmpNo(list.get(i).getEmpNo());
			passwordVO.setPwd(passwordEncoder.encode("1111"));
			pwdList.add(passwordVO);
		}
		passwordRepository.saveAll(pwdList);
		
		return "{\"status\":200}";
	}
}
