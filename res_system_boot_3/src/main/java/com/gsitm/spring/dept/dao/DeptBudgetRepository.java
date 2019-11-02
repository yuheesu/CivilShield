package com.gsitm.spring.dept.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.dept.vo.DeptBudgetVO;

/**
 * @programName : DeptBudgetRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Repository
public interface DeptBudgetRepository extends JpaRepository<DeptBudgetVO, Long> {
}
