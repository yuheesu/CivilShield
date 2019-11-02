package com.gsitm.spring.item.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.item.vo.ItemVO;
import com.gsitm.spring.room.vo.RoomVO;

/**
 * @programName : ItemRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 유희수         2018.06.14 아이템리스트불러오기
 */ 
@Repository
public interface ItemRepository extends JpaRepository<ItemVO, Long> {
	public List<ItemVO> findByRoomVO(RoomVO roomVO);
	/*
	 * RoomVO roomVO = new RoomVO();
	 * roomVO.setRoomNo(1L);
	 * List<ItemVO> list = itemRepository.findByRoomVO(roomVO);
	 * */
}
