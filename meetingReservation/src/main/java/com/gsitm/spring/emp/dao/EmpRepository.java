package com.gsitm.spring.emp.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.dept.vo.DeptVO;
import com.gsitm.spring.emp.vo.EmpVO;

/**
 * @programName : EmpRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Repository
public interface EmpRepository extends JpaRepository<EmpVO, Long> {
	public EmpVO findByEmpId(String empId);
	public List<EmpVO> findByDeptVO(DeptVO deptVO);
	public List<EmpVO> findByEmpNmLike(String empNm);
	
	@Query(value="SELECT DEPT_NO FROM TB_EMPLOYEE WHERE EMP_NO = :empNo", nativeQuery=true)
	public Long getDeptNoByEmpNo(@Param("empNo") Long empNo);
	
	@Query(value="SELECT * FROM TB_EMPLOYEE WHERE DEPT_NO = :deptNo", nativeQuery=true)
	public List<EmpVO> getEmpsByDeptNo(@Param("deptNo") Long deptNo);
}
