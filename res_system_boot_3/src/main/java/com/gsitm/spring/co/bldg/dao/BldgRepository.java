package com.gsitm.spring.co.bldg.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.co.bldg.vo.BldgVO;

/**
 * @programName : BldgRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Repository
public interface BldgRepository extends JpaRepository<BldgVO, Long> {
	public List<BldgVO> findByBldgNm(String bldgNm);
	public List<BldgVO> findByBldgNmLike(String bldgNm);
}
