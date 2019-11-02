package com.gsitm.ex01.product.controller;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gsitm.ex01.product.service.ProductService;
import com.gsitm.ex01.product.vo.ProductVO;

@Controller
public class ProductController{
	
	@Resource(name = "productService")
	private ProductService productService;
    // productService에 스프링 빈을 가져와서 주입한다.

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value="/product.do", method=RequestMethod.GET)
	public String Info(HttpServletRequest request, HttpServletResponse response,
			HashMap<String, String> param, Model model, ProductVO productVO) throws Exception {
		
		List<ProductVO> productModelList = productService.readList(productVO);
		
		model.addAttribute("productModelList", productModelList);
		model.addAttribute("ProductVO", productVO);
		
		/*for(int i=0; i<productModelList.size(); i++) {
			logger.info("getProductSeq=" + productModelList.get(i).getProductNo());
			logger.info("getName=" + productModelList.get(i).getProductName());
		}*/
		
		return "/product/productList";
	}
}
