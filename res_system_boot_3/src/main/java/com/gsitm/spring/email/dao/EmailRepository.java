package com.gsitm.spring.email.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.email.vo.EmailVO;

/**
 * @programName : EmailRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Repository
public interface EmailRepository extends JpaRepository<EmailVO, Long> {
}
