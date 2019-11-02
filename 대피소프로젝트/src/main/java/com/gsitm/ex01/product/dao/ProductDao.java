package com.gsitm.ex01.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.ex01.product.mapper.ProductMapper;
import com.gsitm.ex01.product.vo.ProductVO;

@Repository(value = "productDao")
public class ProductDao {
	private static final Logger logger = LoggerFactory.getLogger(ProductDao.class);
	
	@Autowired
	protected SqlSession sqlSession;
	
	public List<ProductVO> readList(ProductVO productVO) {
		List<ProductVO> list = null;
		try {
			ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
			list = productMapper.readList(productVO);
		} catch (Exception e) {
			logger.debug("[ERROR] " + e);
		}
		return list;
	}

}
