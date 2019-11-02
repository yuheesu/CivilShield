package com.gsitm.spring.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gsitm.spring.board.BoardType;
import com.gsitm.spring.board.dao.BoardRepository;
import com.gsitm.spring.board.vo.BoardVO;
import com.gsitm.spring.email.NotificationService;
import com.gsitm.spring.emp.dao.EmpPermRepository;
import com.gsitm.spring.emp.dao.EmpRepository;
import com.gsitm.spring.emp.vo.EmpPermVO;
import com.gsitm.spring.emp.vo.EmpVO;

/**
 * @programName : BoardRepository.java
 * @author : 성동원
 * @date : 2018. 6. 10.
 * @function : 공지사항 관련 db 처리가 이루어지는 곳.
 *
 *           [이름] [수정일] [내용]
 *           ---------------------------------------------------------- 성동원
 *           2018.06.10 board 메서드 작성 -> 공지사항을 뿌려주는 기능 faq 메서드 작성
 *           -> Faq를 뿌려주는 기능 조회된 내용은 Model 객체에 담아서 view-page인 jsp에서 사용할 수 있도록
 *           한다.
 * 
 * 
 */
@Controller
public class BoardController {

	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private EmpRepository empRepository;

	@Autowired
	private EmpPermRepository empPermRepository;

	@Autowired
	private NotificationService notificationService;
	
	// ================================================공지사항===================================================
	
	// 공지사항을 뿌려주는 메서드
	@RequestMapping(value = "/board/board.do", method = RequestMethod.GET)
	public String board(Model model) {
		List<BoardVO> list = new ArrayList<>();
		list = boardRepository.findByBoardType(BoardType.NOTICE.ordinal());
		for(BoardVO board : list) {
			board.getEmpVO();
		}
		model.addAttribute("list", list);
		return "board/board";
	}

	// 공지사항을 작성하는 폼을 보여주는 메서드
	@RequestMapping(value = "/board/writeNotice.do", method = RequestMethod.GET)
	public String writeNotice(Model model) {
		return "board/writeNotice";
	}

	// 공지사항 하나(item)를 추가하는 메서드
	@RequestMapping(value = "/board/admin/insertNotice.do", method = RequestMethod.POST)
	public void insertNotice(Principal principal, Model model, BoardVO boardVO, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String selectNoticeOrFaq = request.getParameter("selectNoticeOrFaq");
		System.out.println("selectNoticeOrFaq : "+ selectNoticeOrFaq);
		
		EmpVO empVO;
		if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			empVO = empRepository.findByEmpId(principal.getName());
		}
		else {
			empVO = empRepository.findByEmpId("IT1072");
		}
		boardVO.setEmpVO(empVO);
		boardRepository.save(boardVO);
		System.out.println("공지사항 한개 insert 완료했습니다.");
		response.sendRedirect("/board/board.do");
	}

	@RequestMapping(value = "/board/notice.do", method = RequestMethod.GET)
	public String notice(Model model, HttpServletRequest request, HttpServletResponse response) {
		String boardNo = request.getParameter("boardNo");
		// 보드 한 객체를 가져 온다.
		BoardVO boardVO = boardRepository.getOne(Long.valueOf(boardNo).longValue());
		Long beforeHit = boardVO.getHit();
		boardVO.setHit(beforeHit+1);
		boardRepository.save(boardVO);
		model.addAttribute("item", boardVO);
		return "board/notice";
	}

	// 공지사항 항목 삭제하는 메서드
	@RequestMapping(value = "/board/admin/deleteNotice.do", method = RequestMethod.GET)
	public void deleteNotice(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String boardNo = request.getParameter("boardNo");
		boardRepository.deleteById(Long.valueOf(boardNo).longValue());
		response.sendRedirect("/board/board.do");
	}

	// 공지사항을 수정하는 화면만을 보여주는 메서드
	@RequestMapping(value = "/board/admin/modify.do", method = RequestMethod.GET)
	public String showModifyForm(Model model, HttpServletRequest request, HttpServletResponse response) {
		String boardNo = request.getParameter("boardNo");
		BoardVO boardVO = boardRepository.getOne(Long.valueOf(boardNo));
		model.addAttribute("item", boardVO);
		return "board/modify";
	}

	// 공지사항을 진짜 수정해서 db에 넣는 메서드
	@RequestMapping(value = "/board/modifyNotice.do", method = RequestMethod.POST)
	public void modifyNotice(Model model, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println("modifyNotice.do 입성완료");
		String boardNo = request.getParameter("boardNo");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		Date currentDate = Calendar.getInstance().getTime();
		
		BoardVO boardVO = boardRepository.getOne(Long.valueOf(boardNo));
		boardVO.setSubject(subject);
		boardVO.setContent(content);
		boardVO.setUpdDt(currentDate);
		boardRepository.save(boardVO);
		response.sendRedirect("/board/board.do");
	}

	// ================================================FAQ===================================================
	// faq를 뿌려주는 메서드
	@RequestMapping(value = "/board/faq.do", method = RequestMethod.GET)
	public String faq(Model model) {
		List<BoardVO> list = new ArrayList<>();
		list = boardRepository.findByBoardType(BoardType.FAQ.ordinal());
		model.addAttribute("list", list);
		return "board/faq";
	}
	//마이페이지 계정정보
    @RequestMapping(value = "/board/mypage.do", method = RequestMethod.GET)
    public String myPage(Principal principal, Model model) throws IOException {
		EmpVO empVO;
		if(principal != null && principal.getName() != null && principal.getName().length() > 0) {
			empVO = empRepository.findByEmpId(principal.getName());
		}
		else {
			return "redirect:/login/login.do";
		}
		model.addAttribute("empVO", empVO);
		return "board/mypage";
    }
    
	
	@RequestMapping(value = "/board/contact.do", method = RequestMethod.GET)
	public String contact() {
		return "board/contact";
	}
	
	// 2) 문의사항에서 문의글을 보냈을 때 -> 문의 글 메일 전송 메서드
	@RequestMapping(value = "/email/sendEmail.do", method = RequestMethod.POST)
	public String sendContactEmail(HttpServletRequest request, HttpServletResponse response)
			throws IOException, MessagingException {
		String title = request.getParameter("title");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String message = request.getParameter("message");

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		try {
			List<EmpPermVO> list = empPermRepository.findByPerm("ADMIN");
			for(int j = 0; j < list.size(); j++) {
				EmpPermVO perm = list.get(j);
				String emailTo = perm.getEmpVO().getEmailAddr();
				if(emailTo != null && emailTo.length() > 0) {
					notificationService.sendNotificationToContact(title, emailTo, email, name, message);
				}
			}
			out.println("<script>alert('메일이 전송 되었습니다');</script>");
			out.flush();
		} catch (MailException e) {
			// TODO: handle exception

		}
		return "board/showEmailSendForm";
	}
}
