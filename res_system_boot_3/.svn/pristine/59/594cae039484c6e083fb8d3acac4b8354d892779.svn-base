package com.gsitm.spring.email;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Service
public class NotificationService {

	@Autowired
	private JavaMailSender mailSender;

	// @Autowired
	private MimeMessage message;

	// @Autowired
	private MimeMessageHelper messageHelper;

	@Autowired
	public NotificationService(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}

	public void sendEmail(String emailFrom, String emailTo, String subject, String content) throws MailException, MessagingException {
		messageHelper.setFrom(emailFrom);
		messageHelper.setTo(emailTo);
		messageHelper.setSubject(subject);
		messageHelper.setText(content, true);
		mailSender.send(this.message);
	}
    /**
     * @param approvedFor 상위결재자 ㅇㅇㅇ님께서 
     * @param result true:승인, false:승인 거부
     * */
	public void approvedResultSend(String emailFrom, String emailTo, String subject, String content, String approvedBy, boolean result) throws MailException, MessagingException {
		messageHelper.setFrom(emailFrom);
		messageHelper.setTo(emailTo);
		messageHelper.setSubject(subject);
		content = content.replaceAll("\\{approvedBy\\}", approvedBy);
		if(result) {
			content = content.replaceAll("\\{approvalMessage\\}", "승인");
		}
		else {
			content = content.replaceAll("\\{approvalMessage\\}", "승인 거부");
		}
		messageHelper.setText(content, true);
		mailSender.send(this.message);
	}

	//문의할때 호출됨
	public void sendNotificationToContact(String title, String adminEmail, String email, String name, String message)
			throws MailException, MessagingException {
		// SimpleMailMessage mail = new SimpleMailMessage();
		// 메일의 도착지점
		String htmlMsg = "<body>\r\n" + 
				"  <div style=\"border:12px solid black; border-color: rgb(195, 210, 255); width: 600px; height: 400px;\">\r\n" + 
				"    <img src=\"http://localhost:8088/dist/images/email_header.png\" width=\"100%\">\r\n" + 
				"    <div style=\"width:100%; margin:10px auto 10px; border:1px solid #d9d9d9\"></div>\r\n" + 
				"    <span style=\"display:block; width:535px; padding:14px 20px; color:#666;\">\r\n" + 
				"     <strong style=\"color:#436ce5\">"+name+"</strong>님으로부터 문의 메일이 도착했습니다.<br><br>\r\n" + 
				message +
				"   </span>\r\n<br>" +
				"   <div style=\"margin-left:20px;\"><img src='http://localhost:8088/dist/images/gsitm_small.png'><br>\r\n" + 
				"    직 책 : "+name+"<br>\r\n" + 
				"    이 름 : "+name+"<br>\r\n" + 
				"    핸드폰 번호 : "+name+"<br>\r\n" + 
				"    EMAIL :<a href=''>"+email+"</a><br>\r\n" + 
				"   </div>";

		messageHelper.setTo(adminEmail);
		messageHelper.setSubject(title);
		messageHelper.setFrom(email);
		messageHelper.setText(htmlMsg, true);
		mailSender.send(this.message);

	}
}


//이메일 예약 승인 신청시 호출 결제 내역
//public void showPayContentEmail()
//		throws MailException, MessagingException {
//	
//	String htmlMsg = "<body>\r\n" + 
//			"  <div style='border:12px solid black; border-color: rgb(195, 210, 255); width: 600px; height: 400px;'> \r\n" + 
//			"    <img src='http://localhost:8088/dist/images/email_header.png\\' width='100%'> \r\n" + 
//			"    <div style='width:100%; margin:10px auto 10px; border:1px solid #d9d9d9'></div> \r\n" + 
//			"    <span style='display:block; width:535px; padding:14px 20px; color:#666;'> \r\n" + 
//			"      안녕하세요! <img src='http://localhost:8088/dist/images/gsitm.png'>에서 <strong style='color:#436ce5'>결제내역</strong> 알려드립니다.<br>\r\n" + 
//			"      <div style='width:100%; margin:10px auto 10px; border:1px solid #d9d9d9'></div> \r\n" + 
//			"      <div style='width:100%;'>\r\n" + 
//			"        <table style=\"width: 100%;\" cellspacing =\"10px;\">   \r\n" + 
//			"          <th>결제비품</th>\r\n" + 
//			"          <th>수  량</th>\r\n" + 
//			"          <th>단  가</th>\r\n" + 
//			"        </tr>\r\n" + 
//			"        <tr>\r\n" + 
//			"          <td style=\"text-align: center;\">화이트보드</td> \r\n" + 
//			"          <td style=\"text-align: center;\">3</td>\r\n" + 
//			"          <td style=\"text-align: center;\">1000</td>\r\n" + 
//			"        </tr>\r\n" + 
//			"        <tr>\r\n" + 
//			"          <td style=\"text-align: center;\">빔 프로젝터</td> \r\n" + 
//			"          <td style=\"text-align: center;\">2</td>\r\n" + 
//			"          <td style=\"text-align: center;\">2000</td>\r\n" + 
//			"        </tr>\r\n" + 
//			"      </table>\r\n" + 
//			"      <div style='width:100%; margin:10px auto 10px; border:1px solid #d9d9d9'></div> \r\n" + 
//			"    </div> \r\n" + 
//			"    <h3 style=\"float: right;\">총비용 : <strong style='color:#436ce5'>5000원</strong></h3>\r\n" + 
//			"  </span>\r\n" + 
//			"  <div>\r\n" + 
//			"  </div>\r\n" + 
//			"</div>\r\n" + 
//			"</body>";
//	messageHelper.setTo("dongwonsun@naver.com");
//	messageHelper.setText(htmlMsg, true);
//	/* this.message.setContent(htmlMsg, "text/html"); */
//	// messageHelper.setText(htmlMsg,true);
//	// this.message.setContent(this.message, "text/html");
//	// 우편배달부인 mailSender은 this.message라는 우편메일을 직접 보낸다.
//	mailSender.send(this.message);
//	System.out.println("SMTP를 통한 메일 전송 완료");
//}