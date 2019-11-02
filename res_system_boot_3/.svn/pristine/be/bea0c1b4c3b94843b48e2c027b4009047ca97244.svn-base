package com.gsitm.spring.room.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gsitm.spring.co.bldg.dao.BldgRepository;
import com.gsitm.spring.co.bldg.vo.BldgVO;
import com.gsitm.spring.item.dao.ItemRepository;
import com.gsitm.spring.item.vo.ItemVO;
import com.gsitm.spring.room.dao.RoomImageRepository;
import com.gsitm.spring.room.dao.RoomRepository;
import com.gsitm.spring.room.vo.RoomImageVO;
import com.gsitm.spring.room.vo.RoomVO;

import oracle.net.aso.d;

/**
 * @programName : DefaultSetController.java
 * @author      : 유희수
 * @date        : 2018. 6. 9. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Controller
public class RoomController {

	@Autowired
	private RoomRepository roomRepository;
	@Autowired
	private BldgRepository bldgRepository;
	@Autowired
	private RoomImageRepository roomImageRepository;
	@Autowired
	private ItemRepository itemRepository;

	@RequestMapping(value="/room/roomDetail.do", method= RequestMethod.GET)
	public String roomDetail(Model model,RoomVO roomVO, long roomNo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(request.getParameter("roomNo"));
		RoomVO roomModel = new RoomVO();
		List<RoomImageVO> roomImgList = new ArrayList<>();
		List<RoomVO> roomList = new ArrayList<>();
		List<BldgVO> bldgList = new ArrayList<>();
		List<ItemVO> itemList = new ArrayList<>();
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+ roomNo);
//		roomModel = roomRepository.findByRoomNo(roomVO.getRoomNo());
		
		roomModel=roomRepository.getOne(roomNo);

		System.out.println("사이즈는~~~~~~~~~~~~~~~~~~~??"+itemList.size());
		
		roomList = roomRepository.findAll();
		model.addAttribute("roomList",roomList);
		bldgList = bldgRepository.findAll();
		model.addAttribute("bldgList",bldgList);
		
		model.addAttribute("room", roomModel);
		roomImgList = roomImageRepository.findAllByRoomVO(roomModel);
		
		//roomImgList = roomImageRepository.findByRoomVO(roomModel);
		model.addAttribute("roomImgList", roomImgList);
		itemList = itemRepository.findByRoomVO(roomModel);
		model.addAttribute("itemList",itemList);
	 //   System.out.println("sssssssssssssssssss"+roomModel);

/*		
	      response.setContentType("image/jpeg");
	      
	      //System.out.println("들어옴 -> " + roomImageVO.getRoomVO().toString());

	      InputStream in = new ByteArrayInputStream(roomImgList.get(0).getImage());
	      IOUtils.copy(in, response.getOutputStream());*/
		return "room/roomDetail";
	}
	
	@RequestMapping(value="/room/roomCategory.do", method= RequestMethod.GET)
	public String roomCategory(Model model, Model model2, Model model3) {
		List<RoomVO> roomList = new ArrayList<>();
		List<RoomImageVO> roomImgList = new ArrayList<>();
		List<BldgVO> bldgList = new ArrayList<>();
		
		roomList = roomRepository.findAll();
		model.addAttribute("roomList", roomList);
		
		bldgList = bldgRepository.findAll();
		model2.addAttribute("bldgList", bldgList);
		
		roomImgList = roomImageRepository.findAll();
		model3.addAttribute("roomImgList", roomImgList);
		
		return "room/roomCategory";
	}
    
    @RequestMapping(value="/viewroomImage.do")
    public void roomImageView(HttpServletRequest request, HttpServletResponse response) throws IOException {
       
       List<RoomImageVO> roomImageVOList = new ArrayList<>();
       
    //   roomImageVOList.get(0).setRoomImgNo(Long.parseLong(request.getParameter("roomImgNo")));
       
       roomImageVOList = roomImageRepository.findByRoomImgNo(Long.parseLong(request.getParameter("roomImgNo")));
       
       //roomImageVO = roomImageRepository.getOne(tempNo);
       response.setContentType("image/jpeg");
       
       //System.out.println("들어옴 -> " + roomImageVO.getRoomVO().toString());

       InputStream in = new ByteArrayInputStream(roomImageVOList.get(0).getImage());
       IOUtils.copy(in, response.getOutputStream());
    }
}
