package com.gsitm.ex01.controller;


import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.gsitm.ex01.common.Common;
import com.gsitm.ex01.service.BoardService;
import com.gsitm.ex01.vo.BoardVO;
import com.gsitm.ex01.vo.OuterVO;
import com.gsitm.ex01.vo.ShelterVO;
@Controller
public class BoardController {

	@Resource(name = "boardService")
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static RestTemplate restTemplate = new RestTemplate();
	
	   @RequestMapping(value="/shelter.do", method = RequestMethod.GET)
	   public String Info(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> param, Model model, ShelterVO shelterVO) throws Exception {
		   
			List<ShelterVO> shelterModelList = boardService.readshelter(shelterVO);

			model.addAttribute("shelterModelList", shelterModelList);
			model.addAttribute("ShelterVO", shelterVO);

			return "/shelter/boot";  
	   }
	   
	   @RequestMapping(value="/escape.do", method = RequestMethod.GET)
	   public String Info4(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> param, Model model) throws Exception {
		   


			return "/shelter/escape";  
	   }
	   
	   @RequestMapping(value="/chart.do", method = RequestMethod.GET)
	   public String Chart(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> param, Model model, ShelterVO shelterVO) throws Exception {
		   
			List<ShelterVO> shelterModelList = boardService.readChart(shelterVO);

			model.addAttribute("shelterModelList", shelterModelList);
			model.addAttribute("ShelterVO", shelterVO);

			return "/shelter/chart";  
	   }
	   
	   @RequestMapping(value="/seoul.do", method = RequestMethod.GET)
	   public String Chart2(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> param, Model model, ShelterVO shelterVO) throws Exception {
		   
			List<ShelterVO> shelterModelList = boardService.readSeoul(shelterVO);

			model.addAttribute("shelterModelList", shelterModelList);
			model.addAttribute("ShelterVO", shelterVO);

			return "/shelter/seoul";  
	   }
	   
	   @RequestMapping(value="/table.do", method = RequestMethod.GET)
	   public String Info2(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> param, Model model, ShelterVO shelterVO) throws Exception {
		   
			List<ShelterVO> shelterModelList = boardService.readshelter(shelterVO);

			model.addAttribute("shelterModelList", shelterModelList);
			model.addAttribute("ShelterVO", shelterVO);

			return "/shelter/table";  
	   }
	
	   
	   @RequestMapping(value="/table2.do", method = RequestMethod.GET)
	   public String Info3(HttpServletRequest request, HttpServletResponse response, HashMap<String, String> param, Model model, OuterVO outerVO) throws Exception {
		   
			List<OuterVO> outerModelList = boardService.readouter(outerVO);

			model.addAttribute("outerModelList", outerModelList);
			model.addAttribute("OuterVO", outerVO);

			return "/shelter/table2";  
	   }
	
	   
	      @RequestMapping(method = RequestMethod.GET, value="/api/getOpenApi")
	      private void getOpenApi(HttpServletRequest request, HttpServletResponse response) {
	         
	         String str = restTemplate.getForObject("http://data.mpss.go.kr/openapi/EarthquakeIndoors?KEY=KIHSV468520180526050255KQMTX&pIndex=4&pSize=1000", String.class, "1");
	         logger.info(str);
	         
	           InputSource is = new InputSource(new StringReader(str));
	           NodeList result = null;
	  //         List<ShelterVO> list = new ArrayList<ShelterVO>();
	           //List<ShelterVO> list2 = boardService.insertShelter(shelterVO);
	           
	           try {
	               Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
	               Node node = doc.getDocumentElement();
	               result = node.getChildNodes();
	             logger.info("node.getNodeName="+node.getNodeName());
	             logger.info("result.getLength="+result.getLength());

	               for (int i = 0; i < result.getLength(); i++) {
	                   Node tmpNode = result.item(i);
	                 logger.info("tmpNode.getNodeName()="+tmpNode.getNodeName());

	                   if (tmpNode.getNodeName().equals("row")){
	                	   ShelterVO shelterVO = new ShelterVO();
	                	   Element row = (Element)tmpNode;
	                	   //System.out.println(row.getTagName());
	                	   //System.out.println(row.getElementsByTagName("arcd").item(0).getTextContent());
	                	   shelterVO.setArcd(row.getElementsByTagName("arcd").item(0).getTextContent());
	                	   shelterVO.setCtprvnNm(row.getElementsByTagName("ctprvn_nm").item(0).getTextContent());
	                	   shelterVO.setSggNm(row.getElementsByTagName("sgg_nm").item(0).getTextContent());
	                	   shelterVO.setVtAcmdfcltyNm(row.getElementsByTagName("vt_acmdfclty_nm").item(0).getTextContent());
	                	   shelterVO.setDtlAdres(row.getElementsByTagName("dtl_adres").item(0).getTextContent());
	                	   shelterVO.setFcltyAr(row.getElementsByTagName("fclty_ar").item(0).getTextContent());
	                	   shelterVO.setXcord(row.getElementsByTagName("xcord").item(0).getTextContent());
	                	   shelterVO.setYcord(row.getElementsByTagName("ycord").item(0).getTextContent());
	                	   shelterVO.setMngpsNm(row.getElementsByTagName("mngps_nm").item(0).getTextContent());
	                	   shelterVO.setMngpsTelno(row.getElementsByTagName("mngps_telno").item(0).getTextContent());
	                	   boardService.insertShelter(shelterVO);
	                	   
	                	   
	                       
	               }
	             }   
	           } catch (Exception e) {
	              try {
	               response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            } catch (IOException e1) {
	               // TODO Auto-generated catch block
	               e1.printStackTrace();
	            }
	               e.printStackTrace();
	           }
	       }    

	   
	   @RequestMapping(value="/loadServerSideData.do", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	   @ResponseBody
	   public String loadServerSideData(HttpServletRequest request, HttpServletResponse response) {
		  System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@##########################@@@@@@@@@@@@@@@@@@@@@@@@@@");
	      Common data = new Common();
	      String jsonResponse = boardService.getDataTableResponse(request,data);
//	      response.setContentType("application/json");
//	      response.setHeader("Cache-Control", "no-store");
	      System.out.println(jsonResponse+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	      return jsonResponse;
	   }

	@RequestMapping(value="/boardDetail.do", method = RequestMethod.POST)
	public String boardDetail(Model model, BoardVO boardVO) throws Exception {
		BoardVO boardModel = boardService.read(boardVO);

		model.addAttribute("BoardVO", boardModel);
		
		return "/board/board"; 
	}
	
	@RequestMapping(value="/shelterModal.do", method = RequestMethod.GET)
	public String shelterview(Model model, ShelterVO shelterVO, int seq) throws Exception {
		System.out.println("#######sn" + seq);
		ShelterVO shelterModel = boardService.view(shelterVO);
		
		System.out.println(shelterModel);
		model.addAttribute("list", shelterModel);
		
		return "/shelter/modal"; 
	}
	

	@RequestMapping(value="/boardDetail2.do", method = RequestMethod.GET)
	public ModelAndView boardDetail2(ModelAndView mv, BoardVO boardVO) throws Exception {
		BoardVO boardModel = boardService.read(boardVO);

		mv.addObject("BoardVO", boardModel);
		mv.setViewName("/board/board");
		
		return mv;
	}
	
	
	@RequestMapping(value="/index.do", method = RequestMethod.GET)
	public String tsetindex() throws Exception {
		
		return "index"; 
	}
	

}
