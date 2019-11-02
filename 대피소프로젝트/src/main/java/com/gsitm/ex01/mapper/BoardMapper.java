package com.gsitm.ex01.mapper;

import java.util.List;

import com.gsitm.ex01.common.Common;
import com.gsitm.ex01.vo.BoardVO;
import com.gsitm.ex01.vo.LoginVO;
import com.gsitm.ex01.vo.OuterVO;
import com.gsitm.ex01.vo.ShelterVO;

public interface BoardMapper {

	List<BoardVO> readList(BoardVO vo);
	BoardVO read(BoardVO vo);
	ShelterVO view(ShelterVO vo);
	int count();
	List<BoardVO> userList(Common data);
	int filterCount(Common data);
	void insertShelter(ShelterVO shelterVO);
	List<ShelterVO> readshelter(ShelterVO shelterVO);
//	LoginVO login(String id);
	List<ShelterVO> readChart(ShelterVO shelterVO);
	List<OuterVO> readouter(OuterVO outerVO);
	List<ShelterVO> readSeoul(ShelterVO shelterVO);


}
