package com.gsitm.spring.common.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.common.vo.ImageVO;
import com.gsitm.spring.room.vo.RoomVO;

@Repository
public interface ImageRepository extends JpaRepository<ImageVO, Integer> {
	//public void findByRoomImgNo(int roomImgNo);
	//public List<ImageVO> findByRoomImgNo(RoomVO roomVO);
//	@Query(value = "SELECT * FROM RoomImageVO WHERE roomImgNo = ?1", nativeQuery = true)
	public ImageVO findByRoomImgNo(Integer roomImgNo);
	boolean existsByRoomImgNo(Integer roomImgNo);
}