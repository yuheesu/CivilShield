package com.gsitm.spring.common;

import java.io.IOException;
import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TimeZone;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gsitm.spring.co.bldg.vo.BldgVO;
import com.gsitm.spring.dept.vo.DeptVO;
import com.gsitm.spring.emp.vo.EmpVO;
import com.gsitm.spring.item.vo.ItemVO;
import com.gsitm.spring.res.ResDate;
import com.gsitm.spring.room.vo.RoomVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Reservation {
	private EmpVO[] empList;
	private DeptVO[] deptList;
	private BldgVO bldgVO;
	private RoomVO roomVO;
	private ItemVO[] itemList;
	private List<ResDate> resDateList;
	
	public Reservation(String data) throws JsonParseException, IOException, InstantiationException, IllegalAccessException, ParseException {
		this.empList = new EmpVO[0];
		this.deptList = new DeptVO[0];
		ObjectMapper mapper = new ObjectMapper();
		JsonFactory factory = mapper.getFactory();
		JsonParser parser = factory.createParser(data);
		JsonNode node = mapper.readTree(parser);
		Iterator<Entry<String, JsonNode>> fields = node.fields();

		while(fields.hasNext()) {
			Entry<String, JsonNode> entry = fields.next();
			String key = entry.getKey();
			switch(key) {
			case "emp":
				this.setEmpList(nodeParse(entry.getValue(), EmpVO.class));
				break;
			case "dept":
				this.setDeptList(nodeParse(entry.getValue(), DeptVO.class));
				break;
			case "bldg":
				this.setBldgVO(nodeParse(entry.getValue(), BldgVO.class)[0]);
				break;
			case "room":
				this.setRoomVO(nodeParse(entry.getValue(), RoomVO.class)[0]);
				break;
			case "item":
				this.setItemList(nodeParse(entry.getValue(), ItemVO.class));
				break;
			case "date":
				this.setResDateList(dateParse(entry.getValue()));
				break;
			}
		}
	}
	public ArrayList<ResDate> dateParse(JsonNode node) throws ParseException {
		ArrayList<ResDate> returnValue = new ArrayList<>();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		dateformat.setTimeZone(TimeZone.getTimeZone("UTC"));
		for(int i = 0; i < node.size(); i++) {
			ResDate date = new ResDate();
			date.setStartDt(dateformat.parse(node.get(i).get("startDt").asText()));
			date.setEndDt(dateformat.parse(node.get(i).get("endDt").asText()));
			returnValue.add(date);
		}
		return returnValue;
	}
	
	public <T extends GenericClass> T[] nodeParse(JsonNode node, Class<T> type) throws InstantiationException, IllegalAccessException {
		Map<Long, T> returnValue = new HashMap<Long, T>();
		for(int i = 0; i < node.size(); i++) {
			T oneAtom = type.newInstance();
			if(node.has("id")) {
				oneAtom.setId(node.get("id").asLong());
				returnValue.put(node.get("id").asLong(), oneAtom);
				break;
			}
			else {
				oneAtom.setId(node.get(i).get("id").asLong());
			}
			returnValue.put(oneAtom.getId(), oneAtom);
		}
		return returnValue.values().toArray((T[]) Array.newInstance(type, 0));
	}
}
