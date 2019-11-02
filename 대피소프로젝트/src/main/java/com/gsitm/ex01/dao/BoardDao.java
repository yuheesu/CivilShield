package com.gsitm.ex01.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.gsitm.ex01.common.Common;
import com.gsitm.ex01.mapper.BoardMapper;
import com.gsitm.ex01.vo.BoardVO;
import com.gsitm.ex01.vo.LoginVO;
import com.gsitm.ex01.vo.OuterVO;
import com.gsitm.ex01.vo.ShelterVO;

@Repository(value = "boardDao")
public class BoardDao{
	private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);

	@Autowired
	protected SqlSession sqlSession;
	
	public List<BoardVO> readList(BoardVO boardVO) {
		List<BoardVO> list = null;
		try{			
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			list = boardMapper.readList(boardVO);
		}
		catch(Exception e){
			logger.debug(" [ERROR] "+e);
		}		
		return list;
	}	
		

	public BoardVO read(BoardVO boardVO) {
		BoardVO vo = null;
		try{			
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			vo = boardMapper.read(boardVO);
		}
		catch(Exception e){
			logger.debug(" [ERROR] "+e);
		}		
		return vo;
	}


	public int count() {
		int cnt = 0;
		try{			
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			cnt = boardMapper.count();
		}
		catch(Exception e){
			logger.debug(" [ERROR] "+e);
		}		
		return cnt;
	}


	public List<BoardVO> userList(Common data) {
		List<BoardVO> list = null;
		try {
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			list = boardMapper.userList(data);
		} catch(Exception e) {
			logger.debug(" [ERROR] "+e);
		}
		return list;
	}


	public int filterCount(Common data) {
		int cnt = 0;
		try {
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			cnt = boardMapper.filterCount(data);
		} catch(Exception e) {
			logger.debug(" [ERROR] "+e);
		}
		return cnt;
	
	}	
	
	public void insertShelter(ShelterVO shelterVO) {
		try {
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			boardMapper.insertShelter(shelterVO);
		}
		catch(Exception e) {
			logger.debug(" [ERROR] "+e);
		}

	}


	public List<ShelterVO> readshelter(ShelterVO shelterVO) {
		List<ShelterVO> list = null;
		try{			
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			list = boardMapper.readshelter(shelterVO);
		}
		catch(Exception e){
			logger.debug(" [ERROR] "+e);
		}		
		return list;
	}


	public ShelterVO view(ShelterVO shelterVO) {
		ShelterVO vo = null;
		try{			
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			vo = boardMapper.view(shelterVO);
		}
		catch(Exception e){
			logger.debug(" [ERROR] "+e);
		}		
		return vo;
	}


	public List<ShelterVO> readChart(ShelterVO shelterVO) {
		List<ShelterVO> list = null;
		try{			
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			list = boardMapper.readChart(shelterVO);
		}
		catch(Exception e){
			logger.debug(" [ERROR] "+e);
		}		
		return list;
	}


	public List<OuterVO> readouter(OuterVO outerVO) {
		List<OuterVO> list = null;
		try{			
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			list = boardMapper.readouter(outerVO);
		}
		catch(Exception e){
			logger.debug(" [ERROR] "+e);
		}		
		return list;
	}


	public List<ShelterVO> readSeoul(ShelterVO shelterVO) {
		List<ShelterVO> list = null;
		try{			
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			list = boardMapper.readSeoul(shelterVO);
		}
		catch(Exception e){
			logger.debug(" [ERROR] "+e);
		}		
		return list;
	}
	
//	public LoginVO login(String id) {
//		LoginVO vo = null;
//		try{			
//			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
//			vo = boardMapper.login(id);
//		}
//		catch(Exception e){
//			logger.debug(" [ERROR] "+e);
//		}		
//		return vo;
//	}

}
