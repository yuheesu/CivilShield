package com.gsitm.spring.res;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResDate {
	private Date startDt;
	private Date endDt;
	
	@Override
	public boolean equals(Object obj) {
		if(obj.getClass() == ResDate.class) {
			ResDate resDate = (ResDate) obj;
			return this.getStartDt().equals(resDate.getStartDt()) && this.getEndDt().equals(resDate.getEndDt());
		}
		return false;
	}
	
	public int getDiffDays() {
		return Math.round((endDt.getTime() - startDt.getTime()) / (1000 * 60 * 60 * 24));
	}
}
