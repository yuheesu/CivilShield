package com.gsitm.spring.dept.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gsitm.spring.co.bldg.dao.BldgRepository;
import com.gsitm.spring.co.dao.CoRepository;
import com.gsitm.spring.co.vo.CoVO;
import com.gsitm.spring.dept.dao.DeptBudgetRepository;
import com.gsitm.spring.dept.dao.DeptRepository;
import com.gsitm.spring.dept.vo.DeptBudgetVO;
import com.gsitm.spring.dept.vo.DeptVO;
import com.gsitm.spring.emp.dao.EmpRepository;
import com.gsitm.spring.emp.dao.PasswordRepository;
import com.gsitm.spring.res.dao.ResRepository;
import com.gsitm.spring.res.vo.ResVO;

/**
 * @programName : DeptController.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 유희수       2018.06.12  부서별예산
 */ 
@Controller
public class DeptController {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    
	@Autowired
	private DeptBudgetRepository deptBudgetRepository;
	
	@RequestMapping(value="/dept/deptBudget.do", method=RequestMethod.GET)
	public String deptBudget(Model model) throws ParseException {
		
		List<DeptBudgetVO> budgetList = new ArrayList<>();
		budgetList = deptBudgetRepository.findAll();
		
		for(int i = 0; i < budgetList.size(); i++) {
			Date procDate = dateFormat.parse(dateFormat.format(budgetList.get(i).getProcDt()));
			budgetList.get(i).setProcDt(procDate);
			budgetList.get(i).getDeptVO();
		}
		
		model.addAttribute("budgetList", budgetList);

		return "/dept/deptBudget";
	}
}
