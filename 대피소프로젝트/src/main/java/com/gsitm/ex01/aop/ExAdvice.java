package com.gsitm.ex01.aop;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.aspectj.lang.JoinPoint;

import com.gsitm.ex01.service.BoardService;
import com.gsitm.ex01.vo.BoardVO;

public class ExAdvice {
	private static final Logger log = LoggerFactory.getLogger(ExAdvice.class);
//ProceedingJoinPoint pJoinPoint, 
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	public void pointCutBefore(JoinPoint joinPoint) {

	}

	public void pointCutAfterThrowing(JoinPoint joinPoint, Throwable error) {
		log.info("logAfterThrowing() is running!");
		log.info("hijacked : " + joinPoint.getSignature().getName());
		log.info("Exception : " + error);
		log.info("******");
	}

}