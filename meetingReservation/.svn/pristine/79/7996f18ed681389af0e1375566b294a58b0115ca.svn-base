package com.gsitm.spring.co.bldg.vo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.gsitm.spring.common.GenericClass;
import com.gsitm.spring.room.vo.RoomVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : BldgVO.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Getter
@Setter
@ToString
@Table(name="TB_BUILDING")
@Entity
public class BldgVO extends GenericClass {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	//@OneToMany(mappedBy="bldgVO")
	@Column(name ="BLDG_NO", length=19, nullable=false)
	private Long bldgNo;
	
	@Column(name ="BLDG_NM", length=100, nullable=false)
	private String bldgNm;
	
	@Column(name ="LATITUDE", precision=9, scale=6, columnDefinition="NUMBER(9,6)")
	private double latitude;
	
	@Column(name ="LONGITUDE", precision=9, scale=6, columnDefinition="NUMBER(9,6)")
	private double longitude;
	
	@Column(name ="BLDG_ADDR", length=255)
	private String bldgAddr;
	
	@Column(name ="DELETE_YN", length=1, nullable=false)
	private String deleteYn = "N";

	@OneToMany(targetEntity=RoomVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="BLDG_NO")
	private List<RoomVO> rooms;
	
	@Override
	public void setId(Long id) {
		this.bldgNo = id;
	}

	@Override
	public Long getId() {
		return this.bldgNo;
	}
}
