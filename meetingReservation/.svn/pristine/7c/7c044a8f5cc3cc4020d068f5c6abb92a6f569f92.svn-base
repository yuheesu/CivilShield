package com.gsitm.spring.room.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.co.bldg.vo.BldgVO;
import com.gsitm.spring.room.vo.RoomVO;

/**
 * @programName : RoomRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Repository
public interface RoomRepository extends JpaRepository<RoomVO, Long> {

	List<RoomVO> findByRoomNmLike(String roomNm);
	List<RoomVO> findByBldgVOAndRoomNmLike(BldgVO bldgVO, String roomNm);
	long countByBldgVO(BldgVO bldgVO);

}
