package com.gsitm.spring.scheduler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

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
import com.gsitm.spring.emp.vo.EmpPermVO;
import com.gsitm.spring.emp.vo.EmpVO;
import com.gsitm.spring.res.ResState;
import com.gsitm.spring.res.dao.ResEmpRepository;
import com.gsitm.spring.res.dao.ResRepository;
import com.gsitm.spring.res.vo.ResVO;

/**
 * @programName : ScheduledTasks.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Component
public class ScheduledTasks {

    private static final Logger log = LoggerFactory.getLogger(ScheduledTasks.class);

    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");

    @Autowired
    private DeptBudgetRepository deptBudgetRepository;
    
    @Autowired
    private DeptRepository deptRepository;
    
    @Autowired
    private ResRepository resRepository;
    
    @Autowired
    private ResEmpRepository resEmpRepository;
    
    @Autowired
    private EmpPermRepository empPermRepository;
    
    @Autowired
    private NotificationService notificationService;
    
    @Autowired
    private EmailRepository emailRepository;
    
    @Transactional
    public void resCostProc() {
        Date startDt = new Date();
        Date endDt = new Date(startDt.getTime() + (1000 * 60 * 5));
        startDt.setTime(startDt.getTime() - (1000 * 60 * 5));
        //끝난 예약 비용차감
        List<ResVO> list = resRepository.getResThisDateMinutesEnd(dateFormat.format(startDt), dateFormat.format(endDt));
        for(int i = 0; i < list.size(); i++) {
        	ResVO resVO = list.get(i);
        	if(resVO.getResState() == ResState.RmUsing.ordinal()) {
        		// 사용 완료처리
            	resRepository.updateState(resVO.getResNo(), ResState.RmUsed.ordinal());
        	}
        	else {
            	resRepository.updateState(resVO.getResNo(), ResState.notUsed.ordinal());
        	}
        	List<Long> result = resEmpRepository.findDeptGroupByResVO(resVO);
        	if(result != null && !result.isEmpty()) {
        		int random = (int)(Math.random() * result.size());
        		Long costPerDept = (Long)resVO.getTotalCost() / result.size();
        		for(int j = 0; j < result.size(); j++) {
        			Long deptNo = result.get(j);
        			if(j == random) {
        				decreaseDeptBudget(deptNo, costPerDept + (resVO.getTotalCost() % result.size()));
        			}
        			else {
            			decreaseDeptBudget(deptNo, costPerDept);
        			}
        		}
        		EmailVO emailVO = emailRepository.findById(new Long(EmailType.CostProcComp.ordinal())).get();
        		EmpVO empVO = resVO.getEmpVO();
        		String empEmail = empVO.getEmailAddr();
        		String mgrEmail = empVO.getDeptVO().getMgrVO().getEmailAddr();
        		String content = emailVO.getContent();
        		content = content.replaceAll("\\{reservationWhat\\}", "금일 " + resVO.getRoomVO().getRoomNm() + " ");
        		try {
					notificationService.sendEmail(empVO.getEmailAddr(), empEmail, emailVO.getSubject(), content);
	        		notificationService.sendEmail(empVO.getEmailAddr(), mgrEmail, emailVO.getSubject(), content);
	    			List<EmpPermVO> permList = empPermRepository.findByPerm("ADMIN");
	    			for(int j = 0; j < permList.size(); j++) {
	    				EmpPermVO perm = permList.get(j);
	    				String emailTo = perm.getEmpVO().getEmailAddr();
	    				if(emailTo != null && emailTo.length() > 0) {
	    					notificationService.sendEmail(empVO.getEmailAddr(), emailTo, emailVO.getSubject(), content);
	    				}
	    			}
				} catch (MailException | MessagingException e) {
//					e.printStackTrace();
					System.out.println("메일 전송 실패: " + e.getMessage());
				}
        	}
        }
        
        //시작된 예약 사용중 상태로 변경
        list = resRepository.getResThisDateMinutesStart(dateFormat.format(startDt), dateFormat.format(endDt));
        for(int i = 0; i < list.size(); i++) {
        	ResVO resVO = list.get(i);
        	if(resVO.getResState() == ResState.ApvComp.ordinal()) {
            	resRepository.updateState(resVO.getResNo(), ResState.RmUsing.ordinal());
        	}
        }
    }
    
    /**
     * @methodName : resCostProc
     * @author     : 차주현 
     * @date       : 2018. 6. 8. 
     * @function   : 
     * 			예약 시작/종료 시점에 비용처리와 예약 사용처리
     */ 
    @Scheduled(cron="0 */10 * * * *") //10분마다
    public void resCostScheduler() {
    	//30분 스케줄러
        log.info("resCostScheduler starts now {}", dateFormat.format(new Date()));
        resCostProc();
        log.info("resCostScheduler ends now {} Scheduled Comp", dateFormat.format(new Date()));
    }
    
    @Transactional
    public void monthBugetProc() {
    	List<DeptVO> deptList = deptRepository.findAll();
    	for(int i = 0; i < deptList.size(); i++) {
    		increaseDeptBudget(deptList.get(i));
    	}
    }  
    
    @Scheduled(cron="0 */30 * * * *") //30분마다
    public void monthBugetScheduler() {
        log.info("monthBugetScheduler stats now {}", dateFormat.format(new Date()));
    	monthBugetProc();
        log.info("monthBugetScheduler ends now {} Scheduled Comp", dateFormat.format(new Date()));
    }  
    
    @Transactional
    public void decreaseDeptBudget(Long deptNo, Long amount) {
		deptRepository.decreaseBudget(deptNo, amount);
		
		DeptVO deptVO = deptRepository.findById(deptNo).get();
//		deptVO.setDeptNo(deptNo);
		DeptBudgetVO budget = new DeptBudgetVO();
		budget.setDeptVO(deptVO);
		budget.setProcDt(new Date());
		budget.setProcDiv("주지출 > 회의실/교육실 비용");
		budget.setOutgoing(amount);
		budget.setOutgoing(deptVO.getDeptBudget());
		budget.setBudgetType(BudgetType.Outgoing.ordinal());
		deptBudgetRepository.save(budget);
    }
    
    @Transactional
    public void increaseDeptBudget(DeptVO deptVO) {
		Long monthBudget = deptVO.getMonthBudget();
		deptRepository.increaseBudget(deptVO.getDeptNo(), monthBudget);
//		deptVO.setDeptBudget(deptVO.getDeptBudget() + monthBudget);
		DeptBudgetVO budget = new DeptBudgetVO();
		budget.setDeptVO(deptVO);
		budget.setProcDt(new Date());
		budget.setProcDiv("주예산 > 월초예산");
		budget.setIncoming(monthBudget);
		budget.setIncoming(deptVO.getDeptBudget());
		budget.setBudgetType(BudgetType.Incoming.ordinal());
		deptBudgetRepository.save(budget);
//		deptRepository.save(deptVO);
    }
}