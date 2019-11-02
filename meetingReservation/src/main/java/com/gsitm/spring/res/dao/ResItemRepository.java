package com.gsitm.spring.res.dao;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.res.vo.ResItemVO;
import com.gsitm.spring.res.vo.ResVO;


/**
 * @programName : ResItemRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Repository
public interface ResItemRepository extends JpaRepository<ResItemVO, Long> {
	
	@Transactional
	@Query(value="delete from TB_RES_ITEM where RES_NO = :resNo", nativeQuery=true)
	public void deleteUsingResNo(@Param("resNo") Long resNo);
	
	@Transactional
	@Query
	public void deleteByResVO(ResVO resVO);
}
