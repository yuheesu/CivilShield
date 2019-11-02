package com.gsitm.spring.common.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
 * @author		: 유희수
 * @date		  : 2018. 6. 9. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Controller
public class AdminController {

	@Autowired
	private RoomRepository roomRepository;
	@Autowired
	private BldgRepository bldgRepository;
	@Autowired
	private RoomImageRepository roomImageRepository;
	@Autowired
	private ItemRepository itemRepository;
	
	@RequestMapping(value="/admin/bldgAdd.do", method= RequestMethod.GET )
	public String BldgAdd(HttpServletRequest request) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format ( currentTime );
		request.setAttribute("mTime", mTime);
		
		return "admin/bldgInsert";
   }
   
   @RequestMapping(value="/admin/bldgInsert.do", method= RequestMethod.POST )
   public String BldgInsert(HttpServletRequest request) {
		BldgVO bldgVO = new BldgVO();
		
		String bldgNm = request.getParameter("bldgNm");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		String bldgAddr = request.getParameter("bldgAddr");
		String deleteYn = "N";
		
		bldgVO.setBldgNm(bldgNm);						   // 근무지명 입력 값
		bldgVO.setLatitude(Double.parseDouble(latitude));   // 근무지 건물 위도 입력 값
		bldgVO.setLongitude(Double.parseDouble(longitude));   // 근무지 건물 경도 입력 값
		bldgVO.setBldgAddr(bldgAddr);						// 근무지 주소 입력 값
		bldgVO.setDeleteYn(deleteYn);						// default N
		   
		bldgRepository.save(bldgVO);
		System.out.println(bldgVO.toString());
		System.out.println("빌딩 들어간다.");
		
		return "admin/managementMain";
   }
   
   @RequestMapping(value="/admin/management.do", method= RequestMethod.GET )
   public String managementBldg(HttpServletRequest request, Model model, Model model2, Model model3) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format ( currentTime );
		request.setAttribute("mTime", mTime);
		
		List<BldgVO> bldgList = bldgRepository.findAll();
		model.addAttribute("bldgList", bldgList);
		
		List<RoomVO> roomList = roomRepository.findAll();
		model2.addAttribute("roomList", roomList);
		
		List<ItemVO> itemList = itemRepository.findAll();
		model3.addAttribute("itemList", itemList);
		
		return "admin/managementMain";
	}
	
	@RequestMapping(value="/admin/roomInsert.do", method= RequestMethod.GET )
	public String roomInsert(Model model, HttpServletRequest request) {
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format ( currentTime );
		request.setAttribute("mTime", mTime);
		
		String curState = request.getParameter("curState");
		request.setAttribute("curState", curState);
		
		List<BldgVO> bldgList = bldgRepository.findAll();
		model.addAttribute("bldgList", bldgList);
		
		return "admin/roomInsert";
	}
	
	@RequestMapping(value="/viewImage.do")
	public void imageView(HttpServletRequest request, HttpServletResponse response) throws IOException {
		RoomImageVO roomImageVO;
		
		//roomImageVO.setRoomImgNo(Long.parseLong(request.getParameter("roomNo")));
		
		RoomVO roomVO = new RoomVO();
		roomVO.setRoomNo(Long.parseLong(request.getParameter("roomNo")));
		
		roomImageVO = roomImageRepository.findTop1ByRoomVO(roomVO);
		
		//roomImageVO = roomImageRepository.getOne(tempNo);
		response.setContentType("image/jpeg");
		
		//System.out.println("들어옴 -> " + roomImageVO.getRoomVO().toString());

		InputStream in = new ByteArrayInputStream(roomImageVO.getImage());
		IOUtils.copy(in, response.getOutputStream());
	}
	
	
	@RequestMapping(value="/roomManagementDetail.do")
	public void roomManageDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		RoomImageVO roomImageVO;
		
		//roomImageVO.setRoomImgNo(Long.parseLong(request.getParameter("roomNo")));
		
		RoomVO roomVO = new RoomVO();
		roomVO.setRoomNo(Long.parseLong(request.getParameter("roomNo")));
		
		roomImageVO = roomImageRepository.findTop1ByRoomVO(roomVO);
		
		//roomImageVO = roomImageRepository.getOne(tempNo);
		response.setContentType("image/jpeg");
		
		//System.out.println("들어옴 -> " + roomImageVO.getRoomVO().toString());

		InputStream in = new ByteArrayInputStream(roomImageVO.getImage());
		IOUtils.copy(in, response.getOutputStream());
	}
	
	@RequestMapping(value="/admin/insertRoom.do", method= RequestMethod.POST )
	public String insertRoom(HttpServletRequest request, MultipartHttpServletRequest multi) throws IllegalStateException, IOException {	
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format ( currentTime );
//			request.setAttribute("mTime", mTime);
		BldgVO bldgVO = new BldgVO();
		// roomVO 삽입객체
		String bldgNm = request.getParameter("bldgNm");
		
		List<BldgVO> bldgRow = bldgRepository.findByBldgNm(bldgNm);
		
		bldgVO = bldgRow.get(0);
		String roomNm = request.getParameter("roomNm");
		String roomType = request.getParameter("roomType");
		String roomExplain = request.getParameter("roomExplain");
		String useNetworkYn = request.getParameter("useNetworkYn");
		String roomCapacity = request.getParameter("roomCapacity");
		String roomArea = request.getParameter("roomArea");
		String costPerHour = request.getParameter("costPerHour");
		
		// 입력된 아이템의 갯수
		String itemTableLengthStr = request.getParameter("itemTableLength");
		int itemTableLength = Integer.parseInt(itemTableLengthStr);
		
		// 아이템 추가버튼 클릭 횟수
		String itemAddLengthStr = request.getParameter("itemAddLength");
		int itemAddLength = Integer.parseInt(itemAddLengthStr);
		
		// 업로드된 이미지 갯수
		String imgTableLengthStr = request.getParameter("imgTableLength");
		int imgTableLength = Integer.parseInt(imgTableLengthStr);
		
		// 이미지 추가버튼 클릭 횟수
		String imgAddLengthStr = request.getParameter("imgAddLength");
		int imgAddLength = Integer.parseInt(imgAddLengthStr);
		
		// itemVO 삽입객체
		List<String> itemNmList = new ArrayList<String>();
		List<String> useCostList = new ArrayList<String>();
		
		// itemVO 리스트
		List<ItemVO> itemVOList = new ArrayList<ItemVO>();
		
		// roomImgVO 삽입 객체
		List<byte[]> imgList = new ArrayList<byte[]>();
		
		// roomImageVO 리스트
		List<RoomImageVO> roomImageVOList = new ArrayList<RoomImageVO>();
		
		for(int i = 0; i < itemAddLength; i++) {
			if(request.getParameter("itemNm" + i) != null) {
				itemNmList.add(request.getParameter("itemNm" + i));
				useCostList.add(request.getParameter("useCost" + i));
			}
		}
		
		String regDt = mTime;

    	RoomVO roomVO = new RoomVO();
    	
    	roomVO.setBldgVO(bldgVO);
    	roomVO.setRoomNm(roomNm);
    	roomVO.setRoomType(Integer.parseInt(roomType));
    	roomVO.setUseNetworkYn(useNetworkYn);
    	roomVO.setRoomCapacity(Integer.parseInt(roomCapacity));
    	roomVO.setRoomArea(Integer.parseInt(roomArea));
    	roomVO.setCostPerHour(Integer.parseInt(costPerHour));
    	roomVO.setRoomExplain(roomExplain);
    	
    	System.out.println("Room 데이터 setting 완료");
    	
    	System.out.println("itemVO크기 : " + itemVOList.size());
    	
    	for(int i = 0; i < itemTableLength; i++) {
    		ItemVO itemVO = new ItemVO();
    		
		  	itemVO.setItemNm(itemNmList.get(i));
		  	itemVO.setUseCost(Integer.parseInt(useCostList.get(i)));
		  	itemVO.setRegDt(currentTime);
    		
		  	itemVOList.add(itemVO);
    	}
	    
    	String savePath = "C:\\Spring\\upload\\";
    	
    	for(int i = 0; i < imgAddLength; i++) {
    		if(multi.getFile("imgFile" + i) != null) {
    			File file;
    			
    			byte[] fileByte = null;
    			
    			file = new File(savePath + multi.getFile("imgFile" + i).getOriginalFilename());
    			multi.getFile("imgFile" + i).transferTo(file);
    			ByteArrayOutputStream bout = new ByteArrayOutputStream();
    			  FileInputStream fin = new FileInputStream(file);

    			  byte[] buf = new byte[1024];
    			  int read = 0;
    			  while((read=fin.read(buf,0,buf.length))!=-1){
    			  	bout.write(buf,0,read);
    			  }
    			  fin.close();

    			  fileByte = bout.toByteArray();
    			  
    			  imgList.add(fileByte);
    			  
    			  RoomImageVO roomImageVO = new RoomImageVO();
    			  roomImageVO.setImage(fileByte);
    			  roomImageVO.setRoomVO(roomVO);
    			  
    			  roomImageVOList.add(roomImageVO);
    			//byte[] fileByte = file.getBytes();
    			  System.out.println("여기야!!! : " + i);
    			  //roomImageVO.setImage(fileByte);
    		}
    	}
    	
    	roomRepository.save(roomVO);
    	for(int i = 0; i < itemTableLength; i++) {
    		itemVOList.get(i).setRoomVO(roomVO);
    		itemRepository.save(itemVOList.get(i));
    	}
	    	
    	for(int i =0; i < imgTableLength; i++) {
    		roomImageRepository.saveAndFlush(roomImageVOList.get(i));
    	}

	    return "redirect:/admin/management.do";
	}
	
	@GetMapping("/roomDetail.do")
	public String roomDetail(Model model) {
		
		return "/room/roomDetail";
	}
	
	
	
	@RequestMapping(value="/modifyRoom.do", method= RequestMethod.POST )
	public String modifyRoom(HttpServletRequest request, MultipartHttpServletRequest multi) throws IllegalStateException, IOException {	
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format ( currentTime );
//			request.setAttribute("mTime", mTime);
		BldgVO bldgVO = new BldgVO();
		// roomVO 삽입객체
		String bldgNm = request.getParameter("bldgNm");
		
		List<BldgVO> bldgRow = bldgRepository.findByBldgNm(bldgNm);
		
		bldgVO = bldgRow.get(0);
		String roomNm = request.getParameter("roomNm");
		String roomType = request.getParameter("roomType");
		String roomExplain = request.getParameter("roomExplain");
		String useNetworkYn = request.getParameter("useNetworkYn");
		String roomCapacity = request.getParameter("roomCapacity");
		String roomArea = request.getParameter("roomArea");
		String costPerHour = request.getParameter("costPerHour");
		
		// 입력된 아이템의 갯수
		String itemTableLengthStr = request.getParameter("itemTableLength");
		int itemTableLength = Integer.parseInt(itemTableLengthStr);
		
		// 아이템 추가버튼 클릭 횟수
		String itemAddLengthStr = request.getParameter("itemAddLength");
		int itemAddLength = Integer.parseInt(itemAddLengthStr);
		
		// 업로드된 이미지 갯수
		String imgTableLengthStr = request.getParameter("imgTableLength");
		int imgTableLength = Integer.parseInt(imgTableLengthStr);
		
		// 이미지 추가버튼 클릭 횟수
		String imgAddLengthStr = request.getParameter("imgAddLength");
		int imgAddLength = Integer.parseInt(imgAddLengthStr);
		
		// itemVO 삽입객체
		List<String> itemNmList = new ArrayList<String>();
		List<String> useCostList = new ArrayList<String>();
		
		// itemVO 리스트
		List<ItemVO> itemVOList = new ArrayList<ItemVO>();
		
		// roomImgVO 삽입 객체
		List<byte[]> imgList = new ArrayList<byte[]>();
		
		// roomImageVO 리스트
		List<RoomImageVO> roomImageVOList = new ArrayList<RoomImageVO>();
		
		for(int i = 0; i < itemAddLength; i++) {
			if(request.getParameter("itemNm" + i) != null) {
				itemNmList.add(request.getParameter("itemNm" + i));
				useCostList.add(request.getParameter("useCost" + i));
			}
		}
		
		String regDt = mTime;

    	RoomVO roomVO = new RoomVO();
    	
    	roomVO.setBldgVO(bldgVO);
    	roomVO.setRoomNm(roomNm);
    	roomVO.setRoomType(Integer.parseInt(roomType));
    	roomVO.setUseNetworkYn(useNetworkYn);
    	roomVO.setRoomCapacity(Integer.parseInt(roomCapacity));
    	roomVO.setRoomArea(Integer.parseInt(roomArea));
    	roomVO.setCostPerHour(Integer.parseInt(costPerHour));
    	roomVO.setRoomExplain(roomExplain);
    	
    	System.out.println("Room 데이터 setting 완료");
    	
    	System.out.println("itemVO크기 : " + itemVOList.size());
    	
    	for(int i = 0; i < itemTableLength; i++) {
    		ItemVO itemVO = new ItemVO();
    		
		  	itemVO.setItemNm(itemNmList.get(i));
		  	itemVO.setUseCost(Integer.parseInt(useCostList.get(i)));
		  	itemVO.setRegDt(currentTime);
    		
		  	itemVOList.add(itemVO);
    	}
	    
    	String savePath = "C:\\Spring\\upload\\";
    	
    	for(int i = 0; i < imgAddLength; i++) {
    		if(multi.getFile("imgFile" + i) != null) {
    			File file;
    			
    			byte[] fileByte = null;
    			
    			file = new File(savePath + multi.getFile("imgFile" + i).getOriginalFilename());
    			multi.getFile("imgFile" + i).transferTo(file);
    			ByteArrayOutputStream bout = new ByteArrayOutputStream();
    			  FileInputStream fin = new FileInputStream(file);

    			  byte[] buf = new byte[1024];
    			  int read = 0;
    			  while((read=fin.read(buf,0,buf.length))!=-1){
    			  	bout.write(buf,0,read);
    			  }
    			  fin.close();

    			  fileByte = bout.toByteArray();
    			  
    			  imgList.add(fileByte);
    			  
    			  RoomImageVO roomImageVO = new RoomImageVO();
    			  roomImageVO.setImage(fileByte);
    			  roomImageVO.setRoomVO(roomVO);
    			  
    			  roomImageVOList.add(roomImageVO);
    			//byte[] fileByte = file.getBytes();
    			  System.out.println("여기야!!! : " + i);
    			  //roomImageVO.setImage(fileByte);
    		}
    	}
    	
    	roomRepository.save(roomVO);
    	for(int i = 0; i < itemTableLength; i++) {
    		itemVOList.get(i).setRoomVO(roomVO);
    		itemRepository.save(itemVOList.get(i));
    	}
	    	
    	for(int i =0; i < imgTableLength; i++) {
    		roomImageRepository.saveAndFlush(roomImageVOList.get(i));
    	}

	    return "redirect:/admin/management.do";
	}
}
