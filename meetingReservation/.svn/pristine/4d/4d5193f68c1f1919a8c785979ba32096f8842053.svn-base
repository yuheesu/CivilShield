package com.gsitm.spring.res.dao;


import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.gsitm.spring.emp.vo.EmpVO;
import com.gsitm.spring.res.vo.ResVO;
import com.gsitm.spring.room.vo.RoomVO;


/**
 * @programName : ResRepository.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 유희수	   2018.6.12  직원으로 예약현황불러오기
 */ 
@Repository
public interface ResRepository extends JpaRepository<ResVO, Long> {
	public List<ResVO> findByEmpVO(EmpVO empVO);
	public List<ResVO> findTop3ByEmpVO(EmpVO empVO, Sort sort);
	public List<ResVO> findByRoomVOAndStartDtBetween(RoomVO roomVO, Date startDt, Date endDt);
	public List<ResVO> findByStartDtBetween(Date startDt, Date endDt);
	
	@Transactional
	@Modifying
	@Query(value="update TB_RESERVATION set RES_STATE = :resState where RES_NO = :resNo", nativeQuery=true)
	public void updateState(@Param("resNo") Long resNo, @Param("resState") int resState);
	
	@Query(value="select * from TB_RESERVATION res left outer join TB_ROOM rm on res.ROOM_NO = rm.ROOM_NO where res.ROOM_NO = :roomNo and res.START_DT between to_date(:startDt, 'YYYY-MM-DD') and to_date(:endDt, 'YYYY-MM-DD') and res.END_DT between to_date(:startDt, 'YYYY-MM-DD') and to_date(:endDt, 'YYYY-MM-DD')", nativeQuery=true)
	public List<ResVO> getResThisRoomAndDate(@Param("roomNo") Long roomNo, @Param("startDt") String startDt, @Param("endDt") String endDt);
	
	@Query(value="select * from TB_RESERVATION res left outer join TB_ROOM rm on res.ROOM_NO = rm.ROOM_NO where res.ROOM_NO = :roomNo and (res.START_DT between to_date(:startDt, 'YYYYMMDDHH24MI') and to_date(:endDt, 'YYYYMMDDHH24MI') or res.END_DT between to_date(:startDt, 'YYYYMMDDHH24MI') and to_date(:endDt, 'YYYYMMDDHH24MI') or to_date(:startDt, 'YYYYMMDDHH24MI') between res.START_DT AND res.END_DT)", nativeQuery=true)
	public List<ResVO> getResThisRoomAndDateMinutes(@Param("roomNo") Long roomNo, @Param("startDt") String startDt, @Param("endDt") String endDt);
	
	@Query(value="select count(res.RES_NO) from TB_RESERVATION res left outer join TB_ROOM rm on res.ROOM_NO = rm.ROOM_NO where res.ROOM_NO = :roomNo and (to_date(:startDt, 'YYYYMMDDHH24MI') between res.START_DT AND res.END_DT or to_date(:endDt, 'YYYYMMDDHH24MI') between res.START_DT AND res.END_DT or res.START_DT between to_date(:startDt, 'YYYYMMDDHH24MI') and to_date(:endDt, 'YYYYMMDDHH24MI') or res.END_DT between to_date(:startDt, 'YYYYMMDDHH24MI') and to_date(:endDt, 'YYYYMMDDHH24MI'))", nativeQuery=true)
	public Long getResThisRoomAndDateMinutesExists(@Param("roomNo") Long roomNo, @Param("startDt") String startDt, @Param("endDt") String endDt);

	@Query(value="select * from TB_RESERVATION res where res.START_DT between to_date(:startDt, 'YYYY-MM-DD') and to_date(:endDt, 'YYYY-MM-DD') and res.END_DT between to_date(:startDt, 'YYYY-MM-DD') and to_date(:endDt, 'YYYY-MM-DD')", nativeQuery=true)
	public List<ResVO> getResThisDate(@Param("startDt") String startDt, @Param("endDt") String endDt);
	
	@Query(value="select * from TB_RESERVATION res where res.START_DT between to_date(:startDt, 'YYYYMMDDHH24MI') and to_date(:endDt, 'YYYYMMDDHH24MI')", nativeQuery=true)
	public List<ResVO> getResThisDateMinutesStart(@Param("startDt") String startDt, @Param("endDt") String endDt);
	
	@Query(value="select * from TB_RESERVATION res where res.END_DT between to_date(:startDt, 'YYYYMMDDHH24MI') and to_date(:endDt, 'YYYYMMDDHH24MI')", nativeQuery=true)
	public List<ResVO> getResThisDateMinutesEnd(@Param("startDt") String startDt, @Param("endDt") String endDt);
	
	@Transactional
	@Query(value="delete from TB_RESERVATION where RES_NO = :resNo", nativeQuery=true)
	public void deleteUsingResNo(@Param("resNo") Long resNo);
	
	@Transactional
	@Query
	public void deleteByResNo(Long resNo);
}
