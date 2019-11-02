package com.gsitm.ex01.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.gsitm.ex01.controller.BoardController;

@Controller
public class DownloadController implements ApplicationContextAware {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	private WebApplicationContext context = null;

	@RequestMapping("/file/{fileId}")
	public ModelAndView download(@PathVariable String fileId, HttpServletResponse response) throws IOException {
		logger.info(fileId);
		File downloadFile = getFile(fileId);
		if (downloadFile == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
		return new ModelAndView("DownloadView", "downloadFile", downloadFile);
	}

	private File getFile(String fileId) {
		String baseDir = context.getServletContext().getRealPath("/WEB-INF/files");
		if (fileId.equals("1"))
			return new File(baseDir, "객체지향JCO14회.zip");
		return null;
	}

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext) applicationContext;
	}

}
