package com.gsitm.spring.board.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.board.vo.BoardVO;

/**
 * @programName : BoardRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 차주현 2018. 6. 14. 타입별 찾기
 */ 
@Repository
public interface BoardRepository extends JpaRepository<BoardVO, Long> {
	public List<BoardVO> findByBoardType(int boardType);
	public List<BoardVO> findTop3ByBoardType(int type, Sort sort);
}
