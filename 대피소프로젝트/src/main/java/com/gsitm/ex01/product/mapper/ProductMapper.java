package com.gsitm.ex01.product.mapper;

import java.util.List;

import com.gsitm.ex01.product.vo.ProductVO;

public interface ProductMapper {
	
	List<ProductVO> readList(ProductVO vo);
	
}