package com.gsitm.spring.common.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gsitm.spring.board.BoardType;
import com.gsitm.spring.board.dao.BoardRepository;
import com.gsitm.spring.board.vo.BoardVO;
import com.gsitm.spring.dept.vo.DeptVO;
import com.gsitm.spring.emp.dao.EmpRepository;
import com.gsitm.spring.emp.vo.EmpVO;
import com.gsitm.spring.res.dao.ResEmpRepository;
import com.gsitm.spring.res.dao.ResRepository;
import com.gsitm.spring.res.vo.ResVO;
import com.gsitm.spring.room.vo.RoomVO;

@Controller
public class CommonController {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	@Autowired
	private ResRepository resRepository;
	
	@Autowired
	private EmpRepository empRepository;
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private ResEmpRepository resEmpRepository;
	
	@RequestMapping(value= {"/", "/common/dashboard.do"}, method=RequestMethod.GET)
	public String dashboard(Principal principal, HttpServletRequest request, Model model) {
		EmpVO empVO;
		if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			empVO = empRepository.findByEmpId(principal.getName());
		}
		else {
			return "redirect:/login/login.do";
		}
		if(empVO != null) {
			List<RoomVO> roomList = empVO.getDeptVO().getBldgVO().getRooms();
			
			Calendar calendar = Calendar.getInstance();
			calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), 1, 0, 0, 0);
			Date startDt = calendar.getTime();
			int DayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), DayOfMonth, 23, 59, 59);
			Date endDt = calendar.getTime();
			System.out.println(dateFormat.format(startDt));
			System.out.println(dateFormat.format(endDt));
			for(RoomVO room : roomList) {
				List<ResVO> resList = resRepository.getResThisRoomAndDate(room.getRoomNo(), dateFormat.format(startDt), dateFormat.format(endDt));
				room.setReses(resList);
			}
			model.addAttribute("roomList", roomList);
			List<ResVO> resList = resRepository.findTop3ByEmpVO(empVO, new Sort(Sort.Direction.DESC, "startDt"));
			model.addAttribute("resList", resList);
			List<BoardVO> noticeList = boardRepository.findTop3ByBoardType(BoardType.NOTICE.ordinal(), new Sort(Sort.Direction.DESC, "regDt"));
			model.addAttribute("noticeList", noticeList);
		}
		return "board/dashboard";
	}
}
