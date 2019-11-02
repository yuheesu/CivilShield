package com.gsitm.ex01.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.gsitm.ex01.common.Common;
import com.gsitm.ex01.dao.BoardDao;
import com.gsitm.ex01.vo.BoardVO;
import com.gsitm.ex01.vo.OuterVO;
import com.gsitm.ex01.vo.ShelterVO;

@Service
public class BoardService {
	
	@Resource(name="boardDao")
	private BoardDao BoardDao;

	public List<BoardVO> readList(BoardVO supportModel) throws Exception{

		List<BoardVO> resultList = BoardDao.readList(supportModel);
		return resultList;
	}	
	
	public BoardVO read(BoardVO boardVO) throws Exception{
		BoardVO result = BoardDao.read(boardVO);
		return result;
	}

	public void insertShelter(ShelterVO shelterVO) throws Exception{
		BoardDao.insertShelter(shelterVO);
	}
	
	
	public ShelterVO view(ShelterVO shelterVO) throws Exception{
		ShelterVO result = BoardDao.view(shelterVO);
		return result;
		
	}
	public String getDataTableResponse(HttpServletRequest request, Common data) {
        String[] cols = { "boardSeq", "title"};
        System.out.println("들어옴");
 
        /* Response will be a String of JSONObject type */
        JSONObject result = new JSONObject();
 
        /* JSON Array to store each row of the data table */
        JSONArray array = new JSONArray();
 
        int amount = 5; /* Amount in Show Entry drop down */
        int start = 0; /* Counter for Paging, initially 0 */
        int echo = 0; /* Maintains the request number, initially 0 */
        int col = 0; /* Column number in the datatable */
 
        String boardSeq = "";
        String title = "";

 
        /* Below variables store the options to create the Query */
        String dir = "asc";
        String sStart = request.getParameter("iDisplayStart");
        String sAmount = request.getParameter("iDisplayLength");
        String sEcho = request.getParameter("sEcho");
        String sCol = request.getParameter("iSortCol_0");
        String sdir = request.getParameter("sSortDir_0");
 
        /* Below will be used when Search per column is used. In this example we are using common search. */
        boardSeq = request.getParameter("sSearch_0");
        title = request.getParameter("sSearch_1");
        
        System.out.println("server side start "+sStart);
        System.out.println("server side  sAmount "+sAmount);
        System.out.println("server side sEcho "+sEcho);
        System.out.println("server side sCol "+sCol);
        System.out.println("server side sdir "+sdir);
        System.out.println("server side sSearch "+request.getParameter("sSearch"));
 
        List<String> sArray = new ArrayList<String>();
        if (!boardSeq.equals("")) {
            String sBoardSeq = " boardSeq like '%" + boardSeq + "%'";
            sArray.add(sBoardSeq);
        }
        if (!title.isEmpty()) {
            String sTitle = " title like '%" + title + "%'";
            sArray.add(sTitle);
        }
 
//        String individualSearch = "";
//        if(sArray.size()==1)
//        {
//            individualSearch = sArray.get(0);
//        }
//        else if(sArray.size()>1)
//        {
//            for(int i=0;i<sArray.size()-1;i++)
//            {
//                individualSearch += sArray.get(i)+ " and ";
//            }
//            individualSearch += sArray.get(sArray.size()-1);
//        }
 
        /* Start value from which the records need to be fetched */
        if (sStart != null) {
            start = Integer.parseInt(sStart);
            if (start < 0)
                start = 0;
        }
 
        /* Total number of records to be fetched */
        if (sAmount != null) {
            amount = Integer.parseInt(sAmount);
            if (amount < 5 || amount > 100)
                amount = 5;
        }
 
        /* Counter of the request sent from Data table */
        if (sEcho != null) {
            echo = Integer.parseInt(sEcho);
        }
 
        /* Column number */
        if (sCol != null) {
            col = Integer.parseInt(sCol);
            if (col < 0 || col > 5)
                col = 0;
        }
 
        /* Sorting order */
        if (sdir != null) {
            if (!sdir.equals("asc"))
                dir = "desc";
        }
        String colName = cols[col];
 
        /* This is show the total count of records in Data base table */
        int total = BoardDao.count();
        
 
 
        String searchTerm = request.getParameter("sSearch");
    
 
        try {
            
            data.setAmount(amount);
            data.setCol(col);
            data.setDir(sdir);
            data.setEcho(echo);
            data.setSearchTerm(searchTerm);
            data.setStart(start);
            
            
            List<BoardVO> list=BoardDao.userList(data);
            for(BoardVO vo :list) {
                JSONArray ja = new JSONArray();
                ja.put(vo.getBoardSeq());
                ja.put(vo.getTitle());
                array.put(ja);
            }
            /* This is total number of records that is available for the specific search query */
            int totalAfterFilter =BoardDao.filterCount(data) ;
            
            
            
            result.put("iTotalRecords", total);
            result.put("iTotalDisplayRecords", totalAfterFilter);
            result.put("aaData", array);
            result.put("sEcho", echo);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return result.toString();
	}

	public List<ShelterVO> readshelter(ShelterVO supportModel) {
		List<ShelterVO> resultList = BoardDao.readshelter(supportModel);
		return resultList;
	}

	public List<ShelterVO> readChart(ShelterVO shelterVO) {
		List<ShelterVO> resultList = BoardDao.readChart(shelterVO);
		return resultList;
	}

	public List<OuterVO> readouter(OuterVO outerVO) {
		List<OuterVO> resultList = BoardDao.readouter(outerVO);
		return resultList;
	}

	public List<ShelterVO> readSeoul(ShelterVO shelterVO) {
		List<ShelterVO> resultList = BoardDao.readSeoul(shelterVO);
		return resultList;
	}	
}