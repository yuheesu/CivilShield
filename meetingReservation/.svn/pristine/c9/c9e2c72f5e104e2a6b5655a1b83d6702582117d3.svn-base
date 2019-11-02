package com.gsitm.spring.scheduler;

import java.util.Calendar;
import java.util.Locale;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//@Component
public class ExBatchJob {
	
	//@Resource(name = "boardDao_1072")
	//private BoardDao_1072 boardDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ExBatchJob.class);

	public void doBatch() {

		logger.info("=ExBatchJob 배치============"
				+Calendar.getInstance(Locale.KOREA).get(Calendar.HOUR_OF_DAY)+"시="
				+Calendar.getInstance(Locale.KOREA).get(Calendar.MINUTE)+"분=");
		
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ExBatchJob proc = new ExBatchJob();
		proc.doBatch();
	}
}
