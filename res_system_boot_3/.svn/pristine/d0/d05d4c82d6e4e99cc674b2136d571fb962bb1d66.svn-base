package com.gsitm.spring.room.vo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.ParamDef;

import com.gsitm.spring.co.bldg.vo.BldgVO;
import com.gsitm.spring.common.GenericClass;
import com.gsitm.spring.item.vo.ItemVO;
import com.gsitm.spring.res.vo.ResVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : RoomVO.java
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
@Table(name="TB_ROOM")
@Entity
public class RoomVO extends GenericClass {

	@ManyToOne(targetEntity=BldgVO.class, fetch=FetchType.EAGER)
	@JoinColumn(name="BLDG_NO")
	private BldgVO bldgVO;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	//@OneToMany(mappedBy="roomVO")
	@Column(name ="ROOM_NO", length=19, nullable=false)
	private Long roomNo;
	
	@Column(name ="ROOM_NM", length=255, nullable=false)
	private String roomNm;
	
	@Column(name ="ROOM_TYPE", length=1, nullable=false)
	private int roomType;
	
	@Column(name ="ROOM_EXPLAIN", length=4000)
	private String roomExplain;
	
	@Column(name ="USE_NETWORK_YN", length=1)
	private String useNetworkYn;
	
	@Column(name ="ROOM_CAPACITY", length=3, nullable=false)
	private int roomCapacity;
	
	@Column(name ="ROOM_AREA", length=3)
	private int roomArea;
	
	@Column(name ="COST_PER_HOUR", length=8)
	private int costPerHour;
	
	@OneToMany(targetEntity=RoomImageVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="ROOM_NO")
	private List<RoomImageVO> images;
	
	@OneToMany(targetEntity=ResVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="ROOM_NO")
	private List<ResVO> reses;

	@OneToMany(targetEntity=ItemVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="ROOM_NO")
	private List<ItemVO> items;
	
	@Override
	public void setId(Long id) {
		this.roomNo = id;
	}

	@Override
	public Long getId() {
		return this.roomNo;
	}
}
