package com.gsitm.spring.email.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gsitm.spring.email.EmailType;
import com.gsitm.spring.email.NotificationService;
import com.gsitm.spring.email.TempKey;
import com.gsitm.spring.email.dao.EmailAuthRepository;
import com.gsitm.spring.email.dao.EmailRepository;
import com.gsitm.spring.email.vo.EmailAuthVO;
import com.gsitm.spring.email.vo.EmailVO;
import com.gsitm.spring.emp.dao.EmpRepository;
import com.gsitm.spring.emp.vo.EmpVO;

@Controller
public class EmailController {

	@Autowired
	private EmailRepository emailRepository;

	@Autowired
	private NotificationService notificationService;

	@Autowired
	private EmailAuthRepository emailAuthRepository;

	@Autowired
	private EmpRepository empRepository;

//	@RequestMapping(value = "/showPayContentEmail.do", method = RequestMethod.POST)
//	public String showPayContentEmail(HttpServletRequest request, HttpServletResponse response)
//			throws IOException, MessagingException {
//		response.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = response.getWriter();
//		try {
//			notificationService.showPayContentEmail();
//			out.println("<script>alert('메일이 전송 되었습니다');</script>");
//			out.flush();
//		} catch (MailException e) {
//			// TODO: handle exception
//
//		}
//		return "board/showEmailSendForm";
//
//		// return "Thank you for registering with us";
//	}

	@RequestMapping(value = "/email/authSend.do", method = RequestMethod.GET)
	@ResponseBody public String authSend(HttpServletRequest request, HttpServletResponse response) throws IOException, MessagingException {

		String email = request.getParameter("email");

		response.setContentType("text/html; charset=UTF-8");

		// 인증키 생성
		TempKey key = new TempKey();
		String authKey = key.getKey(10, false);
		EmailAuthVO emailAuthVO = new EmailAuthVO();
		emailAuthVO.setEmail(email);
		emailAuthVO.setKey(authKey);
		emailAuthRepository.save(emailAuthVO);

		try {
			EmailVO emailVO = emailRepository.findById(new Long(EmailType.EmailAuth.ordinal())).get();
			String subject = emailVO.getSubject();
			String content = emailVO.getContent();
			content = content.replaceAll("\\{authKey\\}", authKey);
			notificationService.sendEmail(email, email, subject, content);

		} catch (MailException e) {
			// TODO: handle exception

		}
		return "{\"status\":200}";
	}

	// 5) 이메일 인증번호 적은 후 확인 버튼 눌렀을 때, db에 있는 인증키값 비교해서 true면 email을 insert, 아니면 틀렸다고 alert 띄어준다. -> 계정정보때 이메일 인증때 필요
	@RequestMapping(value = "/email/checkAuthKey.do", method = RequestMethod.GET)
	@ResponseBody public String checkAuthKey(Principal principal, HttpServletRequest request, HttpServletResponse response) throws IOException, MessagingException {
		EmpVO empVO;
		if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			empVO = empRepository.findByEmpId(principal.getName());
		}
		else {
			return "{\"status\":402, \"message\":\"로그인 되어있지 않습니다.\"}";
		}
		
		String email = request.getParameter("email");
		String authKey = request.getParameter("authKey");

		response.setContentType("text/html; charset=UTF-8");

//		PrintWriter out = response.getWriter();
		EmailAuthVO emailAuthVO = emailAuthRepository.findTop1ByEmailAndKey(email, authKey, new Sort(Direction.DESC, "regDt"));
		if(emailAuthVO != null) {
			Date regDt = emailAuthVO.getRegDt();
			Date now = new Date();
			if(now.getTime() - regDt.getTime() > 1000 * 60 * 3) {
				//인증 실패
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			}
			else {
				//인증 성공
				response.setStatus(HttpServletResponse.SC_OK);
				if(empVO != null) {
					empVO.setEmailAddr(emailAuthVO.getEmail());
					empRepository.save(empVO);
				}
				return "{\"status\":200}";
			}
		}
		response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
		return "{\"status\":401}";
	}
}
