package com.gsitm.ex01.product.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.gsitm.ex01.product.dao.ProductDao;
import com.gsitm.ex01.product.vo.ProductVO;

@Service
public class ProductService {
	
	@Resource(name = "productDao")
	private ProductDao productDao;
	
	public List<ProductVO> readList(ProductVO supportModel) throws Exception{
		
		List<ProductVO> resultList = productDao.readList(supportModel);
		return resultList;
	}
	
}
