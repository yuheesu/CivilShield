package com.gsitm.spring.res.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.dept.vo.DeptVO;
import com.gsitm.spring.res.vo.ResEmpVO;
import com.gsitm.spring.res.vo.ResVO;


/**
 * @programName : ResEmpRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Repository
public interface ResEmpRepository extends JpaRepository<ResEmpVO, Long> {
	@Query("select deptVO.deptNo from ResEmpVO r where r.resVO = :resVO group by r.deptVO.deptNo")
	public List<Long> findDeptGroupByResVO(@Param("resVO") ResVO resVO);
	
	@Query("select r.deptVO from ResEmpVO r where r.resVO = :resVO group by r.deptVO")
	public List<DeptVO> findDeptGroupByResVOTEST(@Param("resVO") ResVO resVO);
	
	
	@Transactional
	@Query(value="delete from TB_RES_EMP where RES_NO = :resNo", nativeQuery=true)
	public void deleteUsingResNo(@Param("resNo") Long resNo);
	
	@Transactional
	@Query
	public void deleteByResVO(ResVO resVO);
	
}
