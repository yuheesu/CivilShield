package com.gsitm.spring.dept.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.dept.vo.DeptVO;

/**
 * @programName : DeptRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 유희수	   2018.06.14 부서이름으로 부서조회
 */ 
@Repository
public interface DeptRepository extends JpaRepository<DeptVO, Long> {
	public List<DeptVO> findByDeptNm(String deptNm);
	public List<DeptVO> findByDeptNmLike(String deptNm);
	
	@Transactional
	@Modifying
	@Query(value="update TB_DEPARTMENT set DEPT_BUDGET = DEPT_BUDGET + :amount where DEPT_NO = :deptNo", nativeQuery=true)
	public void increaseBudget(@Param("deptNo") Long deptNo, @Param("amount") Long amount);
	
	@Transactional
	@Modifying
	@Query(value="update TB_DEPARTMENT set DEPT_BUDGET = DEPT_BUDGET - :amount where DEPT_NO = :deptNo", nativeQuery=true)
	public void decreaseBudget(@Param("deptNo") Long deptNo, @Param("amount") Long amount);

}
