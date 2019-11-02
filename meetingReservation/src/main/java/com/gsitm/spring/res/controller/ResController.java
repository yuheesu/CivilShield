package com.gsitm.spring.res.controller;

import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.data.domain.Sort;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.gsitm.spring.board.BoardType;
import com.gsitm.spring.board.vo.BoardVO;
import com.gsitm.spring.co.bldg.dao.BldgRepository;
import com.gsitm.spring.co.bldg.vo.BldgVO;
import com.gsitm.spring.common.GenericClass;
import com.gsitm.spring.common.Reservation;
import com.gsitm.spring.dept.BudgetType;
import com.gsitm.spring.dept.dao.DeptBudgetRepository;
import com.gsitm.spring.dept.dao.DeptRepository;
import com.gsitm.spring.dept.vo.DeptBudgetVO;
import com.gsitm.spring.dept.vo.DeptVO;
import com.gsitm.spring.email.EmailType;
import com.gsitm.spring.email.NotificationService;
import com.gsitm.spring.email.dao.EmailRepository;
import com.gsitm.spring.email.vo.EmailVO;
import com.gsitm.spring.emp.dao.EmpPermRepository;
import com.gsitm.spring.emp.dao.EmpRepository;
import com.gsitm.spring.emp.vo.EmpPermVO;
import com.gsitm.spring.emp.vo.EmpVO;
import com.gsitm.spring.item.dao.ItemRepository;
import com.gsitm.spring.item.vo.ItemVO;
import com.gsitm.spring.res.ResDate;
import com.gsitm.spring.res.ResState;
import com.gsitm.spring.res.dao.ResEmpRepository;
import com.gsitm.spring.res.dao.ResItemRepository;
import com.gsitm.spring.res.dao.ResRepository;
import com.gsitm.spring.res.vo.ResEmpVO;
import com.gsitm.spring.res.vo.ResItemVO;
import com.gsitm.spring.res.vo.ResVO;
import com.gsitm.spring.room.RoomType;
import com.gsitm.spring.room.dao.RoomRepository;
import com.gsitm.spring.room.vo.RoomVO;


/**
 * @programName : DefaultSetController.java
 * @author      : 유희수
 * @date        : 2018. 6. 11. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 유희수	   2018 06.12 예약안내,예약히스토리,내예약현황조회
 * 차주현 2018.06.17 내 예약현황조회 구현
 * 차주현 2018.06.18 전체예약현황조회 구현
 */ 

@Controller
public class ResController {

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private static final SimpleDateFormat dateMinFormat = new SimpleDateFormat("yyyyMMddHHmm");
    
	@Autowired
	private ResRepository resRepository;
	
	@Autowired
	private ResItemRepository resItemRepository;
	
	@Autowired
	private ResEmpRepository resEmpRepository;
	
	@Autowired
	private DeptRepository deptRepository;
	
	@Autowired
	private DeptBudgetRepository deptBudgetRepository;
	
	@Autowired
	private EmpRepository empRepository;
	
	@Autowired
	private BldgRepository bldgRepository;
	
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private ItemRepository itemRepository;

	@Autowired
	private EmailRepository emailRepository;

	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private EmpPermRepository empPermRepository;
	
	public boolean dataValidator(String data) throws JsonParseException, IOException {
		// ajax 데이터 검증
		ObjectMapper mapper = new ObjectMapper();
		JsonFactory factory = mapper.getFactory();
		JsonParser parser = factory.createParser(data);
		JsonNode node = mapper.readTree(parser);
		Iterator<Entry<String, JsonNode>> fields = node.fields();
		
		boolean existEmpDept = false;
		boolean result = true;
		while(fields.hasNext()) {
			Entry<String, JsonNode> entry = fields.next();
			String key = entry.getKey();
			switch(key) {
			case "emp":
			case "dept":
				if(entry.getValue().size() > 0) {
					existEmpDept = true;
				}
				break;
			case "bldg":
			case "room":
			case "date":
				if(entry.getValue().size() <= 0) {
					result = false;
				}
				break;
			}
		}
		return (existEmpDept && result);
	}
	
	public boolean resValidator(Reservation res) {		
		BldgVO bldgVO = res.getBldgVO();
		RoomVO roomVO = res.getRoomVO();
		List<ResDate> resList = res.getResDateList();
		for(int i = 0; i < resList.size(); i++) {
			ResDate date = resList.get(i);
			Long result = resRepository.getResThisRoomAndDateMinutesExists(roomVO.getRoomNo(), dateMinFormat.format(date.getStartDt()), dateMinFormat.format(date.getEndDt()));
			if(result != null && result > 0) {
				System.out.println("겹치는 날짜 존재: Long is " + result);
				return false;
			}
		}
		return true;
	}
	
	@Transactional
	@RequestMapping(value="/res/reservation.do", method=RequestMethod.POST)
	@ResponseBody public String doReservation(Principal principal, String data) throws JsonParseException, IOException, InstantiationException, IllegalAccessException, ParseException, MailException, MessagingException  {
		if(dataValidator(data)) {
			Reservation res = new Reservation(data);
			if(resValidator(res)) {
				EmpVO[] empList = res.getEmpList();
				DeptVO[] deptList = res.getDeptList();
				Map<Long, EmpVO> map = new HashMap<Long, EmpVO>();
				for(int i = 0; i < empList.length; i++) {
					map.put(empList[i].getEmpNo(), empList[i]);
				}
				for(int i = 0; i < deptList.length; i++) {
					List<EmpVO> list = empRepository.getEmpsByDeptNo(deptList[i].getDeptNo());
					//부서별 사원 null
					for(int j = 0; j < list.size(); j++) {
						map.put(list.get(j).getEmpNo(), list.get(j));
					}
				}
				res.setEmpList(map.values().toArray(new EmpVO[0]));
				
				//데이터 넣기
				RoomVO roomVO = roomRepository.getOne(res.getRoomVO().getRoomNo());
				EmpVO empVO;
				if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
					empVO = empRepository.findByEmpId(principal.getName());
				}
				else {
					return "{\"status\":401}";
				}
				
				ResState state;
				List<ResDate> dateList = res.getResDateList();
				if(roomVO.getRoomType() == RoomType.ConferenceRoom.ordinal() && dateList.get(0).getDiffDays() <= 0) {
					//회의실 단기
					state = ResState.ApvWaitRmMgr;
				}
				else {
					//회의실 장기 OR 교육실
					state = ResState.ApvWaitDeptHead;
				}
				
				Date startDt = dateList.get(0).getStartDt();
				Date endDt = dateList.get(0).getEndDt();
				Long diff30Minutes = (endDt.getTime() - startDt.getTime()) / (1000 * 60 * 30);
				int diffDays = (int) Math.floor((endDt.getTime() - startDt.getTime()) / (1000 * 60 * 60 * 24));
				Long totalCost = (long) Math.floor((diff30Minutes - (diffDays * 8 * 2)) * (roomVO.getCostPerHour() / 2));
				//요금 계산
				ItemVO[] selectItems = res.getItemList();
				ItemVO[] items = roomVO.getItems().toArray(new ItemVO[0]);
				for(int i = 0; i < selectItems.length; i++) {
					ItemVO selectItem = selectItems[i];
					for(int j = 0; j < items.length; j++) {
						ItemVO item = items[j];
						if(item.getItemNo().longValue() == selectItem.getItemNo().longValue()) {
							totalCost += item.getUseCost();
							break;
						}
					}
				}
				
				EmpVO[] emps = res.getEmpList();
				for(int i = 0; i < dateList.size(); i++) {
					//일괄처리
					ResVO resVO = new ResVO();
					resVO.setEmpVO(empVO);
					resVO.setRoomVO(res.getRoomVO());
					resVO.setResState(state.ordinal());
					resVO.setTotalCost(totalCost);
					resVO.setStartDt(dateList.get(i).getStartDt());
					resVO.setEndDt(dateList.get(i).getEndDt());
					resRepository.save(resVO);
					List<ResItemVO> resItemList = new ArrayList<ResItemVO>();
					for(int j = 0; j < selectItems.length; j++) {
						//예약물품 등록
						ResItemVO resItemVO = new ResItemVO();
						resItemVO.setResVO(resVO);
						resItemVO.setItemVO(selectItems[j]);
						resItemList.add(resItemVO);
					}
					resItemRepository.saveAll(resItemList);
					List<ResEmpVO> resEmpList = new ArrayList<ResEmpVO>();
					for(int j = 0; j < emps.length; j++) {
						ResEmpVO resEmpVO = new ResEmpVO();
						resEmpVO.setResVO(resVO);
						resEmpVO.setEmpVO(emps[j]);
						if(emps[j].getDeptVO() != null) {
							resEmpVO.setDeptVO(emps[j].getDeptVO());
						}
						else {
							DeptVO deptVO = new DeptVO();
							deptVO.setDeptNo(empRepository.getDeptNoByEmpNo(emps[j].getEmpNo()));
							resEmpVO.setDeptVO(deptVO);
						}
						resEmpList.add(resEmpVO);
					}
					resEmpRepository.saveAll(resEmpList);
					//예약금 차감
					DeptVO deptVO = empVO.getDeptVO();
					deptVO.setDeptBudget(deptVO.getDeptBudget() - 1000);
					deptRepository.save(deptVO);
					DeptBudgetVO budget = new DeptBudgetVO();
					budget.setBudgetType(BudgetType.Outgoing.ordinal());
					budget.setOutgoing(1000L);
					budget.setIncoming(deptVO.getDeptBudget());
					budget.setDeptVO(deptVO);
					budget.setEmpVO(empVO);
					budget.setProcDiv("주내역 > 예약금 차감");
					budget.setHistory(resVO.getResNo() + "번 예약 예약금 차감");
					deptBudgetRepository.save(budget);
					//이메일 발송
					EmailVO emailVO = emailRepository.findById(new Long(EmailType.Approval.ordinal())).get();
					if(state == ResState.ApvWaitDeptHead) {
						//교육실 단/장기, 회의실 장기
						String emailTo = empVO.getDeptVO().getMgrVO().getEmailAddr();
						notificationService.sendEmail(empVO.getEmailAddr(), emailTo, emailVO.getSubject(), emailVO.getContent());
					}
					else if(state == ResState.ApvWaitRmMgr) {
						//회의실 단기
						List<EmpPermVO> list = empPermRepository.findByPerm("ADMIN");
						for(int j = 0; j < list.size(); j++) {
							EmpPermVO perm = list.get(j);
							String emailTo = perm.getEmpVO().getEmailAddr();
							if(emailTo != null && emailTo.length() > 0) {
								notificationService.sendEmail(empVO.getEmailAddr(), emailTo, emailVO.getSubject(), emailVO.getContent());
							}
						}
					}
				}
			}
			else {
				//resVal false
				return "{\"status\":401}";
			}
		}

		return "{\"status\":200}";
	}
	
	@RequestMapping(value="/res/reservation.do", method=RequestMethod.GET)
	public String resCalendar(Principal principal) {
		EmpVO empVO;
		if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			empVO = empRepository.findByEmpId(principal.getName());
			String email = empVO.getEmailAddr();
			if(email == null || email.length() == 0) {
				return "redirect:/board/mypage.do";
			}
		}
		else {
			return "logout";
		}
		return "res/reservation";
	}
	
	@RequestMapping(value="/res/detail.do", method=RequestMethod.GET)
	public String resDetail(Model model) {
		return "res/detail";
    }
	
	@Transactional
	@RequestMapping(value="/res/detailModify.do", method=RequestMethod.POST)
	@ResponseBody public String updateReservation(HttpServletRequest request, String data, String resNum) throws JsonParseException, InstantiationException, IllegalAccessException, IOException, ParseException {
		Reservation res = new Reservation(data);
		if(resValidator(res)) {
			//데이터 넣기
			Long resNo = Long.valueOf(resNum);
			ResVO resVO = resRepository.findById(resNo).get();
			
			ResState state;
			if(resVO.getRoomVO().getRoomType() == RoomType.ConferenceRoom.ordinal() 
					&& Math.round((resVO.getEndDt().getTime() - resVO.getStartDt().getTime()) / (1000 * 60 * 60 * 24)) <= 0) {
				//회의실 단기
				state = ResState.ApvWaitRmMgr;
			}
			else {
				//회의실 장기 OR 교육실
				state = ResState.ApvWaitDeptHead;
			}
			if((state == ResState.ApvWaitDeptHead && resVO.getResState() == ResState.ApvWaitDeptHead.ordinal())
					|| (state == ResState.ApvWaitRmMgr && resVO.getResState() == ResState.ApvWaitRmMgr.ordinal())) {
				//요금 계산
				Date startDt = resVO.getStartDt();
				Date endDt = resVO.getEndDt();
				
				Long diff30Minutes = (endDt.getTime() - startDt.getTime()) / (1000 * 60 * 30);
				int diffDays = (int) Math.floor((endDt.getTime() - startDt.getTime()) / (1000 * 60 * 60 * 24));
				Long totalCost = (long) Math.floor((diff30Minutes - (diffDays * 8 * 2)) * (resVO.getRoomVO().getCostPerHour() / 2));
				
				ItemVO[] selectItems = res.getItemList();
				ItemVO[] items = resVO.getRoomVO().getItems().toArray(new ItemVO[0]);
				for(int i = 0; i < selectItems.length; i++) {
					ItemVO selectItem = selectItems[i];
					for(int j = 0; j < items.length; j++) {
						ItemVO item = items[j];
						if(item.getItemNo().longValue() == selectItem.getItemNo().longValue()) {
							totalCost += item.getUseCost();
							break;
						}
					}
				}
				resItemRepository.deleteByResVO(resVO);
				
				List<ResItemVO> resItemList = new ArrayList<ResItemVO>();
				for(int j = 0; j < selectItems.length; j++) {
					//예약물품 등록
					ResItemVO resItemVO = new ResItemVO();
					resItemVO.setResVO(resVO);
					resItemVO.setItemVO(selectItems[j]);
					resItemList.add(resItemVO);
				}
				resItemRepository.saveAll(resItemList);
				
				resVO.setTotalCost(totalCost);
				resRepository.save(resVO);
				return "{\"status\":200}";
			}
		}
		return "{\"status\":401}";
    }
	
	@RequestMapping(value="/res/detailModify.do", method=RequestMethod.GET)
	public ModelAndView resDetailModify(Principal principal, HttpServletRequest request, ModelAndView model) {
		EmpVO empVO;
		if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			empVO = empRepository.findByEmpId(principal.getName());
		}
		else {
			model.setViewName("board/dashboard");
			return model;
		}
		String resNo = request.getParameter("resNo");
		ResVO resVO = resRepository.findById(Long.valueOf(resNo)).get();
		
		ResState state;
		if(resVO.getRoomVO().getRoomType() == RoomType.ConferenceRoom.ordinal() 
				&& Math.round((resVO.getEndDt().getTime() - resVO.getStartDt().getTime()) / (1000 * 60 * 60 * 24)) <= 0) {
			//회의실 단기
			state = ResState.ApvWaitRmMgr;
		}
		else {
			//회의실 장기 OR 교육실
			state = ResState.ApvWaitDeptHead;
		}
		if((state == ResState.ApvWaitDeptHead && resVO.getResState() == ResState.ApvWaitDeptHead.ordinal())
				|| (state == ResState.ApvWaitRmMgr && resVO.getResState() == ResState.ApvWaitRmMgr.ordinal())) {
			if(empVO.getEmpNo() == resVO.getEmpVO().getEmpNo()) {
				model.addObject("canUpdate", Boolean.TRUE);
			}
			else {
				model.addObject("canUpdate", Boolean.FALSE);
			}
		}
		else {
			model.addObject("canUpdate", Boolean.FALSE);
		}
		
		List<ResItemVO> itemList = resVO.getItems();
		List<ItemVO> items = new ArrayList<ItemVO>();
		for(int i = 0; i < itemList.size(); i++) {
			items.add(itemList.get(i).getItemVO());
		}
		RoomVO roomVO = resVO.getRoomVO();
		BldgVO bldgVO = roomVO.getBldgVO();
		model.addObject("res", resVO);
		model.addObject("resItems", items);
		model.addObject("room", roomVO);
		model.addObject("bldg", bldgVO);
		
		model.setViewName("res/detailModify");
		return model;
    }
	
	@RequestMapping(value="/res/resDelete.do", method=RequestMethod.GET)
	@ResponseBody public String resDelete(Principal principal, HttpServletRequest request) {
		EmpVO empVO;
		if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			empVO = empRepository.findByEmpId(principal.getName());
		}
		else {
			return "{\"status\":401}";
		}
		String resNo = request.getParameter("resNo");
		if(resNo != null && resNo.length() > 0) {
			ResVO resVO = resRepository.findById(Long.valueOf(resNo)).get();
			if(resVO.getEmpVO().getEmpNo().longValue() == empVO.getEmpNo().longValue()) {
				resItemRepository.deleteByResVO(resVO);
				resEmpRepository.deleteByResVO(resVO);
				resRepository.deleteById(resVO.getResNo());
				//TODO 취소 이메일 보내기?
			}
			else {
				return "{\"status\":401}";
			}
		}
		else {
			return "{\"status\":401}";
		}
		return "{\"status\":200}";
	}
	
	@RequestMapping(value="/res/empSearch.do", method=RequestMethod.GET, produces = "text/plain; charset=utf8")
	@ResponseBody public String resEmpSearch(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		response.setCharacterEncoding("utf-8");
		
		String searchText = request.getParameter("searchText");
		searchText = "%" + searchText + "%";
		List<DeptVO> deptList = deptRepository.findByDeptNmLike(searchText);
		
		List<HashMap> list = new ArrayList<HashMap>();
		for(DeptVO deptVO : deptList) {
            HashMap<String, String> map = new HashMap<>();
			map.put("deptNo", String.valueOf(deptVO.getDeptNo()));
			map.put("deptNm", deptVO.getDeptNm());

			List<EmpVO> empList = deptVO.getEmps();
			List<String> empStringList = new ArrayList<String>();
			for(EmpVO empVO : empList) {
				HashMap<String, String> empMap = new HashMap<>();
				empMap.put("empNo", String.valueOf(empVO.getEmpNo()));
				empMap.put("empNm", empVO.getEmpNm());
//				empMap.put("deptNo", String.valueOf(deptVO.getDeptNo()));
				empStringList.add(new JSONObject(empMap).toString());
			}
			map.put("empList", Arrays.toString(empStringList.toArray(new String[0])));
			list.add(map);
		}
		String dept = new ObjectMapper().writeValueAsString(list);
		dept = dept.replaceAll("\\\\", "");
		dept = dept.replaceAll("\"\\[", "[");
		dept = dept.replaceAll("\\]\"", "]");
		
		list.clear();
		List<EmpVO> empList = empRepository.findByEmpNmLike(searchText);
		for(EmpVO empVO : empList) {
            HashMap<String, String> map = new HashMap<>();
			map.put("empNo", String.valueOf(empVO.getEmpNo()));
			map.put("empNm", empVO.getEmpNm());
			map.put("deptNo", String.valueOf(empVO.getDeptVO().getDeptNo()));
			map.put("deptNm", empVO.getDeptVO().getDeptNm());
			list.add(map);
		}
		String emp = new ObjectMapper().writeValueAsString(list);
		emp = emp.replaceAll("\\\\", "");
		emp = emp.replaceAll("\"\\[", "[");
		emp = emp.replaceAll("\\]\"", "]");
		
		String result = "{\"deptData\":" + dept + ", \"empData\":" + emp + "}";
		return result;
	}
	
	@RequestMapping(value="/res/bldgSearch.do", method=RequestMethod.GET, produces = "text/plain; charset=utf8")
	@ResponseBody public String resBldgSearch(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		response.setCharacterEncoding("utf-8");
		
		String searchText = request.getParameter("searchText");
		searchText = "%" + searchText + "%";
		List<BldgVO> bldgList = bldgRepository.findByBldgNmLike(searchText);
		
		List<HashMap> list = new ArrayList<HashMap>();
		for(BldgVO bldgVO : bldgList) {
            HashMap<String, String> map = new HashMap<>();
			map.put("bldgNo", String.valueOf(bldgVO.getBldgNo()));
			map.put("bldgNm", bldgVO.getBldgNm());
			map.put("roomCount", String.valueOf(roomRepository.countByBldgVO(bldgVO)));
			list.add(map);
		}
		String bldg = new ObjectMapper().writeValueAsString(list);
		bldg = bldg.replaceAll("\\\\", "");
		bldg = bldg.replaceAll("\"\\[", "[");
		bldg = bldg.replaceAll("\\]\"", "]");
		
		String result = "{\"bldgData\":" + bldg + "}";
		return result;
	}
	
	@RequestMapping(value="/res/roomSearch.do", method=RequestMethod.GET, produces = "text/plain; charset=utf8")
	@ResponseBody public String resRoomSearch(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		response.setCharacterEncoding("utf-8");

		String bldgNo = request.getParameter("bldgNo");
		if(bldgNo == null) {
			return null;
		}
		BldgVO bldgVO = new BldgVO();
		bldgVO.setBldgNo(Long.valueOf(bldgNo));
		String searchText = request.getParameter("searchText");
		searchText = "%" + searchText + "%";
		List<RoomVO> roomList = roomRepository.findByBldgVOAndRoomNmLike(bldgVO, searchText);
		
		List<HashMap> list = new ArrayList<HashMap>();
		for(RoomVO roomVO : roomList) {
            HashMap<String, String> map = new HashMap<>();
			map.put("roomNo", String.valueOf(roomVO.getRoomNo()));
			map.put("roomNm", roomVO.getRoomNm());
			map.put("roomType", String.valueOf(roomVO.getRoomType()));
			map.put("roomUseNetworkYn", roomVO.getUseNetworkYn());
			map.put("roomCapacity", String.valueOf(roomVO.getRoomCapacity()));
			list.add(map);
		}
		String room = new ObjectMapper().writeValueAsString(list);
		room = room.replaceAll("\\\\", "");
		room = room.replaceAll("\"\\[", "[");
		room = room.replaceAll("\\]\"", "]");
		
		String result = "{\"roomData\":" + room + "}";
		return result;
	}
	
	@RequestMapping(value="/res/resSearch.do", method=RequestMethod.GET, produces = "text/plain; charset=utf8")
	@ResponseBody public String resSearch(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		response.setCharacterEncoding("utf-8");

		String roomNo = request.getParameter("roomNo");
		if(roomNo == null) {
			return null;
		}
		String month = request.getParameter("month");
//		getResThisRoomAndDate
		Calendar calendar = Calendar.getInstance();
		calendar.set(calendar.get(Calendar.YEAR), Integer.parseInt(month), 1, 0, 0, 0);
		Date startDt = calendar.getTime();
		int DayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), DayOfMonth, 23, 59, 59);
		Date endDt = calendar.getTime();
		System.out.println(dateFormat.format(startDt));
		System.out.println(dateFormat.format(endDt));
		
		List<ResVO> resList = resRepository.getResThisRoomAndDate(Long.parseLong(roomNo), dateFormat.format(startDt), dateFormat.format(endDt));
		
		List<HashMap> list = new ArrayList<HashMap>();
		for(ResVO resVO : resList) {
            HashMap<String, String> map = new HashMap<>();
			map.put("resNo", String.valueOf(resVO.getResNo()));
			map.put("empNm", resVO.getEmpVO().getEmpNm());
			map.put("startDt", resVO.getStartDt().toString());
			map.put("endDt", resVO.getEndDt().toString());
			list.add(map);
		}
		String res = new ObjectMapper().writeValueAsString(list);
		res = res.replaceAll("\\\\", "");
		res = res.replaceAll("\"\\[", "[");
		res = res.replaceAll("\\]\"", "]");
		System.out.println(res);
		
		String result = "{\"resData\":" + res + "}";
		return result;
	}
	
	@RequestMapping(value="/roomItemAll.do", method=RequestMethod.GET, produces = "text/plain; charset=utf8")
	@ResponseBody public String roomItemAll(HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
		response.setCharacterEncoding("utf-8");
		
		String roomNo = request.getParameter("roomNo");
		RoomVO roomVO = roomRepository.getOne(Long.valueOf(roomNo));
        HashMap<String, String> map = new HashMap<>();
		map.put("roomNo", String.valueOf(roomVO.getRoomNo()));
		map.put("roomNm", roomVO.getRoomNm());
		map.put("roomType", String.valueOf(roomVO.getRoomType()));
		map.put("costPerHour", String.valueOf(roomVO.getCostPerHour()));
		map.put("roomUseNetworkYn", roomVO.getUseNetworkYn());
		map.put("roomCapacity", String.valueOf(roomVO.getRoomCapacity()));
		String roomString = new ObjectMapper().writeValueAsString(map);
		
		List<ItemVO> items = roomVO.getItems();
		List<HashMap> list = new ArrayList<HashMap>();
		for(ItemVO item : items) {
            HashMap<String, String> itemMap = new HashMap<>();
			itemMap.put("itemNo", String.valueOf(item.getItemNo()));
			itemMap.put("itemNm", item.getItemNm());
			itemMap.put("useCost", String.valueOf(item.getUseCost()));
			list.add(itemMap);
		}
		String itemsString = new ObjectMapper().writeValueAsString(list);
		
		String result = "{\"itemData\":" + itemsString + ", \"roomData\":" + roomString + "}";
		return result;
	}	
	
	@RequestMapping(value="/res/info.do")
	public String resInfo() {
		return "res/resInformation";
	}
	
	   @RequestMapping(value="/res/resHistory.do", method=RequestMethod.GET)
	   public String resHistory(Model model) throws JsonProcessingException, ParseException {
	      List<ResVO> resList = new ArrayList<>();
	      
	      resList = resRepository.findAll();

	      for(int i = 0; i < resList.size(); i++) {
	    	  String startDateStr = resList.get(i).getStartDt().toString();
	    	  String endDateStr = resList.get(i).getEndDt().toString();
	    	  
	    	  Date startDate = dateFormat.parse(dateFormat.format(resList.get(i).getStartDt()));
	    	  Date endDate = dateFormat.parse(dateFormat.format(resList.get(i).getEndDt()));
	    	  
	    	  resList.get(i).setStartDt(startDate);
			  resList.get(i).setEndDt(endDate);
	      }
	      
	      model.addAttribute("resList", resList);
	      
	      return "res/resHistory";
	   }
	   
	   @RequestMapping(value="/res/resApproval.do")
	   public String resApproval(Model model, Principal principal) {
		   EmpVO empVO;
		   List<EmpPermVO> empPermVOList = new ArrayList<>();
		   List<ResVO> resList = new ArrayList<ResVO>();
		   List<ResVO> resApprovalList = new ArrayList<ResVO>();
		   
		   if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			   empVO = empRepository.findByEmpId(principal.getName());
		   }
		   else {
			   return "redirect:/board/mypage.do";
		   }
		   
		   empPermVOList = empPermRepository.findByEmpVO(empVO);
		   
		   resList = resRepository.findAll();
		   
		   /*resList.get(0).getEmpVO().getDeptVO().getDeptNo();
		   empVO.getDeptVO().getDeptNo();*/
		   
		   for(int i = 0; i < empPermVOList.size(); i++) {
			   System.out.println("리스트 받아옴 : " + empPermVOList.get(i).getPerm());
			   if(empPermVOList.get(i).getPerm().equals("ADMIN")) {
				   System.out.println("관리자 왔넹");
				   
				   for(int j = 0; j < resList.size(); j++) {
					   if(resList.get(j).getResState() == ResState.ApvWaitRmMgr.ordinal()) {
						   resApprovalList.add(resList.get(j));
					   }
				   }
				   
				   //resList = resRepository.findAllByResState(Long.valueOf("0").longValue());
			   } else if(empPermVOList.get(i).getPerm().equals("DEPTHEAD")) {
				   System.out.println("팀장 왔넹");
				   
				   for(int j = 0; j < resList.size(); j++) {
					   if((resList.get(j).getResState() == ResState.ApvWaitDeptHead.ordinal())
							   && (resList.get(j).getEmpVO().getDeptVO().getDeptNo() == empVO.getDeptVO().getDeptNo())) {
						   resApprovalList.add(resList.get(j));
					   }
				   }
				   
				   //resList = resRepository.findAllByResState(Long.valueOf("1").longValue());
			   }
		   }
	      
	      model.addAttribute("resList",resApprovalList);
	      
	      //System.out.println("이것은 인증수단이여 : " + );
	      return "res/resApproval";
	   }
	   
	   // 팀장 및 담당자가 승인하기 버튼을 클릭했을을 때
	   @RequestMapping(value="/res/approvalAccept.do", method= RequestMethod.POST)
	   @ResponseBody public void approvalAccept(Principal principal, HttpServletRequest request) throws JsonProcessingException, MailException, MessagingException {
		   EmpVO empVO;
		   if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			   empVO = empRepository.findByEmpId(principal.getName());
		   }
		   else {
			   empVO = empRepository.findByEmpId("ita002");
		   }
		   String resNo = request.getParameter("resNo");
		   ResVO resVO = resRepository.getOne(Long.valueOf(resNo).longValue());
		   EmailVO emailVO = emailRepository.findById((long)EmailType.ApprovalResult.ordinal()).get();
		   if(resVO.getResState() == ResState.ApvWaitDeptHead.ordinal()) {
			   resVO.setResState(ResState.ApvWaitRmMgr.ordinal());
			   notificationService.approvedResultSend(empVO.getEmailAddr(), resVO.getEmpVO().getEmailAddr(), emailVO.getSubject(), emailVO.getContent(), "상위 결재자 " + empVO.getEmpNm() + "님께서", true);
		   } else if(resVO.getResState() == ResState.ApvWaitRmMgr.ordinal()) {
			   resVO.setResState(ResState.ApvComp.ordinal());
			   notificationService.approvedResultSend(empVO.getEmailAddr(), resVO.getEmpVO().getEmailAddr(), emailVO.getSubject(), emailVO.getContent(), "담당자 " + empVO.getEmpNm() + "님께서", true);
		   } 
		   resRepository.save(resVO);
	   }
	   // 팀장 및 담당자가 거절하기 버튼을 클릭했을을 때
	   @RequestMapping(value="/res/approvalReject.do", method= RequestMethod.POST)
	   @ResponseBody public void approvalReject(Principal principal, HttpServletRequest request) throws JsonProcessingException, MailException, MessagingException {
		   EmpVO empVO;
		   if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			   empVO = empRepository.findByEmpId(principal.getName());
		   }
		   else {
			   empVO = empRepository.findByEmpId("ita002");
		   }
		   String resNo = request.getParameter("resNo");
		   ResVO resVO = resRepository.getOne(Long.valueOf(resNo).longValue());
		   EmailVO emailVO = emailRepository.findById((long)EmailType.ApprovalResult.ordinal()).get();
		   
		   if(resVO.getResState() == ResState.ApvWaitDeptHead.ordinal()) {
			   resVO.setResState(ResState.ApvRejectDeptHead.ordinal());
			   notificationService.approvedResultSend(empVO.getEmailAddr(), resVO.getEmpVO().getEmailAddr(), emailVO.getSubject(), emailVO.getContent(), "상위 결재자 " + empVO.getEmpNm() + "님께서", false);
		   } else if(resVO.getResState() == ResState.ApvWaitRmMgr.ordinal()) {
			   resVO.setResState(ResState.ApvRejectRmMgr.ordinal());
			   notificationService.approvedResultSend(empVO.getEmailAddr(), resVO.getEmpVO().getEmailAddr(), emailVO.getSubject(), emailVO.getContent(), "담당자 " + empVO.getEmpNm() + "님께서", false);
		   }
		   resRepository.save(resVO);
	   }
	
	@RequestMapping(value="/res/condition.do", method=RequestMethod.GET)
	public String myResCondition(Principal principal, Model model) {
		EmpVO empVO;
		if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			empVO = empRepository.findByEmpId(principal.getName());
		}
		else {
			empVO = empRepository.findByEmpId("IT1072");
		}
		List<ResVO> resList = new ArrayList<>();
		resList = resRepository.findByEmpVO(empVO);
		model.addAttribute("resList",resList);
		return "res/condition";
	}
	
	@RequestMapping(value="/res/conditionTotal.do", method=RequestMethod.GET)
	public String resCondition(Principal principal, Model model, HttpServletRequest request) throws ParseException, JsonProcessingException {
		EmpVO empVO;
		if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			empVO = empRepository.findByEmpId(principal.getName());
		}
		else {
			return "redirect:/board/mypage.do";
		}
		if(empVO != null) {
			List<RoomVO> roomList = empVO.getDeptVO().getBldgVO().getRooms();
			
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.set(Calendar.HOUR_OF_DAY, 0);
			calendar.set(Calendar.MINUTE, 0);
			calendar.set(Calendar.SECOND, 0);
			calendar.set(Calendar.MILLISECOND, 0);
			
			Date startDt = calendar.getTime();
			Date endDt = new Date(calendar.getTime().getTime() + ((1000 * 60 * 60 * 24) - 1000));
			
			for(RoomVO room : roomList) {
				List<ResVO> resList = resRepository.getResThisRoomAndDateMinutes(room.getRoomNo(), dateMinFormat.format(startDt), dateMinFormat.format(endDt));
				room.setReses(resList);
			}
			model.addAttribute("roomList", roomList);
			model.addAttribute("empVO", empVO);
			List<BldgVO> bldgList = bldgRepository.findAll();
			model.addAttribute("bldgList", bldgList);
		}
		return "res/conditionTotal";
   }
	
	@RequestMapping(value="/res/conditionTotalAjax.do", method=RequestMethod.GET)
	@ResponseBody public String resConditionAjax(HttpServletRequest request) throws ParseException, JsonProcessingException {
		String bldgNo = request.getParameter("bldgNo");
		List<RoomVO> roomList;
		if(bldgNo != null && bldgNo.length() > 0) {
			roomList = bldgRepository.findById(Long.parseLong(bldgNo)).get().getRooms();
		}
		else {
			return "{\"status\":500}";
		}
		
		Calendar calendar = Calendar.getInstance();
		String selectDate = request.getParameter("selectDate");
		if(selectDate != null && selectDate.length() > 0 && selectDate.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")) {
			calendar.setTime(this.dateFormat.parse(selectDate));
		}
		else {
			calendar.setTime(new Date());
		}
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		
		Date startDt = calendar.getTime();
		Date endDt = new Date(calendar.getTime().getTime() + ((1000 * 60 * 60 * 24) - 1000));

		for(RoomVO room : roomList) {
			List<ResVO> resList = resRepository.getResThisRoomAndDateMinutes(room.getRoomNo(), dateMinFormat.format(startDt), dateMinFormat.format(endDt));
			room.setReses(resList);
		}

		List<HashMap> list = new ArrayList<HashMap>();
		for(RoomVO room : roomList) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("roomNo", String.valueOf(room.getRoomNo()));
			map.put("roomNm", room.getRoomNm());
			map.put("roomCapacity", String.valueOf(room.getRoomCapacity()));
			List<HashMap> subList = new ArrayList<HashMap>();
			for(ResVO res : room.getReses()) {
				HashMap<String, String> subMap = new HashMap<String, String>();
				subMap.put("startDt", res.getStartDt().toString());
				subMap.put("endDt", res.getEndDt().toString());
				subList.add(subMap);
			}
			if(subList.size() > 0) {
				map.put("resDt", new ObjectMapper().writeValueAsString(subList));
			}
			list.add(map);
		}
		String roomListString = new ObjectMapper().writeValueAsString(list);
		String result = "{\"roomList\":" + roomListString + "}";
		return result;
   }
}
