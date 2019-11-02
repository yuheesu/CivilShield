package com.gsitm.spring.room.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.room.vo.RoomImageVO;
import com.gsitm.spring.room.vo.RoomVO;

/**
 * @programName : RoomImageRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 유희수	  2018.6.11   룸이미지갖고오기
 */ 
@Repository
public interface RoomImageRepository extends JpaRepository<RoomImageVO, Long> {
	public RoomImageVO findByRoomVO(RoomVO roomVO);
	
	public List<RoomImageVO> findAllByRoomVO(RoomVO roomVO);

	public RoomImageVO findTop1ByRoomVO(RoomVO roomVO);
	
	public List<RoomImageVO> findByRoomImgNo(Long RoomImgNo);
}
