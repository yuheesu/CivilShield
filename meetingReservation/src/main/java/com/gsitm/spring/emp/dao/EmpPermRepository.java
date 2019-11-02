package com.gsitm.spring.emp.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.emp.vo.EmpPermVO;
import com.gsitm.spring.emp.vo.EmpVO;

/**
 * @programName : PasswordRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Repository
public interface EmpPermRepository extends JpaRepository<EmpPermVO, Long> {
	public List<EmpPermVO> findByEmpVO(EmpVO empVO);
	public List<EmpPermVO> findByPerm(String perm);
}
